import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:drift/web.dart';
import 'package:http/http.dart' as http;
import 'package:sqlite3/wasm.dart';

part 'wallet_data.g.dart';

@DataClassName('Password')
class Passwords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get password => text()();
  IntColumn get idUser => integer().references(Users, #id)();
  TextColumn get webAddress => text()();
  TextColumn get descritpion => text()();
  TextColumn get login => text()();
}

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get login => text()();
  TextColumn get passwordHash => text()();
  TextColumn get salt => text()();
  BoolColumn get isPasswordKeptAsHash => boolean()();
}

@DriftDatabase(tables: [Passwords, Users])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(connectWeb());

  Future<int> addUser(UsersCompanion entry) {
    return into(users).insert(entry);
  }

  Future<User> getUserByLogin(String login) async {
    final user = await (select(users)
          ..where(
            (tbl) => tbl.login.equals(login),
          )
          ..limit(1))
        .getSingle();

    return user;
  }

  Future<int> getUserCount() async {
    final list = await select(users).get();
    return list.length;
  }

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
        if (details.wasCreated) {
          print('siemano');
        }
      },
    );
  }
}

QueryExecutor connectWeb() {
  return LazyDatabase(() async {
    return WebDatabase.withStorage(
      await DriftWebStorage.indexedDbIfSupported('12345'),
      logStatements: true,
    );
  });
}

QueryExecutor connect() {
  return LazyDatabase(() async {
    // Load wasm bundle
    final response = await http.get(Uri.parse('sqlite3.wasm'));
    // Create a virtual file system backed by IndexedDb with everything in
    // `/drift/my_app/` being persisted.
    final fs = await IndexedDbFileSystem.open(dbName: 'app.db');
    final sqlite3 = await WasmSqlite3.load(
      response.bodyBytes,
      SqliteEnvironment(fileSystem: fs),
    );

    // Then, open a database inside that persisted folder.
    return WasmDatabase(sqlite3: sqlite3, path: '/drift/my_app/app.db');
  });
}

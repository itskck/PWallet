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
  MyDatabase() : super(WebDatabase('database'));

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

  Future<int> addPassword(PasswordsCompanion entry) {
    return into(passwords).insert(entry);
  }

  Future<List<Password>> getAllUserPasswords(int userId) {
    return (select(passwords)..where((tbl) => tbl.idUser.equals(userId))).get();
  }

  void removePassword(Password password) {
    return delete(passwords).where((tbl) {
      return tbl.webAddress.equals(password.webAddress);
    });
  }

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}

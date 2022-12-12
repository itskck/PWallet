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

@DataClassName('Login')
class Logins extends Table {
  TextColumn get username => text()();
  TextColumn get ipAddress => text()();
  BoolColumn get successful => boolean()();
  DateTimeColumn get timestamp => dateTime()();
}

@DataClassName('IpAddress')
class IpAddresses extends Table {
  TextColumn get ipAddress => text()();
  IntColumn get subsequentFail => integer().withDefault(const Constant(0))();
  IntColumn get subsequentSuccess => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastSuccessfulLogin => dateTime().nullable()();
  DateTimeColumn get lastUnsuccessfulLogin => dateTime().nullable()();
  DateTimeColumn get blockedUntill => dateTime().nullable()();
  BoolColumn get permBlocked => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [Passwords, Users, Logins, IpAddresses])
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

  Future<int> updatePassword(
    String passwordHash,
    String salt,
    int userId,
  ) async {
    return (update(users)..where((tbl) => tbl.id.equals(userId))).write(
      UsersCompanion(passwordHash: Value(passwordHash), salt: Value(salt)),
    );
  }

  Future<List<User>> getAllUsers() {
    return (select(users)).get();
  }

  Future<int> addPassword(PasswordsCompanion entry) {
    return into(passwords).insert(entry);
  }

  Future<int> addIp(IpAddressesCompanion entry) {
    return into(ipAddresses).insert(entry);
  }

  Future<int> editPassword(int id, String password) {
    return (update(passwords)..where((tbl) => tbl.id.equals(id))).write(
      PasswordsCompanion(
        password: Value(password),
      ),
    );
  }

  Future<int> removePassword(int id) {
    return (delete(passwords)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<Password>> getAllUserPasswords(int userId) {
    return (select(passwords)..where((tbl) => tbl.idUser.equals(userId))).get();
  }

  Future<int> removeAllUserPasswords(int userId) {
    return (delete(passwords)..where((tbl) => tbl.idUser.equals(userId))).go();
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

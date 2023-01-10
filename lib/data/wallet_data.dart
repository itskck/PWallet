import 'package:drift/drift.dart';
import 'package:drift/web.dart';
import 'package:pwallet/utils/utils.dart';

part 'wallet_data.g.dart';

@DataClassName('Password')
class Passwords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get password => text()();
  IntColumn get idUser => integer().references(Users, #id)();
  TextColumn get webAddress => text()();
  TextColumn get descritpion => text()();
  TextColumn get login => text()();
  TextColumn get sharedFor => text().withDefault(const Constant('1,5,'))();
}

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get login => text()();
  TextColumn get passwordHash => text()();
  TextColumn get salt => text()();
  BoolColumn get isPasswordKeptAsHash => boolean()();
  TextColumn get unsuccessfulLoginDetails =>
      text().withDefault(const Constant(''))();
  TextColumn get successfulLoginDetails =>
      text().withDefault(const Constant(''))();
  DateTimeColumn get lastSuccessfulLogin => dateTime().nullable()();
  DateTimeColumn get lastUnsuccessfulLogin => dateTime().nullable()();
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

  Future<int> registerUnsuccessfulLogin(
    String ip,
    String details,
    int id,
  ) async {
    var ipAddress = await ipAddressByIp(ip);

    if (ipAddress == null) {
      await addIp(
        IpAddressesCompanion.insert(ipAddress: ip),
      );
    }

    ipAddress = await ipAddressByIp(ip);

    late DateTime? blockedUntill = DateTime.now();
    if (ipAddress!.subsequentFail + 1 == 1) {
      showBadToast(
        'Wrong login or password. Next time there will be a blockade.',
      );
    } else if (ipAddress.subsequentFail + 1 == 2) {
      blockedUntill = blockedUntill.add(const Duration(seconds: 5));
      showBadToast('Wrong login or password. Account blocked for 5 seconds.');
    } else if (ipAddress.subsequentFail + 1 == 3) {
      blockedUntill = blockedUntill.add(const Duration(seconds: 10));
      showBadToast('Wrong login or password. Account blocked for 10 seconds.');
    } else if (ipAddress.subsequentFail + 1 == 4) {
      blockedUntill = blockedUntill.add(const Duration(minutes: 1));
      showBadToast('Wrong login or password. Account blocked for 1 minute.');
    } else if (ipAddress.subsequentFail + 1 > 4) {
      blockedUntill = blockedUntill.add(const Duration(days: 999));
      showBadToast('Wrong login or password. Account blocked for 999 days.');
    } else {
      blockedUntill = null;
    }
    await (update(users)..where((tbl) => tbl.id.equals(id))).write(
      UsersCompanion(
        unsuccessfulLoginDetails: Value(details),
        lastUnsuccessfulLogin: Value(DateTime.now()),
      ),
    );

    return (update(ipAddresses)..where((tbl) => tbl.ipAddress.equals(ip)))
        .write(
      IpAddressesCompanion(
        subsequentFail: Value(ipAddress.subsequentFail + 1),
        subsequentSuccess: const Value(0),
        lastUnsuccessfulLogin: Value(DateTime.now()),
        blockedUntill: Value(blockedUntill),
      ),
    );
  }

  Future<int> registerSuccessfulLogin(String ip, int id, String details) async {
    var ipAddress = await ipAddressByIp(ip);

    if (ipAddress == null) {
      await addIp(
        IpAddressesCompanion.insert(ipAddress: ip),
      );
    }

    ipAddress = await ipAddressByIp(ip);

    await (update(users)..where((tbl) => tbl.id.equals(id))).write(
      UsersCompanion(
        successfulLoginDetails: Value(details),
        lastSuccessfulLogin: Value(DateTime.now()),
      ),
    );

    return (update(ipAddresses)..where((tbl) => tbl.ipAddress.equals(ip)))
        .write(
      IpAddressesCompanion(
        subsequentFail: const Value(0),
        subsequentSuccess: Value(ipAddress!.subsequentSuccess + 1),
        lastSuccessfulLogin: Value(DateTime.now()),
      ),
    );
  }

  Future<int> resetIpAddress(String ip) async {
    return (update(ipAddresses)..where((tbl) => tbl.ipAddress.equals(ip)))
        .write(
      const IpAddressesCompanion(
        subsequentFail: Value(0),
        subsequentSuccess: Value(0),
        blockedUntill: Value(null),
      ),
    );
  }

  Future<IpAddress?> ipAddressByIp(String ip) =>
      (select(ipAddresses)..where((tbl) => tbl.ipAddress.equals(ip)))
          .getSingleOrNull();

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

  Future<List<Password>> getAllUserPasswords(int userId) async {
    final List<Password> userPasswords = await (select(passwords)
          ..where((tbl) => tbl.idUser.equals(userId)))
        .get();
    final List<Password> allPasswords = await select(passwords).get();
    final usersharedPasswords = allPasswords
        .where(
          (element) => element.sharedFor.split(',').any(
                (e) => e == userId.toString(),
              ),
        )
        .toList();
    print('user passwords = $userPasswords');
    print('shared passwords = $usersharedPasswords');
    return [...userPasswords, ...usersharedPasswords];
  }

  Future<String> getOwnerSalt(int ownerId) async {
    List<User> users = await getAllUsers();
    return users.singleWhere((element) => element.id == ownerId).salt;
  }

  Future<int> removeAllUserPasswords(int userId) {
    return (delete(passwords)..where((tbl) => tbl.idUser.equals(userId))).go();
  }

  Future<String> getSharedUsers(int passwordId) async {
    final password = await (select(passwords)
          ..where(
            (tbl) => tbl.id.equals(passwordId),
          ))
        .getSingle();
    return password.sharedFor;
  }

  Future<void> editSharedUsers(int passwordId, String sharedFor) async {
    await (update(passwords)..where((tbl) => tbl.id.equals(passwordId))).write(
      PasswordsCompanion(
        sharedFor: Value(sharedFor),
      ),
    );
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

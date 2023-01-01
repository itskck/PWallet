// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_data.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class User extends DataClass implements Insertable<User> {
  final int id;
  final String login;
  final String passwordHash;
  final String salt;
  final bool isPasswordKeptAsHash;
  final String unsuccessfulLoginDetails;
  final String successfulLoginDetails;
  final DateTime? lastSuccessfulLogin;
  final DateTime? lastUnsuccessfulLogin;
  const User(
      {required this.id,
      required this.login,
      required this.passwordHash,
      required this.salt,
      required this.isPasswordKeptAsHash,
      required this.unsuccessfulLoginDetails,
      required this.successfulLoginDetails,
      this.lastSuccessfulLogin,
      this.lastUnsuccessfulLogin});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['login'] = Variable<String>(login);
    map['password_hash'] = Variable<String>(passwordHash);
    map['salt'] = Variable<String>(salt);
    map['is_password_kept_as_hash'] = Variable<bool>(isPasswordKeptAsHash);
    map['unsuccessful_login_details'] =
        Variable<String>(unsuccessfulLoginDetails);
    map['successful_login_details'] = Variable<String>(successfulLoginDetails);
    if (!nullToAbsent || lastSuccessfulLogin != null) {
      map['last_successful_login'] = Variable<DateTime>(lastSuccessfulLogin);
    }
    if (!nullToAbsent || lastUnsuccessfulLogin != null) {
      map['last_unsuccessful_login'] =
          Variable<DateTime>(lastUnsuccessfulLogin);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      login: Value(login),
      passwordHash: Value(passwordHash),
      salt: Value(salt),
      isPasswordKeptAsHash: Value(isPasswordKeptAsHash),
      unsuccessfulLoginDetails: Value(unsuccessfulLoginDetails),
      successfulLoginDetails: Value(successfulLoginDetails),
      lastSuccessfulLogin: lastSuccessfulLogin == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSuccessfulLogin),
      lastUnsuccessfulLogin: lastUnsuccessfulLogin == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUnsuccessfulLogin),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      login: serializer.fromJson<String>(json['login']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      salt: serializer.fromJson<String>(json['salt']),
      isPasswordKeptAsHash:
          serializer.fromJson<bool>(json['isPasswordKeptAsHash']),
      unsuccessfulLoginDetails:
          serializer.fromJson<String>(json['unsuccessfulLoginDetails']),
      successfulLoginDetails:
          serializer.fromJson<String>(json['successfulLoginDetails']),
      lastSuccessfulLogin:
          serializer.fromJson<DateTime?>(json['lastSuccessfulLogin']),
      lastUnsuccessfulLogin:
          serializer.fromJson<DateTime?>(json['lastUnsuccessfulLogin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'login': serializer.toJson<String>(login),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'salt': serializer.toJson<String>(salt),
      'isPasswordKeptAsHash': serializer.toJson<bool>(isPasswordKeptAsHash),
      'unsuccessfulLoginDetails':
          serializer.toJson<String>(unsuccessfulLoginDetails),
      'successfulLoginDetails':
          serializer.toJson<String>(successfulLoginDetails),
      'lastSuccessfulLogin': serializer.toJson<DateTime?>(lastSuccessfulLogin),
      'lastUnsuccessfulLogin':
          serializer.toJson<DateTime?>(lastUnsuccessfulLogin),
    };
  }

  User copyWith(
          {int? id,
          String? login,
          String? passwordHash,
          String? salt,
          bool? isPasswordKeptAsHash,
          String? unsuccessfulLoginDetails,
          String? successfulLoginDetails,
          Value<DateTime?> lastSuccessfulLogin = const Value.absent(),
          Value<DateTime?> lastUnsuccessfulLogin = const Value.absent()}) =>
      User(
        id: id ?? this.id,
        login: login ?? this.login,
        passwordHash: passwordHash ?? this.passwordHash,
        salt: salt ?? this.salt,
        isPasswordKeptAsHash: isPasswordKeptAsHash ?? this.isPasswordKeptAsHash,
        unsuccessfulLoginDetails:
            unsuccessfulLoginDetails ?? this.unsuccessfulLoginDetails,
        successfulLoginDetails:
            successfulLoginDetails ?? this.successfulLoginDetails,
        lastSuccessfulLogin: lastSuccessfulLogin.present
            ? lastSuccessfulLogin.value
            : this.lastSuccessfulLogin,
        lastUnsuccessfulLogin: lastUnsuccessfulLogin.present
            ? lastUnsuccessfulLogin.value
            : this.lastUnsuccessfulLogin,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('salt: $salt, ')
          ..write('isPasswordKeptAsHash: $isPasswordKeptAsHash, ')
          ..write('unsuccessfulLoginDetails: $unsuccessfulLoginDetails, ')
          ..write('successfulLoginDetails: $successfulLoginDetails, ')
          ..write('lastSuccessfulLogin: $lastSuccessfulLogin, ')
          ..write('lastUnsuccessfulLogin: $lastUnsuccessfulLogin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      login,
      passwordHash,
      salt,
      isPasswordKeptAsHash,
      unsuccessfulLoginDetails,
      successfulLoginDetails,
      lastSuccessfulLogin,
      lastUnsuccessfulLogin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.login == this.login &&
          other.passwordHash == this.passwordHash &&
          other.salt == this.salt &&
          other.isPasswordKeptAsHash == this.isPasswordKeptAsHash &&
          other.unsuccessfulLoginDetails == this.unsuccessfulLoginDetails &&
          other.successfulLoginDetails == this.successfulLoginDetails &&
          other.lastSuccessfulLogin == this.lastSuccessfulLogin &&
          other.lastUnsuccessfulLogin == this.lastUnsuccessfulLogin);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> login;
  final Value<String> passwordHash;
  final Value<String> salt;
  final Value<bool> isPasswordKeptAsHash;
  final Value<String> unsuccessfulLoginDetails;
  final Value<String> successfulLoginDetails;
  final Value<DateTime?> lastSuccessfulLogin;
  final Value<DateTime?> lastUnsuccessfulLogin;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.login = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.salt = const Value.absent(),
    this.isPasswordKeptAsHash = const Value.absent(),
    this.unsuccessfulLoginDetails = const Value.absent(),
    this.successfulLoginDetails = const Value.absent(),
    this.lastSuccessfulLogin = const Value.absent(),
    this.lastUnsuccessfulLogin = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String login,
    required String passwordHash,
    required String salt,
    required bool isPasswordKeptAsHash,
    this.unsuccessfulLoginDetails = const Value.absent(),
    this.successfulLoginDetails = const Value.absent(),
    this.lastSuccessfulLogin = const Value.absent(),
    this.lastUnsuccessfulLogin = const Value.absent(),
  })  : login = Value(login),
        passwordHash = Value(passwordHash),
        salt = Value(salt),
        isPasswordKeptAsHash = Value(isPasswordKeptAsHash);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? login,
    Expression<String>? passwordHash,
    Expression<String>? salt,
    Expression<bool>? isPasswordKeptAsHash,
    Expression<String>? unsuccessfulLoginDetails,
    Expression<String>? successfulLoginDetails,
    Expression<DateTime>? lastSuccessfulLogin,
    Expression<DateTime>? lastUnsuccessfulLogin,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (login != null) 'login': login,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (salt != null) 'salt': salt,
      if (isPasswordKeptAsHash != null)
        'is_password_kept_as_hash': isPasswordKeptAsHash,
      if (unsuccessfulLoginDetails != null)
        'unsuccessful_login_details': unsuccessfulLoginDetails,
      if (successfulLoginDetails != null)
        'successful_login_details': successfulLoginDetails,
      if (lastSuccessfulLogin != null)
        'last_successful_login': lastSuccessfulLogin,
      if (lastUnsuccessfulLogin != null)
        'last_unsuccessful_login': lastUnsuccessfulLogin,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? login,
      Value<String>? passwordHash,
      Value<String>? salt,
      Value<bool>? isPasswordKeptAsHash,
      Value<String>? unsuccessfulLoginDetails,
      Value<String>? successfulLoginDetails,
      Value<DateTime?>? lastSuccessfulLogin,
      Value<DateTime?>? lastUnsuccessfulLogin}) {
    return UsersCompanion(
      id: id ?? this.id,
      login: login ?? this.login,
      passwordHash: passwordHash ?? this.passwordHash,
      salt: salt ?? this.salt,
      isPasswordKeptAsHash: isPasswordKeptAsHash ?? this.isPasswordKeptAsHash,
      unsuccessfulLoginDetails:
          unsuccessfulLoginDetails ?? this.unsuccessfulLoginDetails,
      successfulLoginDetails:
          successfulLoginDetails ?? this.successfulLoginDetails,
      lastSuccessfulLogin: lastSuccessfulLogin ?? this.lastSuccessfulLogin,
      lastUnsuccessfulLogin:
          lastUnsuccessfulLogin ?? this.lastUnsuccessfulLogin,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (salt.present) {
      map['salt'] = Variable<String>(salt.value);
    }
    if (isPasswordKeptAsHash.present) {
      map['is_password_kept_as_hash'] =
          Variable<bool>(isPasswordKeptAsHash.value);
    }
    if (unsuccessfulLoginDetails.present) {
      map['unsuccessful_login_details'] =
          Variable<String>(unsuccessfulLoginDetails.value);
    }
    if (successfulLoginDetails.present) {
      map['successful_login_details'] =
          Variable<String>(successfulLoginDetails.value);
    }
    if (lastSuccessfulLogin.present) {
      map['last_successful_login'] =
          Variable<DateTime>(lastSuccessfulLogin.value);
    }
    if (lastUnsuccessfulLogin.present) {
      map['last_unsuccessful_login'] =
          Variable<DateTime>(lastUnsuccessfulLogin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('salt: $salt, ')
          ..write('isPasswordKeptAsHash: $isPasswordKeptAsHash, ')
          ..write('unsuccessfulLoginDetails: $unsuccessfulLoginDetails, ')
          ..write('successfulLoginDetails: $successfulLoginDetails, ')
          ..write('lastSuccessfulLogin: $lastSuccessfulLogin, ')
          ..write('lastUnsuccessfulLogin: $lastUnsuccessfulLogin')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
      'login', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _passwordHashMeta =
      const VerificationMeta('passwordHash');
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
      'password_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _saltMeta = const VerificationMeta('salt');
  @override
  late final GeneratedColumn<String> salt = GeneratedColumn<String>(
      'salt', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _isPasswordKeptAsHashMeta =
      const VerificationMeta('isPasswordKeptAsHash');
  @override
  late final GeneratedColumn<bool> isPasswordKeptAsHash = GeneratedColumn<bool>(
      'is_password_kept_as_hash', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("is_password_kept_as_hash" IN (0, 1))');
  final VerificationMeta _unsuccessfulLoginDetailsMeta =
      const VerificationMeta('unsuccessfulLoginDetails');
  @override
  late final GeneratedColumn<String> unsuccessfulLoginDetails =
      GeneratedColumn<String>('unsuccessful_login_details', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant(''));
  final VerificationMeta _successfulLoginDetailsMeta =
      const VerificationMeta('successfulLoginDetails');
  @override
  late final GeneratedColumn<String> successfulLoginDetails =
      GeneratedColumn<String>('successful_login_details', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant(''));
  final VerificationMeta _lastSuccessfulLoginMeta =
      const VerificationMeta('lastSuccessfulLogin');
  @override
  late final GeneratedColumn<DateTime> lastSuccessfulLogin =
      GeneratedColumn<DateTime>('last_successful_login', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _lastUnsuccessfulLoginMeta =
      const VerificationMeta('lastUnsuccessfulLogin');
  @override
  late final GeneratedColumn<DateTime> lastUnsuccessfulLogin =
      GeneratedColumn<DateTime>('last_unsuccessful_login', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        login,
        passwordHash,
        salt,
        isPasswordKeptAsHash,
        unsuccessfulLoginDetails,
        successfulLoginDetails,
        lastSuccessfulLogin,
        lastUnsuccessfulLogin
      ];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('login')) {
      context.handle(
          _loginMeta, login.isAcceptableOrUnknown(data['login']!, _loginMeta));
    } else if (isInserting) {
      context.missing(_loginMeta);
    }
    if (data.containsKey('password_hash')) {
      context.handle(
          _passwordHashMeta,
          passwordHash.isAcceptableOrUnknown(
              data['password_hash']!, _passwordHashMeta));
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('salt')) {
      context.handle(
          _saltMeta, salt.isAcceptableOrUnknown(data['salt']!, _saltMeta));
    } else if (isInserting) {
      context.missing(_saltMeta);
    }
    if (data.containsKey('is_password_kept_as_hash')) {
      context.handle(
          _isPasswordKeptAsHashMeta,
          isPasswordKeptAsHash.isAcceptableOrUnknown(
              data['is_password_kept_as_hash']!, _isPasswordKeptAsHashMeta));
    } else if (isInserting) {
      context.missing(_isPasswordKeptAsHashMeta);
    }
    if (data.containsKey('unsuccessful_login_details')) {
      context.handle(
          _unsuccessfulLoginDetailsMeta,
          unsuccessfulLoginDetails.isAcceptableOrUnknown(
              data['unsuccessful_login_details']!,
              _unsuccessfulLoginDetailsMeta));
    }
    if (data.containsKey('successful_login_details')) {
      context.handle(
          _successfulLoginDetailsMeta,
          successfulLoginDetails.isAcceptableOrUnknown(
              data['successful_login_details']!, _successfulLoginDetailsMeta));
    }
    if (data.containsKey('last_successful_login')) {
      context.handle(
          _lastSuccessfulLoginMeta,
          lastSuccessfulLogin.isAcceptableOrUnknown(
              data['last_successful_login']!, _lastSuccessfulLoginMeta));
    }
    if (data.containsKey('last_unsuccessful_login')) {
      context.handle(
          _lastUnsuccessfulLoginMeta,
          lastUnsuccessfulLogin.isAcceptableOrUnknown(
              data['last_unsuccessful_login']!, _lastUnsuccessfulLoginMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      login: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}login'])!,
      passwordHash: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}password_hash'])!,
      salt: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}salt'])!,
      isPasswordKeptAsHash: attachedDatabase.options.types.read(
          DriftSqlType.bool,
          data['${effectivePrefix}is_password_kept_as_hash'])!,
      unsuccessfulLoginDetails: attachedDatabase.options.types.read(
          DriftSqlType.string,
          data['${effectivePrefix}unsuccessful_login_details'])!,
      successfulLoginDetails: attachedDatabase.options.types.read(
          DriftSqlType.string,
          data['${effectivePrefix}successful_login_details'])!,
      lastSuccessfulLogin: attachedDatabase.options.types.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}last_successful_login']),
      lastUnsuccessfulLogin: attachedDatabase.options.types.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}last_unsuccessful_login']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class Password extends DataClass implements Insertable<Password> {
  final int id;
  final String password;
  final int idUser;
  final String webAddress;
  final String descritpion;
  final String login;
  final String? sharedFor;
  const Password(
      {required this.id,
      required this.password,
      required this.idUser,
      required this.webAddress,
      required this.descritpion,
      required this.login,
      this.sharedFor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['password'] = Variable<String>(password);
    map['id_user'] = Variable<int>(idUser);
    map['web_address'] = Variable<String>(webAddress);
    map['descritpion'] = Variable<String>(descritpion);
    map['login'] = Variable<String>(login);
    if (!nullToAbsent || sharedFor != null) {
      map['shared_for'] = Variable<String>(sharedFor);
    }
    return map;
  }

  PasswordsCompanion toCompanion(bool nullToAbsent) {
    return PasswordsCompanion(
      id: Value(id),
      password: Value(password),
      idUser: Value(idUser),
      webAddress: Value(webAddress),
      descritpion: Value(descritpion),
      login: Value(login),
      sharedFor: sharedFor == null && nullToAbsent
          ? const Value.absent()
          : Value(sharedFor),
    );
  }

  factory Password.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Password(
      id: serializer.fromJson<int>(json['id']),
      password: serializer.fromJson<String>(json['password']),
      idUser: serializer.fromJson<int>(json['idUser']),
      webAddress: serializer.fromJson<String>(json['webAddress']),
      descritpion: serializer.fromJson<String>(json['descritpion']),
      login: serializer.fromJson<String>(json['login']),
      sharedFor: serializer.fromJson<String?>(json['sharedFor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'password': serializer.toJson<String>(password),
      'idUser': serializer.toJson<int>(idUser),
      'webAddress': serializer.toJson<String>(webAddress),
      'descritpion': serializer.toJson<String>(descritpion),
      'login': serializer.toJson<String>(login),
      'sharedFor': serializer.toJson<String?>(sharedFor),
    };
  }

  Password copyWith(
          {int? id,
          String? password,
          int? idUser,
          String? webAddress,
          String? descritpion,
          String? login,
          Value<String?> sharedFor = const Value.absent()}) =>
      Password(
        id: id ?? this.id,
        password: password ?? this.password,
        idUser: idUser ?? this.idUser,
        webAddress: webAddress ?? this.webAddress,
        descritpion: descritpion ?? this.descritpion,
        login: login ?? this.login,
        sharedFor: sharedFor.present ? sharedFor.value : this.sharedFor,
      );
  @override
  String toString() {
    return (StringBuffer('Password(')
          ..write('id: $id, ')
          ..write('password: $password, ')
          ..write('idUser: $idUser, ')
          ..write('webAddress: $webAddress, ')
          ..write('descritpion: $descritpion, ')
          ..write('login: $login, ')
          ..write('sharedFor: $sharedFor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, password, idUser, webAddress, descritpion, login, sharedFor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Password &&
          other.id == this.id &&
          other.password == this.password &&
          other.idUser == this.idUser &&
          other.webAddress == this.webAddress &&
          other.descritpion == this.descritpion &&
          other.login == this.login &&
          other.sharedFor == this.sharedFor);
}

class PasswordsCompanion extends UpdateCompanion<Password> {
  final Value<int> id;
  final Value<String> password;
  final Value<int> idUser;
  final Value<String> webAddress;
  final Value<String> descritpion;
  final Value<String> login;
  final Value<String?> sharedFor;
  const PasswordsCompanion({
    this.id = const Value.absent(),
    this.password = const Value.absent(),
    this.idUser = const Value.absent(),
    this.webAddress = const Value.absent(),
    this.descritpion = const Value.absent(),
    this.login = const Value.absent(),
    this.sharedFor = const Value.absent(),
  });
  PasswordsCompanion.insert({
    this.id = const Value.absent(),
    required String password,
    required int idUser,
    required String webAddress,
    required String descritpion,
    required String login,
    this.sharedFor = const Value.absent(),
  })  : password = Value(password),
        idUser = Value(idUser),
        webAddress = Value(webAddress),
        descritpion = Value(descritpion),
        login = Value(login);
  static Insertable<Password> custom({
    Expression<int>? id,
    Expression<String>? password,
    Expression<int>? idUser,
    Expression<String>? webAddress,
    Expression<String>? descritpion,
    Expression<String>? login,
    Expression<String>? sharedFor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (password != null) 'password': password,
      if (idUser != null) 'id_user': idUser,
      if (webAddress != null) 'web_address': webAddress,
      if (descritpion != null) 'descritpion': descritpion,
      if (login != null) 'login': login,
      if (sharedFor != null) 'shared_for': sharedFor,
    });
  }

  PasswordsCompanion copyWith(
      {Value<int>? id,
      Value<String>? password,
      Value<int>? idUser,
      Value<String>? webAddress,
      Value<String>? descritpion,
      Value<String>? login,
      Value<String?>? sharedFor}) {
    return PasswordsCompanion(
      id: id ?? this.id,
      password: password ?? this.password,
      idUser: idUser ?? this.idUser,
      webAddress: webAddress ?? this.webAddress,
      descritpion: descritpion ?? this.descritpion,
      login: login ?? this.login,
      sharedFor: sharedFor ?? this.sharedFor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (idUser.present) {
      map['id_user'] = Variable<int>(idUser.value);
    }
    if (webAddress.present) {
      map['web_address'] = Variable<String>(webAddress.value);
    }
    if (descritpion.present) {
      map['descritpion'] = Variable<String>(descritpion.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (sharedFor.present) {
      map['shared_for'] = Variable<String>(sharedFor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PasswordsCompanion(')
          ..write('id: $id, ')
          ..write('password: $password, ')
          ..write('idUser: $idUser, ')
          ..write('webAddress: $webAddress, ')
          ..write('descritpion: $descritpion, ')
          ..write('login: $login, ')
          ..write('sharedFor: $sharedFor')
          ..write(')'))
        .toString();
  }
}

class $PasswordsTable extends Passwords
    with TableInfo<$PasswordsTable, Password> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PasswordsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _idUserMeta = const VerificationMeta('idUser');
  @override
  late final GeneratedColumn<int> idUser = GeneratedColumn<int>(
      'id_user', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES "users" ("id")');
  final VerificationMeta _webAddressMeta = const VerificationMeta('webAddress');
  @override
  late final GeneratedColumn<String> webAddress = GeneratedColumn<String>(
      'web_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _descritpionMeta =
      const VerificationMeta('descritpion');
  @override
  late final GeneratedColumn<String> descritpion = GeneratedColumn<String>(
      'descritpion', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
      'login', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _sharedForMeta = const VerificationMeta('sharedFor');
  @override
  late final GeneratedColumn<String> sharedFor = GeneratedColumn<String>(
      'shared_for', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, password, idUser, webAddress, descritpion, login, sharedFor];
  @override
  String get aliasedName => _alias ?? 'passwords';
  @override
  String get actualTableName => 'passwords';
  @override
  VerificationContext validateIntegrity(Insertable<Password> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('id_user')) {
      context.handle(_idUserMeta,
          idUser.isAcceptableOrUnknown(data['id_user']!, _idUserMeta));
    } else if (isInserting) {
      context.missing(_idUserMeta);
    }
    if (data.containsKey('web_address')) {
      context.handle(
          _webAddressMeta,
          webAddress.isAcceptableOrUnknown(
              data['web_address']!, _webAddressMeta));
    } else if (isInserting) {
      context.missing(_webAddressMeta);
    }
    if (data.containsKey('descritpion')) {
      context.handle(
          _descritpionMeta,
          descritpion.isAcceptableOrUnknown(
              data['descritpion']!, _descritpionMeta));
    } else if (isInserting) {
      context.missing(_descritpionMeta);
    }
    if (data.containsKey('login')) {
      context.handle(
          _loginMeta, login.isAcceptableOrUnknown(data['login']!, _loginMeta));
    } else if (isInserting) {
      context.missing(_loginMeta);
    }
    if (data.containsKey('shared_for')) {
      context.handle(_sharedForMeta,
          sharedFor.isAcceptableOrUnknown(data['shared_for']!, _sharedForMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Password map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Password(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      password: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      idUser: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id_user'])!,
      webAddress: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}web_address'])!,
      descritpion: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}descritpion'])!,
      login: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}login'])!,
      sharedFor: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}shared_for']),
    );
  }

  @override
  $PasswordsTable createAlias(String alias) {
    return $PasswordsTable(attachedDatabase, alias);
  }
}

class Login extends DataClass implements Insertable<Login> {
  final String username;
  final String ipAddress;
  final bool successful;
  final DateTime timestamp;
  const Login(
      {required this.username,
      required this.ipAddress,
      required this.successful,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['username'] = Variable<String>(username);
    map['ip_address'] = Variable<String>(ipAddress);
    map['successful'] = Variable<bool>(successful);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  LoginsCompanion toCompanion(bool nullToAbsent) {
    return LoginsCompanion(
      username: Value(username),
      ipAddress: Value(ipAddress),
      successful: Value(successful),
      timestamp: Value(timestamp),
    );
  }

  factory Login.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Login(
      username: serializer.fromJson<String>(json['username']),
      ipAddress: serializer.fromJson<String>(json['ipAddress']),
      successful: serializer.fromJson<bool>(json['successful']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'username': serializer.toJson<String>(username),
      'ipAddress': serializer.toJson<String>(ipAddress),
      'successful': serializer.toJson<bool>(successful),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  Login copyWith(
          {String? username,
          String? ipAddress,
          bool? successful,
          DateTime? timestamp}) =>
      Login(
        username: username ?? this.username,
        ipAddress: ipAddress ?? this.ipAddress,
        successful: successful ?? this.successful,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('Login(')
          ..write('username: $username, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('successful: $successful, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(username, ipAddress, successful, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Login &&
          other.username == this.username &&
          other.ipAddress == this.ipAddress &&
          other.successful == this.successful &&
          other.timestamp == this.timestamp);
}

class LoginsCompanion extends UpdateCompanion<Login> {
  final Value<String> username;
  final Value<String> ipAddress;
  final Value<bool> successful;
  final Value<DateTime> timestamp;
  const LoginsCompanion({
    this.username = const Value.absent(),
    this.ipAddress = const Value.absent(),
    this.successful = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  LoginsCompanion.insert({
    required String username,
    required String ipAddress,
    required bool successful,
    required DateTime timestamp,
  })  : username = Value(username),
        ipAddress = Value(ipAddress),
        successful = Value(successful),
        timestamp = Value(timestamp);
  static Insertable<Login> custom({
    Expression<String>? username,
    Expression<String>? ipAddress,
    Expression<bool>? successful,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (username != null) 'username': username,
      if (ipAddress != null) 'ip_address': ipAddress,
      if (successful != null) 'successful': successful,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  LoginsCompanion copyWith(
      {Value<String>? username,
      Value<String>? ipAddress,
      Value<bool>? successful,
      Value<DateTime>? timestamp}) {
    return LoginsCompanion(
      username: username ?? this.username,
      ipAddress: ipAddress ?? this.ipAddress,
      successful: successful ?? this.successful,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (ipAddress.present) {
      map['ip_address'] = Variable<String>(ipAddress.value);
    }
    if (successful.present) {
      map['successful'] = Variable<bool>(successful.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoginsCompanion(')
          ..write('username: $username, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('successful: $successful, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $LoginsTable extends Logins with TableInfo<$LoginsTable, Login> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoginsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _ipAddressMeta = const VerificationMeta('ipAddress');
  @override
  late final GeneratedColumn<String> ipAddress = GeneratedColumn<String>(
      'ip_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _successfulMeta = const VerificationMeta('successful');
  @override
  late final GeneratedColumn<bool> successful = GeneratedColumn<bool>(
      'successful', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("successful" IN (0, 1))');
  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [username, ipAddress, successful, timestamp];
  @override
  String get aliasedName => _alias ?? 'logins';
  @override
  String get actualTableName => 'logins';
  @override
  VerificationContext validateIntegrity(Insertable<Login> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('ip_address')) {
      context.handle(_ipAddressMeta,
          ipAddress.isAcceptableOrUnknown(data['ip_address']!, _ipAddressMeta));
    } else if (isInserting) {
      context.missing(_ipAddressMeta);
    }
    if (data.containsKey('successful')) {
      context.handle(
          _successfulMeta,
          successful.isAcceptableOrUnknown(
              data['successful']!, _successfulMeta));
    } else if (isInserting) {
      context.missing(_successfulMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Login map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Login(
      username: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      ipAddress: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}ip_address'])!,
      successful: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}successful'])!,
      timestamp: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $LoginsTable createAlias(String alias) {
    return $LoginsTable(attachedDatabase, alias);
  }
}

class IpAddress extends DataClass implements Insertable<IpAddress> {
  final String ipAddress;
  final int subsequentFail;
  final int subsequentSuccess;
  final DateTime? lastSuccessfulLogin;
  final DateTime? lastUnsuccessfulLogin;
  final DateTime? blockedUntill;
  final bool permBlocked;
  const IpAddress(
      {required this.ipAddress,
      required this.subsequentFail,
      required this.subsequentSuccess,
      this.lastSuccessfulLogin,
      this.lastUnsuccessfulLogin,
      this.blockedUntill,
      required this.permBlocked});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ip_address'] = Variable<String>(ipAddress);
    map['subsequent_fail'] = Variable<int>(subsequentFail);
    map['subsequent_success'] = Variable<int>(subsequentSuccess);
    if (!nullToAbsent || lastSuccessfulLogin != null) {
      map['last_successful_login'] = Variable<DateTime>(lastSuccessfulLogin);
    }
    if (!nullToAbsent || lastUnsuccessfulLogin != null) {
      map['last_unsuccessful_login'] =
          Variable<DateTime>(lastUnsuccessfulLogin);
    }
    if (!nullToAbsent || blockedUntill != null) {
      map['blocked_untill'] = Variable<DateTime>(blockedUntill);
    }
    map['perm_blocked'] = Variable<bool>(permBlocked);
    return map;
  }

  IpAddressesCompanion toCompanion(bool nullToAbsent) {
    return IpAddressesCompanion(
      ipAddress: Value(ipAddress),
      subsequentFail: Value(subsequentFail),
      subsequentSuccess: Value(subsequentSuccess),
      lastSuccessfulLogin: lastSuccessfulLogin == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSuccessfulLogin),
      lastUnsuccessfulLogin: lastUnsuccessfulLogin == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUnsuccessfulLogin),
      blockedUntill: blockedUntill == null && nullToAbsent
          ? const Value.absent()
          : Value(blockedUntill),
      permBlocked: Value(permBlocked),
    );
  }

  factory IpAddress.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IpAddress(
      ipAddress: serializer.fromJson<String>(json['ipAddress']),
      subsequentFail: serializer.fromJson<int>(json['subsequentFail']),
      subsequentSuccess: serializer.fromJson<int>(json['subsequentSuccess']),
      lastSuccessfulLogin:
          serializer.fromJson<DateTime?>(json['lastSuccessfulLogin']),
      lastUnsuccessfulLogin:
          serializer.fromJson<DateTime?>(json['lastUnsuccessfulLogin']),
      blockedUntill: serializer.fromJson<DateTime?>(json['blockedUntill']),
      permBlocked: serializer.fromJson<bool>(json['permBlocked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ipAddress': serializer.toJson<String>(ipAddress),
      'subsequentFail': serializer.toJson<int>(subsequentFail),
      'subsequentSuccess': serializer.toJson<int>(subsequentSuccess),
      'lastSuccessfulLogin': serializer.toJson<DateTime?>(lastSuccessfulLogin),
      'lastUnsuccessfulLogin':
          serializer.toJson<DateTime?>(lastUnsuccessfulLogin),
      'blockedUntill': serializer.toJson<DateTime?>(blockedUntill),
      'permBlocked': serializer.toJson<bool>(permBlocked),
    };
  }

  IpAddress copyWith(
          {String? ipAddress,
          int? subsequentFail,
          int? subsequentSuccess,
          Value<DateTime?> lastSuccessfulLogin = const Value.absent(),
          Value<DateTime?> lastUnsuccessfulLogin = const Value.absent(),
          Value<DateTime?> blockedUntill = const Value.absent(),
          bool? permBlocked}) =>
      IpAddress(
        ipAddress: ipAddress ?? this.ipAddress,
        subsequentFail: subsequentFail ?? this.subsequentFail,
        subsequentSuccess: subsequentSuccess ?? this.subsequentSuccess,
        lastSuccessfulLogin: lastSuccessfulLogin.present
            ? lastSuccessfulLogin.value
            : this.lastSuccessfulLogin,
        lastUnsuccessfulLogin: lastUnsuccessfulLogin.present
            ? lastUnsuccessfulLogin.value
            : this.lastUnsuccessfulLogin,
        blockedUntill:
            blockedUntill.present ? blockedUntill.value : this.blockedUntill,
        permBlocked: permBlocked ?? this.permBlocked,
      );
  @override
  String toString() {
    return (StringBuffer('IpAddress(')
          ..write('ipAddress: $ipAddress, ')
          ..write('subsequentFail: $subsequentFail, ')
          ..write('subsequentSuccess: $subsequentSuccess, ')
          ..write('lastSuccessfulLogin: $lastSuccessfulLogin, ')
          ..write('lastUnsuccessfulLogin: $lastUnsuccessfulLogin, ')
          ..write('blockedUntill: $blockedUntill, ')
          ..write('permBlocked: $permBlocked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(ipAddress, subsequentFail, subsequentSuccess,
      lastSuccessfulLogin, lastUnsuccessfulLogin, blockedUntill, permBlocked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IpAddress &&
          other.ipAddress == this.ipAddress &&
          other.subsequentFail == this.subsequentFail &&
          other.subsequentSuccess == this.subsequentSuccess &&
          other.lastSuccessfulLogin == this.lastSuccessfulLogin &&
          other.lastUnsuccessfulLogin == this.lastUnsuccessfulLogin &&
          other.blockedUntill == this.blockedUntill &&
          other.permBlocked == this.permBlocked);
}

class IpAddressesCompanion extends UpdateCompanion<IpAddress> {
  final Value<String> ipAddress;
  final Value<int> subsequentFail;
  final Value<int> subsequentSuccess;
  final Value<DateTime?> lastSuccessfulLogin;
  final Value<DateTime?> lastUnsuccessfulLogin;
  final Value<DateTime?> blockedUntill;
  final Value<bool> permBlocked;
  const IpAddressesCompanion({
    this.ipAddress = const Value.absent(),
    this.subsequentFail = const Value.absent(),
    this.subsequentSuccess = const Value.absent(),
    this.lastSuccessfulLogin = const Value.absent(),
    this.lastUnsuccessfulLogin = const Value.absent(),
    this.blockedUntill = const Value.absent(),
    this.permBlocked = const Value.absent(),
  });
  IpAddressesCompanion.insert({
    required String ipAddress,
    this.subsequentFail = const Value.absent(),
    this.subsequentSuccess = const Value.absent(),
    this.lastSuccessfulLogin = const Value.absent(),
    this.lastUnsuccessfulLogin = const Value.absent(),
    this.blockedUntill = const Value.absent(),
    this.permBlocked = const Value.absent(),
  }) : ipAddress = Value(ipAddress);
  static Insertable<IpAddress> custom({
    Expression<String>? ipAddress,
    Expression<int>? subsequentFail,
    Expression<int>? subsequentSuccess,
    Expression<DateTime>? lastSuccessfulLogin,
    Expression<DateTime>? lastUnsuccessfulLogin,
    Expression<DateTime>? blockedUntill,
    Expression<bool>? permBlocked,
  }) {
    return RawValuesInsertable({
      if (ipAddress != null) 'ip_address': ipAddress,
      if (subsequentFail != null) 'subsequent_fail': subsequentFail,
      if (subsequentSuccess != null) 'subsequent_success': subsequentSuccess,
      if (lastSuccessfulLogin != null)
        'last_successful_login': lastSuccessfulLogin,
      if (lastUnsuccessfulLogin != null)
        'last_unsuccessful_login': lastUnsuccessfulLogin,
      if (blockedUntill != null) 'blocked_untill': blockedUntill,
      if (permBlocked != null) 'perm_blocked': permBlocked,
    });
  }

  IpAddressesCompanion copyWith(
      {Value<String>? ipAddress,
      Value<int>? subsequentFail,
      Value<int>? subsequentSuccess,
      Value<DateTime?>? lastSuccessfulLogin,
      Value<DateTime?>? lastUnsuccessfulLogin,
      Value<DateTime?>? blockedUntill,
      Value<bool>? permBlocked}) {
    return IpAddressesCompanion(
      ipAddress: ipAddress ?? this.ipAddress,
      subsequentFail: subsequentFail ?? this.subsequentFail,
      subsequentSuccess: subsequentSuccess ?? this.subsequentSuccess,
      lastSuccessfulLogin: lastSuccessfulLogin ?? this.lastSuccessfulLogin,
      lastUnsuccessfulLogin:
          lastUnsuccessfulLogin ?? this.lastUnsuccessfulLogin,
      blockedUntill: blockedUntill ?? this.blockedUntill,
      permBlocked: permBlocked ?? this.permBlocked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ipAddress.present) {
      map['ip_address'] = Variable<String>(ipAddress.value);
    }
    if (subsequentFail.present) {
      map['subsequent_fail'] = Variable<int>(subsequentFail.value);
    }
    if (subsequentSuccess.present) {
      map['subsequent_success'] = Variable<int>(subsequentSuccess.value);
    }
    if (lastSuccessfulLogin.present) {
      map['last_successful_login'] =
          Variable<DateTime>(lastSuccessfulLogin.value);
    }
    if (lastUnsuccessfulLogin.present) {
      map['last_unsuccessful_login'] =
          Variable<DateTime>(lastUnsuccessfulLogin.value);
    }
    if (blockedUntill.present) {
      map['blocked_untill'] = Variable<DateTime>(blockedUntill.value);
    }
    if (permBlocked.present) {
      map['perm_blocked'] = Variable<bool>(permBlocked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IpAddressesCompanion(')
          ..write('ipAddress: $ipAddress, ')
          ..write('subsequentFail: $subsequentFail, ')
          ..write('subsequentSuccess: $subsequentSuccess, ')
          ..write('lastSuccessfulLogin: $lastSuccessfulLogin, ')
          ..write('lastUnsuccessfulLogin: $lastUnsuccessfulLogin, ')
          ..write('blockedUntill: $blockedUntill, ')
          ..write('permBlocked: $permBlocked')
          ..write(')'))
        .toString();
  }
}

class $IpAddressesTable extends IpAddresses
    with TableInfo<$IpAddressesTable, IpAddress> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IpAddressesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _ipAddressMeta = const VerificationMeta('ipAddress');
  @override
  late final GeneratedColumn<String> ipAddress = GeneratedColumn<String>(
      'ip_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _subsequentFailMeta =
      const VerificationMeta('subsequentFail');
  @override
  late final GeneratedColumn<int> subsequentFail = GeneratedColumn<int>(
      'subsequent_fail', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _subsequentSuccessMeta =
      const VerificationMeta('subsequentSuccess');
  @override
  late final GeneratedColumn<int> subsequentSuccess = GeneratedColumn<int>(
      'subsequent_success', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _lastSuccessfulLoginMeta =
      const VerificationMeta('lastSuccessfulLogin');
  @override
  late final GeneratedColumn<DateTime> lastSuccessfulLogin =
      GeneratedColumn<DateTime>('last_successful_login', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _lastUnsuccessfulLoginMeta =
      const VerificationMeta('lastUnsuccessfulLogin');
  @override
  late final GeneratedColumn<DateTime> lastUnsuccessfulLogin =
      GeneratedColumn<DateTime>('last_unsuccessful_login', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _blockedUntillMeta =
      const VerificationMeta('blockedUntill');
  @override
  late final GeneratedColumn<DateTime> blockedUntill =
      GeneratedColumn<DateTime>('blocked_untill', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _permBlockedMeta =
      const VerificationMeta('permBlocked');
  @override
  late final GeneratedColumn<bool> permBlocked = GeneratedColumn<bool>(
      'perm_blocked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK ("perm_blocked" IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        ipAddress,
        subsequentFail,
        subsequentSuccess,
        lastSuccessfulLogin,
        lastUnsuccessfulLogin,
        blockedUntill,
        permBlocked
      ];
  @override
  String get aliasedName => _alias ?? 'ip_addresses';
  @override
  String get actualTableName => 'ip_addresses';
  @override
  VerificationContext validateIntegrity(Insertable<IpAddress> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ip_address')) {
      context.handle(_ipAddressMeta,
          ipAddress.isAcceptableOrUnknown(data['ip_address']!, _ipAddressMeta));
    } else if (isInserting) {
      context.missing(_ipAddressMeta);
    }
    if (data.containsKey('subsequent_fail')) {
      context.handle(
          _subsequentFailMeta,
          subsequentFail.isAcceptableOrUnknown(
              data['subsequent_fail']!, _subsequentFailMeta));
    }
    if (data.containsKey('subsequent_success')) {
      context.handle(
          _subsequentSuccessMeta,
          subsequentSuccess.isAcceptableOrUnknown(
              data['subsequent_success']!, _subsequentSuccessMeta));
    }
    if (data.containsKey('last_successful_login')) {
      context.handle(
          _lastSuccessfulLoginMeta,
          lastSuccessfulLogin.isAcceptableOrUnknown(
              data['last_successful_login']!, _lastSuccessfulLoginMeta));
    }
    if (data.containsKey('last_unsuccessful_login')) {
      context.handle(
          _lastUnsuccessfulLoginMeta,
          lastUnsuccessfulLogin.isAcceptableOrUnknown(
              data['last_unsuccessful_login']!, _lastUnsuccessfulLoginMeta));
    }
    if (data.containsKey('blocked_untill')) {
      context.handle(
          _blockedUntillMeta,
          blockedUntill.isAcceptableOrUnknown(
              data['blocked_untill']!, _blockedUntillMeta));
    }
    if (data.containsKey('perm_blocked')) {
      context.handle(
          _permBlockedMeta,
          permBlocked.isAcceptableOrUnknown(
              data['perm_blocked']!, _permBlockedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  IpAddress map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IpAddress(
      ipAddress: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}ip_address'])!,
      subsequentFail: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}subsequent_fail'])!,
      subsequentSuccess: attachedDatabase.options.types.read(
          DriftSqlType.int, data['${effectivePrefix}subsequent_success'])!,
      lastSuccessfulLogin: attachedDatabase.options.types.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}last_successful_login']),
      lastUnsuccessfulLogin: attachedDatabase.options.types.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}last_unsuccessful_login']),
      blockedUntill: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}blocked_untill']),
      permBlocked: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}perm_blocked'])!,
    );
  }

  @override
  $IpAddressesTable createAlias(String alias) {
    return $IpAddressesTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  late final $PasswordsTable passwords = $PasswordsTable(this);
  late final $LoginsTable logins = $LoginsTable(this);
  late final $IpAddressesTable ipAddresses = $IpAddressesTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, passwords, logins, ipAddresses];
}

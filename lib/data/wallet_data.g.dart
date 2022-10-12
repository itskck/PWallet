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
  const User(
      {required this.id,
      required this.login,
      required this.passwordHash,
      required this.salt,
      required this.isPasswordKeptAsHash});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['login'] = Variable<String>(login);
    map['password_hash'] = Variable<String>(passwordHash);
    map['salt'] = Variable<String>(salt);
    map['is_password_kept_as_hash'] = Variable<bool>(isPasswordKeptAsHash);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      login: Value(login),
      passwordHash: Value(passwordHash),
      salt: Value(salt),
      isPasswordKeptAsHash: Value(isPasswordKeptAsHash),
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
    };
  }

  User copyWith(
          {int? id,
          String? login,
          String? passwordHash,
          String? salt,
          bool? isPasswordKeptAsHash}) =>
      User(
        id: id ?? this.id,
        login: login ?? this.login,
        passwordHash: passwordHash ?? this.passwordHash,
        salt: salt ?? this.salt,
        isPasswordKeptAsHash: isPasswordKeptAsHash ?? this.isPasswordKeptAsHash,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('salt: $salt, ')
          ..write('isPasswordKeptAsHash: $isPasswordKeptAsHash')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, login, passwordHash, salt, isPasswordKeptAsHash);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.login == this.login &&
          other.passwordHash == this.passwordHash &&
          other.salt == this.salt &&
          other.isPasswordKeptAsHash == this.isPasswordKeptAsHash);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> login;
  final Value<String> passwordHash;
  final Value<String> salt;
  final Value<bool> isPasswordKeptAsHash;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.login = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.salt = const Value.absent(),
    this.isPasswordKeptAsHash = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String login,
    required String passwordHash,
    required String salt,
    required bool isPasswordKeptAsHash,
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
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (login != null) 'login': login,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (salt != null) 'salt': salt,
      if (isPasswordKeptAsHash != null)
        'is_password_kept_as_hash': isPasswordKeptAsHash,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? login,
      Value<String>? passwordHash,
      Value<String>? salt,
      Value<bool>? isPasswordKeptAsHash}) {
    return UsersCompanion(
      id: id ?? this.id,
      login: login ?? this.login,
      passwordHash: passwordHash ?? this.passwordHash,
      salt: salt ?? this.salt,
      isPasswordKeptAsHash: isPasswordKeptAsHash ?? this.isPasswordKeptAsHash,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('salt: $salt, ')
          ..write('isPasswordKeptAsHash: $isPasswordKeptAsHash')
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, login, passwordHash, salt, isPasswordKeptAsHash];
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
  const Password(
      {required this.id,
      required this.password,
      required this.idUser,
      required this.webAddress,
      required this.descritpion,
      required this.login});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['password'] = Variable<String>(password);
    map['id_user'] = Variable<int>(idUser);
    map['web_address'] = Variable<String>(webAddress);
    map['descritpion'] = Variable<String>(descritpion);
    map['login'] = Variable<String>(login);
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
    };
  }

  Password copyWith(
          {int? id,
          String? password,
          int? idUser,
          String? webAddress,
          String? descritpion,
          String? login}) =>
      Password(
        id: id ?? this.id,
        password: password ?? this.password,
        idUser: idUser ?? this.idUser,
        webAddress: webAddress ?? this.webAddress,
        descritpion: descritpion ?? this.descritpion,
        login: login ?? this.login,
      );
  @override
  String toString() {
    return (StringBuffer('Password(')
          ..write('id: $id, ')
          ..write('password: $password, ')
          ..write('idUser: $idUser, ')
          ..write('webAddress: $webAddress, ')
          ..write('descritpion: $descritpion, ')
          ..write('login: $login')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, password, idUser, webAddress, descritpion, login);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Password &&
          other.id == this.id &&
          other.password == this.password &&
          other.idUser == this.idUser &&
          other.webAddress == this.webAddress &&
          other.descritpion == this.descritpion &&
          other.login == this.login);
}

class PasswordsCompanion extends UpdateCompanion<Password> {
  final Value<int> id;
  final Value<String> password;
  final Value<int> idUser;
  final Value<String> webAddress;
  final Value<String> descritpion;
  final Value<String> login;
  const PasswordsCompanion({
    this.id = const Value.absent(),
    this.password = const Value.absent(),
    this.idUser = const Value.absent(),
    this.webAddress = const Value.absent(),
    this.descritpion = const Value.absent(),
    this.login = const Value.absent(),
  });
  PasswordsCompanion.insert({
    this.id = const Value.absent(),
    required String password,
    required int idUser,
    required String webAddress,
    required String descritpion,
    required String login,
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
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (password != null) 'password': password,
      if (idUser != null) 'id_user': idUser,
      if (webAddress != null) 'web_address': webAddress,
      if (descritpion != null) 'descritpion': descritpion,
      if (login != null) 'login': login,
    });
  }

  PasswordsCompanion copyWith(
      {Value<int>? id,
      Value<String>? password,
      Value<int>? idUser,
      Value<String>? webAddress,
      Value<String>? descritpion,
      Value<String>? login}) {
    return PasswordsCompanion(
      id: id ?? this.id,
      password: password ?? this.password,
      idUser: idUser ?? this.idUser,
      webAddress: webAddress ?? this.webAddress,
      descritpion: descritpion ?? this.descritpion,
      login: login ?? this.login,
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
          ..write('login: $login')
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, password, idUser, webAddress, descritpion, login];
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
    );
  }

  @override
  $PasswordsTable createAlias(String alias) {
    return $PasswordsTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  late final $PasswordsTable passwords = $PasswordsTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users, passwords];
}

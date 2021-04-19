import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'encrypt_codec.dart';

class AppDatabase {
  static const String _dbName = 'appdb';
  static const String _securityDbName = 'secappdb';
  static AppDatabase _singleton;
  Database db;
  Database securityDb;

  factory AppDatabase() {
    if (_singleton == null) {
      _singleton = AppDatabase._();
    }
    return _singleton;
  }

  AppDatabase._();

  Future init({String securityDbPass}) async {
    if (db == null) {
      db = await _setupDataBase(_dbName, null);
    }
    if (securityDb == null && securityDbPass != null) {
      securityDb = await _setupDataBase(_securityDbName, securityDbPass);
    }
  }

  Future<Database> _setupDataBase(String dbName, String securityDbPass) async {
    var appDocDirectory = await getApplicationDocumentsDirectory();
    var dbPath = '${appDocDirectory.path}/$dbName.db';
    var dbFactory = databaseFactoryIo;

    var codec;
    if (securityDbPass != null) {
      codec = getEncryptSembastCodec(password: securityDbPass);
    }
    return await dbFactory.openDatabase(dbPath, codec: codec);
  }

  Future deleteDatabase() async {
    var appDocDirectory = await getApplicationDocumentsDirectory();
    await databaseFactoryIo
        .deleteDatabase('${appDocDirectory.path}/$_dbName.db');
    await databaseFactoryIo
        .deleteDatabase('${appDocDirectory.path}/$_securityDbName.db');
    db = null;
    securityDb = null;
  }
}

import 'dart:async';

import 'package:base_flutter_app/config/base_flutter_app_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'encrypt_codec.dart';

class AppDatabase {
  static const String _dbName = 'appdb';
  static const String _securityDbName = 'secappdb';
  static AppDatabase _singleton;
  Database _db;
  Database _securityDb;

  factory AppDatabase() {
    if (_singleton == null) {
      _singleton = AppDatabase._();
    }
    return _singleton;
  }

  AppDatabase._();

  Future init({withSecurityDb = true}) async {
    if (_db == null) {
      _db = await _setupDataBase(_dbName, false);
    }
    if (_securityDb == null && withSecurityDb) {
      _securityDb = await _setupDataBase(_securityDbName, true);
    }
  }

  Future<Database> _setupDataBase(String dbName, bool encrypted) async {
    var appDocDirectory = await getApplicationDocumentsDirectory();
    var dbPath = '${appDocDirectory.path}/$dbName.db';
    var dbFactory = databaseFactoryIo;

    var codec;
    if (encrypted) {
      if (BaseFlutterAppConfig().secDbPassword == null) {
        Exception(
            'secDbPassword is null, set it usign BaseFlutterAppConfig().secDbPassword');
      }
      codec = getEncryptSembastCodec(
          password: BaseFlutterAppConfig().secDbPassword);
    }
    return await dbFactory.openDatabase(dbPath, codec: codec);
  }

  Database get database {
    return _db;
  }

  Database get secDatabase {
    return _securityDb;
  }

  Future deleteDatabase() async {
    var appDocDirectory = await getApplicationDocumentsDirectory();
    await databaseFactoryIo
        .deleteDatabase('${appDocDirectory.path}/$_dbName.db');
    await databaseFactoryIo
        .deleteDatabase('${appDocDirectory.path}/$_securityDbName.db');
    _db = null;
    _securityDb = null;
  }
}

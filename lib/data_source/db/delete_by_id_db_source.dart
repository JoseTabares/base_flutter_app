import 'package:base_data/db_source.dart';
import 'package:sembast/sembast.dart';

import 'config/app_database.dart';

mixin DeleteByIdDbSourceAdapter<T> implements DeleteByIdDbSource<T> {
  Database? get db => AppDatabase().db;

  final StoreRef<String?, Map<String, Object?>> store = stringMapStoreFactory.store(T.toString());

  @override
  Future deleteById(String? id, [Map? args]) async {
    await store.record(id).delete(db!);
  }
}

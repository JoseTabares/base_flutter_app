import 'package:base_data/db_source.dart';
import 'package:base_models/base_model.dart';
import 'package:sembast/sembast.dart';

import 'config/app_database.dart';

mixin PutAllDbSourceAdapter<T extends BaseModel> implements PutAllDbSource<T> {
  Database get db => AppDatabase().database;

  final store = stringMapStoreFactory.store(T.toString());

  @override
  Future putAll(
    List<T> items, {
    bool delete = true,
    Map args,
  }) async {
    await db.transaction((txn) async {
      if (delete) {
        await store.delete(txn);
      }
      for (var item in items) {
        await store.record(item.id).put(txn, item.toJson());
      }
    });
  }
}
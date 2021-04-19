import 'package:base_data/db_source.dart';
import 'package:base_models/base_model.dart';
import 'package:sembast/sembast.dart';

import 'config/app_database.dart';

mixin PutDbSourceAdapter<T extends BaseModel> implements PutDbSource<T> {
  Database get db => AppDatabase().db;

  final store = stringMapStoreFactory.store(T.toString());

  @override
  Future put(T item, [Map args]) async {
    await store.record(item.id).put(db, item.toJson());
  }
}

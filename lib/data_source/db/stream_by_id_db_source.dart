import 'package:base_data/db_source.dart';
import 'package:sembast/sembast.dart';

import 'config/app_database.dart';

mixin StreamByIdDbSourceAdapter<T> implements StreamByIdDbSource<T> {
  T mapper(Map<String, dynamic> value);

  Database get db => AppDatabase().database;

  final store = stringMapStoreFactory.store(T.toString());

  @override
  Stream<T> streamById(String id, [Map args]) {
    return store
        .record(id)
        .onSnapshot(db)
        .map((record) => record == null ? null : mapper(record.value));
  }
}

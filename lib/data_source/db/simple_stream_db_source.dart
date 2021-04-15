import 'package:base_data/db_source.dart';
import 'package:sembast/sembast.dart';

import 'config/app_database.dart';

mixin SimpleStreamDbSourceAdapter<T> implements SimpleStreamDbSource<T> {
  T mapper(Map<String, dynamic> value);

  Database get db => AppDatabase().database;

  final store = StoreRef.main();

  @override
  Stream<T> stream([Map args]) {
    return store
        .record(T.toString())
        .onSnapshot(db)
        .map((record) => record == null ? null : mapper(record.value));
  }
}

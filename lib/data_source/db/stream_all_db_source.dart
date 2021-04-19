import 'package:base_data/db_source.dart';
import 'package:sembast/sembast.dart';

import 'config/app_database.dart';

mixin StreamAllDbSourceAdapter<T> implements StreamAllDbSource<T> {
  T mapper(Map<String, dynamic> value);

  Database get db => AppDatabase().db;

  List<SortOrder> get sortOrders => [];

  final store = stringMapStoreFactory.store(T.toString());

  @override
  Stream<List<T>> streamAll([Map args]) {
    return store
        .query(finder: Finder(sortOrders: sortOrders))
        .onSnapshots(db)
        .map((records) =>
            records.map((record) => mapper(record.value)).toList());
  }
}

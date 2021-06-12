import 'package:base_data/db_source.dart';
import 'package:base_models/base_model.dart';
import 'package:sembast/sembast.dart';

import 'config/app_database.dart';

mixin SimplePutDbSourceAdapter<T extends BaseModel>
    implements SimplePutDbSource<T> {
  Database? get db => AppDatabase().db;

  final store = StoreRef.main();

  @override
  Future put(T? item, [Map? args]) async {
    if (item != null) {
      await store.record(T.toString()).put(db!, item.toJson());
    }
  }
}

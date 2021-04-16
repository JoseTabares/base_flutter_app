Flutter plugin for manage your app with basic and general functionalities.

## Using

For use init config.

```dart

import 'package:base_flutter_app/config/api_log_config.dart';
import 'package:base_flutter_app/config/base_flutter_app_config.dart';

BaseFlutterAppConfig().apiLogConfig = ApiLogConfig();

BaseFlutterAppConfig().secDbPassword = 'mySecPassword';

```

For use Bloc.

```dart

import 'package:base_flutter_app/blocs/bloc.dart';

class UsersBloc with Bloc {
  
  @override
  void dispose() {
    // TODO: dispose controllers.
  }
  
}

import 'package:base_flutter_app/blocs/provider.dart';

var bloc = Provider.of<UsersBloc>(() => UsersBloc());

```

For use Connectivity.

```dart

import 'package:base_flutter_app/connectivity/connectivity.dart';

Connectivity connectivity = ConnectivityAdapter();

if (await connectivity.isConnected()) {
    // Do something    
} else {
    // Do something    
}

```

For use string_extensions

```dart

import 'package:base_flutter_app/string_extensions.dart';

var stringFormated = 'Hello {{0}}, {{1}}'.format(['Wordl!!', 'User']);
print(stringFormated); // Hello Wordl!!, User

```

For use ApiSource


```dart

import 'package:base_flutter_app/connectivity/connectivity.dart';
import 'package:base_flutter_app/data_source/api/api_source.dart';
import 'package:http/http.dart' as http;

class MyApiSource with ApiSource {
  final String _baseUrl;
  final http.Client _client;
  final Connectivity _connectivity;

  MyApiSource(
    this._baseUrl,
    this._client,
    this._connectivity,
  );

  @override
  String get baseUrl => _baseUrl;

  @override
  http.Client get client => _client;

  @override
  Connectivity get connectivity => _connectivity;

  @override
  Map<String, String> getHeaders(Map<String, String> headers) {
    headers = headers ?? {};
    return headers;
  }
}

var myApiSource = MyApiSource('https://base.url.com', http.Client(), ConnectivityAdapter());myApiSource.getApi(url, (value) => null);
myApiSource.postApi(url, body, (value) => null);

```
For use general api sources

```dart

class UsersApiSourceAdapter implements UsersApiSource {
  final MyApiSource apiSource;

  UsersApiSourceAdapter(this.apiSource);

  @override
  Future<List<User>> getAll([Map args]) {
    var url = '${apiSource.baseUrl}/api/users';
    return apiSource.getApi<List<User>>(url, (value) {
      return (value as List).map((value) {
        return User.fromJson(value);
      }).toList();
    });
  }
}

```

For use general db source

```dart

class UsersDbSourceAdapter
    with StreamAllDbSourceAdapter<User>, PutAllDbSourceAdapter<User>
    implements UsersDbSource {
  @override
  User mapper(Map<String, dynamic> value) {
    return User.fromJson(value);
  }

  @override
  List<SortOrder> get sortOrders => [SortOrder('name')];
}

```
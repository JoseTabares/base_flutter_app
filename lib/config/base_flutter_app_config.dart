import 'api_log_config.dart';

class BaseFlutterAppConfig {
  static BaseFlutterAppConfig _instance;

  BaseFlutterAppConfig._internal() {
    apiLogConfig = ApiLogConfig();
  }

  factory BaseFlutterAppConfig() {
    if (_instance == null) {
      _instance = BaseFlutterAppConfig._internal();
    }

    return _instance;
  }

  ApiLogConfig apiLogConfig;
  String secDbPassword;
}

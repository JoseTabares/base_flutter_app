class ApiLogConfig {
  final bool enableUrl;
  final bool enableMethod;
  final bool enableHeaders;
  final bool enableStatusCode;
  final bool enableResponseBody;

  ApiLogConfig({
    this.enableUrl = true,
    this.enableMethod = true,
    this.enableHeaders = true,
    this.enableStatusCode = true,
    this.enableResponseBody = false,
  });
}

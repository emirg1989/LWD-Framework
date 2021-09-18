import 'dart:io';

class LWDRequest {
  final String body, method;
  final Map<String, String> params;
  final Map<String, Object> headers;
  final List<Cookie> cookies;
  final Uri url;
  final HttpResponse response;
  final HttpRequest originalRequest;

  LWDRequest(this.body, this.params, this.headers, this.method, this.cookies,
      this.url, this.response, this.originalRequest);
}

import 'dart:io';

import 'package:lwdframework/src/lwd_request.dart';

LWDRequest getLWDRequestFromHttpRequest(HttpRequest request) {
  return LWDRequest(
      request.toString(),
      request.requestedUri.queryParameters,
      getHeadersFromHttpRequest(request),
      request.method,
      getCookiesFromHttpRequest(request),
      request.requestedUri,
      request.response,
      request);
}

Map<String, Object> getHeadersFromHttpRequest(HttpRequest request) {
  var headers = <String, Object>{};
  request.headers.forEach((k, v) {
    headers[k] = v;
  });
  return headers;
}

List<Cookie> getCookiesFromHttpRequest(HttpRequest request) {
  var cookies = <Cookie>[];
  request.cookies.map((cookie) => cookies.add(cookie));
  return cookies;
}

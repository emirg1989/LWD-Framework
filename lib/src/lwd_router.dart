import 'dart:io';

import 'package:lwdframework/lwd.dart';
import 'package:lwdframework/src/lwd_response.dart';
import 'package:lwdframework/src/route.dart';
import 'package:meta/meta.dart';

@sealed
class LWDRouter {
  final List<Route> _routes = [];

  void addRoute(String verb, String route, Handler handler) =>
      _routes.add(Route(verb, route, handler));

  void get(String route, Handler handler) => addRoute('GET', route, handler);

  void head(String route, Handler handler) => addRoute('HEAD', route, handler);

  void post(String route, Handler handler) => addRoute('POST', route, handler);

  void put(String route, Handler handler) => addRoute('PUT', route, handler);

  void delete(String route, Handler handler) =>
      addRoute('DELETE', route, handler);

  void connect(String route, Handler handler) =>
      addRoute('CONNECT', route, handler);

  void options(String route, Handler handler) =>
      addRoute('OPTIONS', route, handler);

  void trace(String route, Handler handler) =>
      addRoute('TRACE', route, handler);

  void patch(String route, Handler handler) =>
      addRoute('PATCH', route, handler);

  Future<LWDResponse> call(HttpRequest request) async {
    for (var route in _routes) {
      if (route.verb != request.method.toUpperCase() && route.verb != 'ALL') {
        continue;
      }
      var path = request.uri.path;
      if (route.match(path)) {
        return await route.executeHandler(request);
      }
    }
    return LWDResponse.notFound('Route not found');
  }
}

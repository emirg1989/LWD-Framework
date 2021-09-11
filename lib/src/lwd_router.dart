import 'dart:io';

import 'package:LWDFramework/src/http_method.dart';
import 'package:LWDFramework/src/lwd_response.dart';
import 'package:LWDFramework/src/route.dart';
import 'package:meta/meta.dart';

@sealed
class LWDRouter {
  final List<Route> _routes = [];

  void addRoute(String verb, String route, Function handler) {
    if (!isHttpMethod(verb)) {
      throw ArgumentError.value(verb, 'verb', 'Method not supported');
    }
    verb = verb.toUpperCase();
    _routes.add(Route(verb, route, handler));
  }

  void get(String route, Function handler) => addRoute('GET', route, handler);

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

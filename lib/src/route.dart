import 'dart:io';

import 'package:LWDFramework/src/handler.dart';
import 'package:LWDFramework/src/lwd_response.dart';
import 'package:path_to_regexp/path_to_regexp.dart';

class Route {
  String verb, route;
  Handler handler;

  Route(String verb, String route, Handler handler) {
    this.verb = verb;
    this.route = route;
    this.handler = handler;
  }

  bool match(String path) {
    final parameters = <String>[];
    final tokens = parse(route, parameters: parameters);
    final regExp = tokensToRegExp(tokens);
    if (regExp.hasMatch(path)) {
      return true;
    }
    return false;
  }

  Future<LWDResponse> executeHandler(HttpRequest request) async {
    return await handler(request);
  }
}

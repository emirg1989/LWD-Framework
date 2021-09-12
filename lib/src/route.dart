import 'dart:io';

import 'package:lwdframework/src/handler.dart';
import 'package:lwdframework/src/lwd_response.dart';
import 'package:path_to_regexp/path_to_regexp.dart';

class Route {
  String verb, path;
  Handler handler;

  Route(this.verb, this.path, this.handler);

  bool match(String path) {
    final parameters = <String>[];
    final tokens = parse(path, parameters: parameters);
    final regExp = tokensToRegExp(tokens);
    if (regExp.hasMatch(this.path)) {
      return true;
    }
    return false;
  }

  Future<LWDResponse> executeHandler(HttpRequest request) async {
    return await handler(request);
  }
}

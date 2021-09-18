import 'dart:io';
import 'dart:async';

import 'package:lwdframework/lwd.dart';
import 'package:lwdframework/src/utils.dart';

class LWDIO {
  Future server(Handler handler, address, port) async {
    var server = await HttpServer.bind(address, port, shared: true);
    print('Server started: ${server.address} port ${server.port}');
    server.listen((request) {
      handlerRequest(request, handler);
    });
  }

  Future<void> handlerRequest(HttpRequest request, Handler handler) async {
    var lWDRequest = getLWDRequestFromHttpRequest(request);
    var response = await handler(lWDRequest);
    var httpResponse = request.response;
    httpResponse.statusCode = response.statusCode;
    httpResponse.write(response.message);
  }
}

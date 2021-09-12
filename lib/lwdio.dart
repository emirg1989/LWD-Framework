import 'dart:io';
import 'dart:async';

import 'package:lwdframework/lwd.dart';

class LWDIO {
  Future server(Handler handler, address, port) async {
    var server = await HttpServer.bind(address, port);
    print('Server started: ${server.address} port ${server.port}');
    server.listen((HttpRequest request) {
      handlerRequest(request, handler);
    });
  }

  Future<void> handlerRequest(HttpRequest request, Handler handler) async {
    var response = await handler(request);
    var httpResponse = request.response;
    print(request.contentLength);
    //TO-DO: debo setear los headers
    /*request.headers.forEach((name, values) {
      httpResponse.headers.add(name, values);
    });*/
    httpResponse.statusCode = response.statusCode;
    httpResponse.write(response.body);
    await httpResponse.close();
    return;
  }
}

import 'dart:io';

import 'package:lwdframework/lwd.dart';
import 'package:lwdframework/lwdio.dart';

Future<void> main(List<String> arguments) async {
  final address = '127.0.0.1';
  const port = 4040;
  var router = LWDRouter();
  router.get('/greeting', (HttpRequest request) {
    return LWDResponse.ok('hello world!');
  });

  await LWDIO().server(router, address, port);
}

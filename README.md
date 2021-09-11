![LWD-Framework](https://github.com/emirg1989/LWD-Framework/blob/main/logo_transparent_background.png)
Lightweight Dart Framework is an api restful framework for [dart](https://dart.dev/) and [flutter](https://flutter.dev/) developers.

```dart
import 'package:LWDFramework/lwd.dart';
import 'package:LWDFramework/lwdio.dart';

Future<void> main(List<String> arguments) async {
  final address = '127.0.0.1';
  const port = 4040;
  var router = LWDRouter();
  router.get('/greeting', (HttpRequest request) {
    return LWDResponse.ok('hello world!');
  });

  await LWDIO().server(router, address, port);
}
```
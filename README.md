![LWD-Framework](https://github.com/emirg1989/LWD-Framework/blob/main/logo_transparent_background.png)
Lightweight Dart Framework is an api restful framework for [dart](https://dart.dev/) and [flutter](https://flutter.dev/) developers.

```dart
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
```
## Installation

[download and install Dart](https://dart.dev/get-dart).
Dart SDK 2.7.0 or higher is required.

```bash
$ dart pub add lwdframework
```
This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):
dependencies:
  lwdframework: ^0.1.0

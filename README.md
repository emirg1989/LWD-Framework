![LWD-Framework](https://github.com/emirg1989/LWD-Framework/blob/main/logo_transparent_background.png)
Lightweight Dart Framework is an api restful framework for [dart](https://dart.dev/) and [flutter](https://flutter.dev/) developers.

```dart
Future<void> main() async {
  final address = InternetAddress.loopbackIPv4;
  const port = 4040;
  var router = LWDRouter();
  router.get('/greeting', (HttpRequest request) {
    return LWDResponse.ok("hello world"});
  });

  await LWDIO().server(router, address, port);
}
```
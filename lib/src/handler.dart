import 'dart:async';
import 'dart:io';

import 'package:lwdframework/lwd.dart';

typedef Handler = FutureOr<LWDResponse> Function(HttpRequest request);

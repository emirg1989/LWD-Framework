import 'dart:async';
import 'dart:io';

import 'package:LWDFramework/src/lwd_response.dart';

typedef Handler = FutureOr<LWDResponse> Function(HttpRequest request);

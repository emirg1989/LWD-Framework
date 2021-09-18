import 'dart:async';

import 'package:lwdframework/lwd.dart';

typedef Handler = FutureOr<LWDResponse> Function(LWDRequest request);

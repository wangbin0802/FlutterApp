
import 'dart:async';

import 'package:flutter/services.dart';

class Byfi {
  static const MethodChannel _channel = MethodChannel('byfi');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

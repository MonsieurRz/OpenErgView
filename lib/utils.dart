import 'package:flutter/material.dart';

import 'src/ergometerstore.dart';

bool isTouchDevice(BuildContext context) {
  final platform = Theme.of(context).platform;
  return platform == TargetPlatform.android ||
      platform == TargetPlatform.iOS ||
      platform == TargetPlatform.fuchsia;
}

bool isPointerDevice(BuildContext context) => !isTouchDevice(context);

String durationFormatter(Duration value) {
  int seconds = value.inSeconds - (value.inMinutes * Duration.secondsPerMinute);
  return "${value.inMinutes}:$seconds";
}

Stream<double>? getDoubleDataStream(ErgometerStore? ergstore, String datakey) {
  return ergstore?.erg?.monitorForData({datakey}).map((event) {
    var data = event[datakey] as double;
    return data;
  });
}

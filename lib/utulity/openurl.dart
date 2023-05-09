import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future openURL(String url) async {
  if (!await canLaunchUrlString(url)) {
    await launchUrlString(url,mode: LaunchMode.externalApplication);
  } else {
    if (kDebugMode) {
      print("Link broken");
    }
  }
}

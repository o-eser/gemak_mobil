import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future openURL(String url) async {
  try{
  if (!await canLaunchUrlString(url)) {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  }
}catch(e){
    throw  "Link açılamadı $e";
  }}

Future launchPhoneCall(String phoneNumber) async {
  Uri phoneCallUri = Uri(scheme: "tel", path: phoneNumber);
  try {
    if (!await launchUrl(phoneCallUri)) {
      await launchUrl(phoneCallUri);
    }
  } catch (e) {
    throw 'Telefon görüşmesi başlatılamadı: $e';
  }
}

Future launchMaps(String mapUrl) async {
  try {
    if (!await canLaunchUrlString(mapUrl)) {
      await launchUrlString(mapUrl);
    }
  } catch (e) {
    throw 'Harita Açılamadı: $e';
  }
}

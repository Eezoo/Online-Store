import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

/// ⚠️ ضع IP الكمبيوتر الحقيقي هناhttp://localhost:3000
// const String COMPUTER_IP = '10.182.144.167'; // ← غيّرههه حسب جهازك
const String COMPUTER_IP = '10.0.2.2';

final String MAIN_URL = (() {
  if (kIsWeb) {
    // المتصفح يعمل مع localhost
    return 'https://online-store-qak1.onrender.com';
  }

  try {
    if (Platform.isAndroid) {
      // جهاز أندرويد حقيقي
      return 'https://online-store-qak1.onrender.com';
    }

    if (Platform.isIOS) {
      // جهاز iOS حقيقي
      return 'https://online-store-qak1.onrender.com';
    }
  } catch (_) {}

  return 'https://online-store-qak1.onrender.com';
})();

// / توحيد روابط الصور و الـ API
String resolveImageUrl(String? url) {
  if (url == null || url.isEmpty) return url ?? '';

  final Uri mainUri = Uri.parse(MAIN_URL);

  // رابط كامل
  if (url.startsWith('http')) {
    if (url.contains('localhost')) {
      return url.replaceAll('localhost', mainUri.host);
    }
    return url;
  }

  // رابط نسبي
  final String prefix = MAIN_URL.endsWith('/')
      ? MAIN_URL.substring(0, MAIN_URL.length - 1)
      : MAIN_URL;

  final String path = url.startsWith('/') ? url : '/$url';
  return '$prefix$path';
}

/// Storage keys
const FAVORITE_PRODUCT_BOX = 'FAVORITE_PRODUCT_BOX';
const USER_INFO_BOX = 'USER_INFO_BOX';

const PHONE_KEY = 'PHONE_KEY';
const STREET_KEY = 'STREET_KEY';
const CITY_KEY = 'CITY_KEY';
const STATE_KEY = 'STATE_KEY';
const DITLE_KEY = 'DITLE_KEY';
const POSTAL_CODE_KEY = 'POSTAL_CODE_KEY';
const COUNTRY_KEY = 'COUNTRY_KEY';

// import 'screen/home_screen.dart';
// import 'screen/get_started_screen.dart';
// import 'screen/login_screen/login_screen.dart';
// import 'screen/login_screen/provider/user_provider.dart';
// import 'screen/product_by_category_screen/provider/product_by_category_provider.dart';
// import 'screen/product_cart_screen/provider/cart_provider.dart';
// import 'screen/product_details_screen/provider/product_detail_provider.dart';
// import 'screen/product_favorite_screen/provider/favorite_provider.dart';
// import 'screen/profile_screen/provider/profile_provider.dart';
// import 'utility/app_theme.dart';
// import 'utility/extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_cart/cart.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'dart:ui' show PointerDeviceKind;
// import 'package:provider/provider.dart';
// import 'core/data/data_provider.dart';
// import 'models/user.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await GetStorage.init();

//   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

//   // ✅ التهيئة الصحيحة (مرة واحدة فقط)
//   OneSignal.initialize("6271403c-ceea-461e-a7fc-0875bc64fd4d");

//   // ✅ طلب الإذن بعد التهيئة
//   await OneSignal.Notifications.requestPermission(true);

//   // ✅ انتظر حتى يصبح الاشتراك جاهزًا
//   OneSignal.User.pushSubscription.addObserver((state) {
//     final id = state.current.id;
//     final token = state.current.token;

//     if (id != null && token != null) {
//       print("OneSignal Player ID: $id");
//       print("FCM Token: $token");
//     }
//   });

//   final cart = FlutterCart();
//   await cart.initializeCart(isPersistenceSupportEnabled: true);

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => DataProvider()),
//         ChangeNotifierProvider(
//             create: (context) => UserProvider(context.dataProvider)),
//         ChangeNotifierProvider(
//             create: (context) => ProfileProvider(context.dataProvider)),
//         ChangeNotifierProvider(
//             create: (context) =>
//                 ProductByCategoryProvider(context.dataProvider)),
//         ChangeNotifierProvider(
//             create: (context) => ProductDetailProvider(context.dataProvider)),
//         ChangeNotifierProvider(
//             create: (context) => CartProvider(context.userProvider)),
//         ChangeNotifierProvider(
//             create: (context) => FavoriteProvider(context.dataProvider)),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       scrollBehavior: const MaterialScrollBehavior().copyWith(
//         dragDevices: {
//           PointerDeviceKind.mouse,
//           PointerDeviceKind.touch,
//         },
//       ),
//       debugShowCheckedModeBanner: false,
//       home: _RootNavigator(),
//       theme: AppTheme.lightAppTheme,
//     );
//   }
// }

// class _RootNavigator extends StatefulWidget {
//   @override
//   State<_RootNavigator> createState() => _RootNavigatorState();
// }

// class _RootNavigatorState extends State<_RootNavigator> {
//   bool _showGetStarted = true;

//   @override
//   Widget build(BuildContext context) {
//     User? loginUser = context.userProvider.getLoginUsr();
//     if (loginUser?.sId == null) {
//       // إذا لم يكن المستخدم مسجلاً الدخول، أظهر شاشة البداية أولاً
//       return _showGetStarted
//           ? GetStartedScreen(
//               onFinish: () => setState(() => _showGetStarted = false))
//           : const LoginScreen();
//     } else {
//       return const HomeScreen();
//     }
//   }
// }

import 'package:flutter_ecommerce_start/screen/get_started/splash_screen.dart';

import 'screen/home_screen.dart';
import 'screen/get_started/get_started_screen.dart';
import 'screen/login_screen/login_screen.dart';
import 'screen/login_screen/provider/user_provider.dart';
import 'screen/product_by_category_screen/provider/product_by_category_provider.dart';
import 'screen/product_cart_screen/provider/cart_provider.dart';
import 'screen/product_details_screen/provider/product_detail_provider.dart';
import 'screen/product_favorite_screen/provider/favorite_provider.dart';
import 'screen/profile_screen/provider/profile_provider.dart';
import 'utility/app_theme.dart';
import 'utility/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/cart.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:provider/provider.dart';
import 'core/data/data_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ⚡ لا ننتظر هنا
  await GetStorage.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProvider()),
        ChangeNotifierProvider(
            create: (context) => UserProvider(context.dataProvider)),
        ChangeNotifierProvider(
            create: (context) => ProfileProvider(context.dataProvider)),
        ChangeNotifierProvider(
            create: (context) =>
                ProductByCategoryProvider(context.dataProvider)),
        ChangeNotifierProvider(
            create: (context) => ProductDetailProvider(context.dataProvider)),
        ChangeNotifierProvider(
            create: (context) => CartProvider(context.userProvider)),
        ChangeNotifierProvider(
            create: (context) => FavoriteProvider(context.dataProvider)),
      ],
      child: const MyApp(),
    ),
  );

  // 🚀 تشغيل التهيئة الثقيلة بالخلفية
  _initServices();
}

/// 🔥 تهيئة الخدمات بالخلفية (لا تؤخر الإقلاع)
Future<void> _initServices() async {
  try {
    // ✅ التخزين
    await GetStorage.init();

    // ✅ OneSignal
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("6271403c-ceea-461e-a7fc-0875bc64fd4d");

    // ❗ لا ننتظر الإذن عند الإقلاع
    OneSignal.Notifications.requestPermission(false);
    // await OneSignal.Notifications.requestPermission(true);

    // ✅ السلة
    final cart = FlutterCart();
    await cart.initializeCart(isPersistenceSupportEnabled: true);

    // ✅ مراقبة الاشتراك
    OneSignal.User.pushSubscription.addObserver((state) {
      final id = state.current.id;
      final token = state.current.token;

      if (id != null && token != null) {
        debugPrint("OneSignal Player ID: $id");
        debugPrint("FCM Token: $token");
      }
    });
  } catch (e) {
    debugPrint("Init error: $e");
  }
}

 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      debugShowCheckedModeBanner: false,
      home: _RootNavigator(),
      theme: AppTheme.lightAppTheme,
    );
  }
}

class _RootNavigator extends StatefulWidget {
  @override
  State<_RootNavigator> createState() => _RootNavigatorState();
}class _RootNavigatorState extends State<_RootNavigator> {
  bool _showSplash = true;
  bool _showGetStarted = true;

  @override
  Widget build(BuildContext context) {
    // ✅ أولاً: Splash
    if (_showSplash) {
      return SplashScreen(
        onFinished: () {
          if (mounted) {
            setState(() => _showSplash = false);
          }
        },
      );
    }

    // ✅ ثانياً: حالة المستخدم
    final loginUser = context.userProvider.getLoginUsr();

    if (loginUser?.sId == null) {
      return _showGetStarted
          ? GetStartedScreen(
              onFinish: () {
                if (mounted) {
                  setState(() => _showGetStarted = false);
                }
              },
            )
          : const LoginScreen();
    } else {
      return const HomeScreen();
    }
  }
}
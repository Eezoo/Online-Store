import '../login_screen/login_screen.dart';
import '../../utility/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utility/app_color.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Assuming your theme and colors are defined elsewhere in your app
    const TextStyle linkStyle =
        TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
    const TextStyle titleStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الملف الشخصي", //My Account
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColor.darkBlue),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.contain, // 🔥 الأهم
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "${context.userProvider.getLoginUsr()?.name}",
              style: titleStyle,
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.darkBlue,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                context.userProvider.logOutUser();
                Get.offAll(const LoginScreen());
              },
              child: const Text('تسجيل الخروج',
                  style: TextStyle(fontSize: 18)), //Logout
            ),
          ),
        ],
      ),
    );
  }
}

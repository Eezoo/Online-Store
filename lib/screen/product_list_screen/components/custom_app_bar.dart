import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_start/screen/profile_screen/profile_screen.dart';
import 'package:flutter_ecommerce_start/utility/extensions.dart';
import '../../../widget/app_bar_action_button.dart';
import '../../../widget/custom_search_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBarActionButton(
              icon: Icons.menu_rounded,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
                // final box = GetStorage();
                // Map<String,dynamic>? userJson = box.read(USER_INFO_BOX);
                // User? userLogged = User.fromJson(userJson ?? {});
                // Scaffold.of(context).openDrawer();
              },
            ),
            Expanded(
              child: CustomSearchBar(
                controller: TextEditingController(),
                onChanged: (val) {
                  context.dataProvider.filterProduct(val);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

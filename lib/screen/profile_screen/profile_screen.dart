import 'package:flutter_ecommerce_start/screen/my_profile_screen/my_profile_screen.dart';
import 'package:flutter_ecommerce_start/widget/contact_us_button.dart';
import '../my_address_screen/my_address_screen.dart';
import '../../utility/animation/open_container_wrapper.dart';
import '../../widget/navigation_tile.dart';
import 'package:flutter/material.dart';
import '../my_order_screen/my_order_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          OpenContainerWrapper(
            nextScreen: MyProfileScreen(),
            child: NavigationTile(
              icon: Icons.person_outline,
              title: 'حسابي',
            ),
          ),
          SizedBox(height: 40),
          OpenContainerWrapper(
            nextScreen: MyOrderScreen(),
            child: NavigationTile(
              icon: Icons.shopping_bag_outlined,
              title: 'طلباتي', //My Orders
            ),
          ),
          SizedBox(height: 10),
          OpenContainerWrapper(
            nextScreen: MyAddressPage(),
            child: NavigationTile(
              icon: Icons.location_on_outlined,
              title: 'عنواني', //My Addresses
            ),
          ),
        ],
      ),
      floatingActionButton: const ContactSpeedDial(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

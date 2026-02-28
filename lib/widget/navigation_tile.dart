import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class NavigationTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const NavigationTile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        color: AppColor.lightGrey,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  // color: AppColor.darkBlue,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(icon,
                    size: 26, color: const Color.fromARGB(255, 68, 68, 67)),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  textAlign: TextAlign.right,
                  title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
              ),
              const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Color.fromARGB(255, 68, 68, 67)),
            ],
          ),
        ),
      ),
    );
  }
}

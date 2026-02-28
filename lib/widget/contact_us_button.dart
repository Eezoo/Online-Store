import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSpeedDial extends StatelessWidget {
  const ContactSpeedDial({super.key});

  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeIcon: Icons.close,
      backgroundColor: const Color(0xFF1A4F8C),
      foregroundColor: Colors.white,
      overlayColor: Colors.black,
      overlayOpacity: 0.4,
      spacing: 10,
      spaceBetweenChildren: 6,
      shape: const CircleBorder(),
      direction: SpeedDialDirection.right, // right أو left
      children: [
        SpeedDialChild(
          shape: const CircleBorder(),
          child: const FaIcon(
            FontAwesomeIcons.facebookMessenger,
            size: 20,
          ),
          labelStyle: const TextStyle(fontSize: 14),
          onTap: () {
            openUrl("https://m.me/AcaciaStationery");
          },
        ),
        SpeedDialChild(
          shape: const CircleBorder(),
          child: const FaIcon(
            FontAwesomeIcons.facebookF,
            size: 20,
          ),
          labelStyle: const TextStyle(fontSize: 14),
          onTap: () {
            openUrl("https://facebook.com/AcaciaStationery");
          },
        ),
        SpeedDialChild(
          shape: const CircleBorder(),
          child: const FaIcon(
            FontAwesomeIcons.whatsapp,
            size: 20,
          ),
          onTap: () {
            openUrl("https://wa.me/218922310333");
          },
        ),
        SpeedDialChild(
          shape: const CircleBorder(),
          child: const FaIcon(
            FontAwesomeIcons.phone,
            size: 20,
          ),
          onTap: () {
            openUrl("tel:+218922310333"); // ضع رقمك هنا
          },
        ),
      ],
      child: const FaIcon(
        FontAwesomeIcons.solidMessage,
        size: 20,
      ),
    );
  }
}

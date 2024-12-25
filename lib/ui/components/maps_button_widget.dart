import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsButtonWidget extends StatelessWidget {
  final String mapsUrl = "https://yandex.uz/maps/-/CDbD505E";

  const MapsButtonWidget({super.key});

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(mapsUrl),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $mapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Яндекс.Карты',
        style: TextStyle(
          color: Colors.red.shade300,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()..onTap = _launchUrl,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class TelegramButtonWidget extends StatelessWidget {
  final String telegramUrl = "https://t.me/coffee_zdes";

  const TelegramButtonWidget({super.key});

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(telegramUrl),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $telegramUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchUrl,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.red.shade500),
          ),
        ),
        overlayColor:
            WidgetStateProperty.all(Colors.red.shade100.withOpacity(0.5)),
        padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
        elevation: WidgetStateProperty.all(0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'lib/assets/icons/telegram.svg', // Убедитесь, что файл telegram.svg находится в папке assets.
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          Text(
            "Связаться с нами в Telegram",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.red.shade500,
            ),
          ),
        ],
      ),
    );
  }
}

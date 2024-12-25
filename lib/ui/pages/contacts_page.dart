import 'package:coffee/ui/components/maps_button_widget.dart';
import 'package:coffee/ui/components/telegram_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Контакты',
          style: TextStyle(
            fontSize: 22.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        surfaceTintColor: Colors.transparent,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'OOO "Coffee Roastery Group"',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Г. Ташкент, Шайхонтахурский р-н, Ул. Кукча Дарвоза Кунчилик-37',
            ),
            Text(
              'Телефон:+998(99) 899-20-12, +998(90) 955-55-62, +998(33)566-66-63',
            ),
            TelegramButtonWidget(),
            Text('Как до нас добраться?'),
            MapsButtonWidget(),
          ],
        ),
      ),
    );
  }
}

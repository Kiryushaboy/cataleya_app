import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentAndDeliveryPage extends StatelessWidget {
  const PaymentAndDeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Оплата и доставка',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Оплата',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Для заказа, вам нужно авторизоваться или зарегистрироваться в личном кабинете. После заказа, если это оплата по (PayMe), вам будет доступна ссылка для оплаты вашего заказа. Заказ будет взят в работу автоматически после поступления средств на расчетный счет. Отгрузка производится день в день если заказ был оформлен до 9:00 утра или же на следующий день (воскресенье выходной).',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            const Text(
              'Доставка',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Принимаем заказы с Понедельника по Субботу с 09:00 до 17:00. Доставка оплачивается по тарифу Yandex.Go - покупателем. Заказ отправляется после оплаты.',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(
                'https://cataleya.uz/static/image/yandexgo.46f6e71d.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

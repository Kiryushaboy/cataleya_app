import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersHistoryPage extends StatelessWidget {
  const OrdersHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'История заказов',
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
      body: const Center(child: Text('У вас нет еще оформленных заказов')),
    );
  }
}
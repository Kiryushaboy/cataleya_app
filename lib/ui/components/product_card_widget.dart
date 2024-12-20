import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCardWidget extends StatelessWidget {
  final dynamic product; // Replace dynamic with your product model

  const ProductCardWidget({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.r),
      child: ListTile(
        leading: SizedBox(
          width: 50.w,
          height: 50.h,
          child: Image.network(
            product?.images?[0]?.url ?? '',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.image_not_supported);
            },
          ),
        ),
        title: Text(
          product?.name ?? 'Без названия',
          style: TextStyle(fontSize: 16.sp),
        ),
        subtitle: Text(
          'Цена: ${product?.price?.toString() ?? 'Не указано'} UZS',
          style: TextStyle(fontSize: 14.sp),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {},
        ),
        onTap: () {
          // Add navigation logic here
        },
      ),
    );
  }
}

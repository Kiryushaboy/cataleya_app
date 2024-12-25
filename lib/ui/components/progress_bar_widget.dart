import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  final double progress; // Процент прогресса (от 0.0 до 1.0)

  const ProgressBarWidget({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Растягиваем на всю ширину
      height: 12, // Высота полосы прогресса
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9), // Цвет фона (bg-blue-gray-50)
        borderRadius: BorderRadius.circular(50), // Закругленные углы
      ),
      child: Row(
        children: [
          Container(
            width:
                progress * MediaQuery.of(context).size.width, // Длина прогресса
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red, // Цвет прогресса (bg-red-500)
              borderRadius: BorderRadius.circular(50), // Закругленные углы
            ),
            child: const Center(
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white, // Цвет текста внутри полосы
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

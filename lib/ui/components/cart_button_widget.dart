import 'package:flutter/material.dart';

class CartButtonWidget extends StatefulWidget {
  const CartButtonWidget({super.key});

  @override
  CartButtonWidgetState createState() => CartButtonWidgetState();
}

class CartButtonWidgetState extends State<CartButtonWidget> {
  int quantity = 1;

  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Кнопки изменения количества
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.remove,
                size: 30,
                color: Colors.black,
              ),
              onPressed: _decreaseQuantity,
            ),
            SizedBox(
              width: 40,
              child: TextFormField(
                initialValue: quantity.toString(),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
                onChanged: (value) {
                  setState(() {
                    quantity = int.tryParse(value) ?? 1;
                  });
                },
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.add,
                size: 30,
                color: Colors.black,
              ),
              onPressed: _increaseQuantity,
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Кнопка "В корзину"
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.red.shade600, Colors.red.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: ElevatedButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 24)),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              shadowColor:
                  WidgetStateProperty.all(Colors.red.shade500.withOpacity(0.2)),
              elevation: WidgetStateProperty.all(5),
            ),
            onPressed: () {
              // Handle add to cart action
            },
            child: const Text(
              "В корзину",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

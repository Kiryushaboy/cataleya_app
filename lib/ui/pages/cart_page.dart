import 'package:coffee/ui/components/item_card_widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Моковые данные для корзины
  final List<Map<String, dynamic>> cartProducts = [
    {
      "name": "Кофе Арабика",
      "price": 120000,
      "quantity": 1,
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Кофе Латте",
      "price": 80000,
      "quantity": 2,
      "image": "https://via.placeholder.com/150"
    },
  ];

  // Метод для увеличения количества
  void increaseQuantity(int index) {
    setState(() {
      cartProducts[index]['quantity']++;
    });
  }

  // Метод для уменьшения количества
  void decreaseQuantity(int index) {
    setState(() {
      if (cartProducts[index]['quantity'] > 1) {
        cartProducts[index]['quantity']--;
      }
    });
  }

  // Метод для удаления товара из корзины
  void removeFromCart(int index) {
    setState(() {
      cartProducts.removeAt(index);
    });
  }

  // Метод для подсчёта итоговой суммы
  int getTotalPrice() {
    return cartProducts.fold(0, (sum, item) {
      return sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Корзина"),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Expanded(
            child: cartProducts.isEmpty
                ? const Center(
                    child: Text(
                      "Ваша корзина пуста",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: cartProducts.length,
                    itemBuilder: (context, index) {
                      return CartItemCardWidget(
                        name: cartProducts[index]['name'],
                        price: cartProducts[index]['price'],
                        quantity: cartProducts[index]['quantity'],
                        image: cartProducts[index]['image'],
                        onIncrease: () => increaseQuantity(index),
                        onDecrease: () => decreaseQuantity(index),
                        onRemove: () => removeFromCart(index),
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -1),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Итог: ${getTotalPrice()} сум",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: cartProducts.isEmpty
                      ? null
                      : () {
                          // Логика оформления заказа
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Заказ оформлен!")),
                          );
                          setState(() {
                            cartProducts.clear();
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    "Оформить заказ",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

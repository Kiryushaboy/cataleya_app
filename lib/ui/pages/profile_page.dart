import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userEmail = "user@example.com"; // Моковая почта пользователя
  final String userPhone = "+998 90 123 45 67"; // Моковый номер телефона
  final String userImage = "https://via.placeholder.com/150";

  const ProfilePage({super.key}); // Моковое изображение пользователя

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Профиль"),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.brown[100],
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(userImage),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    userEmail,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[700],
                    ),
                  ),
                  Text(
                    userPhone,
                    style: TextStyle(fontSize: 16, color: Colors.brown[500]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.brown),
              title: const Text("История заказов"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Логика перехода к истории заказов
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("История заказов откроется позже")),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.brown),
              title: const Text("Настройки"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Логика перехода к настройкам
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Настройки откроются позже")),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.brown),
              title: const Text("Оплата и доставка"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Логика перехода к настройкам
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Информация откроется позже")),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.brown),
              title: const Text("Контакты"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Логика перехода к настройкам
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Информация откроется позже")),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.brown),
              title: const Text("О нас"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Логика перехода к настройкам
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Информация откроется позже")),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.brown),
              title: const Text("Политика конфиденциальности"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Логика перехода к настройкам
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Информация откроется позже")),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Выйти из профиля"),
              onTap: () {
                // Логика выхода из профиля
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Выход"),
                    content:
                        const Text("Вы уверены, что хотите выйти из профиля?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Отмена"),
                      ),
                      TextButton(
                        onPressed: () {
                          // Здесь будет логика выхода
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Вы вышли из профиля")),
                          );
                        },
                        child: const Text(
                          "Выйти",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

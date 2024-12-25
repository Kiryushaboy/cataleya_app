import 'package:coffee/ui/components/list_tile_widget.dart';
import 'package:coffee/ui/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  final String userEmail = "user@example.com"; // Моковая почта пользователя
  final String userPhone = "+998 90 123 45 67"; // Моковый номер телефона
  final String userImage = "https://via.placeholder.com/150";

  const ProfilePage({super.key}); // Моковое изображение пользователя

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
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
              ListTileWidget(
                icon: Icons.history,
                title: "История заказов",
                onTap: () {
                  context.push(AppRoutes.ordersHistory);
                },
              ),
              const Divider(),
              ListTileWidget(
                icon: Icons.settings,
                title: "Настройки",
                onTap: () {
                  context.push(AppRoutes.settings);
                },
              ),
              const Divider(),
              ListTileWidget(
                icon: Icons.payment,
                title: "Оплата и доставка",
                onTap: () {
                  context.push(AppRoutes.paymentAndDelivery);
                },
              ),
              const Divider(),
              ListTileWidget(
                icon: Icons.contacts,
                title: "Контакты",
                onTap: () {
                  context.push(AppRoutes.contacts);
                },
              ),
              const Divider(),
              ListTileWidget(
                icon: Icons.info,
                title: "О нас",
                onTap: () {
                  context.push(AppRoutes.about);
                },
              ),
              const Divider(),
              ListTileWidget(
                icon: Icons.privacy_tip,
                title: "Политика конфиденциальности",
                onTap: () {
                  context.push(AppRoutes.privacyAndPolicy);
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
                      content: const Text(
                        "Вы уверены, что хотите выйти из профиля?",
                      ),
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
                                content: Text("Вы вышли из профиля"),
                              ),
                            );
                          },
                          child: const Text(
                            "Выйти",
                            style: TextStyle(
                              color: Colors.red,
                            ),
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
      ),
    );
  }
}

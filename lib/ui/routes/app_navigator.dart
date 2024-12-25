import 'package:coffee/ui/pages/about_page.dart';
import 'package:coffee/ui/pages/contacts_page.dart';
import 'package:coffee/ui/pages/home_page.dart';
import 'package:coffee/ui/pages/orders_history_page.dart';
import 'package:coffee/ui/pages/payment_and_delivery_page.dart';
import 'package:coffee/ui/pages/privacy_and_policy_page.dart';
import 'package:coffee/ui/pages/settings_page.dart';
import 'package:coffee/ui/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

// Объявление маршрутов
abstract class AppNavigator {
  static final GoRouter _routes = GoRouter(
    routes: [
      // Главный экран
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) {
          return const HomePage(); // Возвращаем экран с нижней навигацией
        },
      ),
      // Экран истории заказов
      GoRoute(
        path: AppRoutes.ordersHistory,
        builder: (context, state) {
          return const OrdersHistoryPage(); // Возвращаем экран с историей заказов
        },
      ),
      // Экран настроек
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) {
          return const SettingsPage(); // Возвращаем экран с настройками
        },
      ),
      // Экран с информацией об оплате и доставке
      GoRoute(
        path: AppRoutes.paymentAndDelivery,
        builder: (context, state) {
          return const PaymentAndDeliveryPage(); // Возвращаем экран информацией об оплате и доставке
        },
      ),
       // Экран контактов
      GoRoute(
        path: AppRoutes.contacts,
        builder: (context, state) {
          return const ContactsPage(); // Возвращаем экран с контактами
        },
      ),
      // Экран с информацией о компании
      GoRoute(
        path: AppRoutes.about,
        builder: (context, state) {
          return const AboutPage(); // Возвращаем экран с информацией о компании
        },
      ),
      // Экран с политикой конфиденциальности
      GoRoute(
        path: AppRoutes.privacyAndPolicy,
        builder: (context, state) {
          return const PrivacyAndPolicyPage(); // Возвращаем экран с политикой конфиденциальности
        },
      ),
    ],
  );
  static GoRouter get routes => _routes;
}

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  String userName = "Имя пользователя";
  String userPhone = "+998 90 123 45 67";
  String userEmail = "user@example.com";
  String userTelegram = "@telegram_user";
  String userAddress = "Улица, дом, город";
  String userImage =
      "https://via.placeholder.com/150"; // Моковое изображение пользователя

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telegramController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = userName;
    _phoneController.text = userPhone;
    _emailController.text = userEmail;
    _telegramController.text = userTelegram;
    _addressController.text = userAddress;
  }

  void _updateImage() {
    // Логика обновления изображения профиля
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Функция загрузки фото будет добавлена")),
    );
  }

  void _saveSettings() {
    setState(() {
      userName = _nameController.text;
      userPhone = _phoneController.text;
      userEmail = _emailController.text;
      userTelegram = _telegramController.text;
      userAddress = _addressController.text;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Настройки успешно сохранены!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Настройки"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: _updateImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(userImage),
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 16,
                      child: Icon(Icons.edit, size: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField("Имя", _nameController, TextInputType.name),
              const SizedBox(height: 12),
              _buildTextField(
                  "Номер телефона", _phoneController, TextInputType.phone),
              const SizedBox(height: 12),
              _buildTextField(
                  "Почта", _emailController, TextInputType.emailAddress),
              const SizedBox(height: 12),
              _buildTextField(
                  "Telegram username", _telegramController, TextInputType.text),
              const SizedBox(height: 12),
              _buildTextField("Адрес", _addressController, TextInputType.text),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveSettings,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text(
                  "Сохранить",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      TextInputType keyboardType) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}

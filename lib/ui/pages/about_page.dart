import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'О нас',
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const Text(
              'Мы обжариваем кофе уже более 5 лет на лучшем в мире оборудовании. Каждую партию отслеживаем на специальном оборудовании, что позволяет создавать стабильно качественный продукт. В свободную продажу поступает товар, прошедший строгий контроль качества. В нашем ассортименте вы найдете: - Простые понятные сорта кофе на каждый день - Редкие и необычные сорта которые смогут вас удивить - И бонусом можете попробовать большую часть как в дрип пакетах, так и в капсулах - Сиропы высокого качества, подходящие как для различных лимонадов и коктелей, так и для кофе Так же наша компания занимается подготовкой и обучением высококвалифицированных бариста. Более подробно о школе можете узнать на нашей инстаграм странице  JS Barista',
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        child: Image.network(
                          'https://cataleya.uz/static/image/IMG_0436.6f9505e3.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        child: Image.network(
                          'https://cataleya.uz/static/image/12345.fb138bc3.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        child: Image.network(
                          'https://cataleya.uz/static/image/IMG_0433.d4b96293.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        child: Image.network(
                          'https://cataleya.uz/static/image/111.41b83067.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        child: Image.network(
                          'https://cataleya.uz/static/image/IMG_0437.fc11cd94.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        child: Image.network(
                          'https://cataleya.uz/static/image/IMG_0447.944fb707.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

import 'package:coffee/ui/components/filter_button.dart';
import 'package:coffee/ui/components/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatalogBodyWidget extends StatefulWidget {
  const CatalogBodyWidget({super.key});

  @override
  State<CatalogBodyWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<CatalogBodyWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> products = [
    {
      "name": "Кофе Арабика",
      "price": "120 000 сум",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Кофе Робуста",
      "price": "100 000 сум",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Кофе Латте",
      "price": "80 000 сум",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Кофе Капучино",
      "price": "85 000 сум",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Кофе Ристретто",
      "price": "22 000 сум",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Кофе Американо",
      "price": "25 000 сум",
      "image": "https://via.placeholder.com/150"
    },
    // Добавить больше товаров по необходимости
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(text: 'Всё', icon: Icon(Icons.all_inclusive)),
              Tab(text: 'Кофе', icon: Icon(Icons.coffee)),
              Tab(text: 'Дрипы', icon: Icon(Icons.local_drink)),
              Tab(text: 'Капсулы', icon: Icon(Icons.abc)),
              Tab(text: 'Чай', icon: Icon(Icons.emoji_food_beverage)),
              Tab(text: 'Сиропы', icon: Icon(Icons.liquor)),
              Tab(text: 'Аксессуары', icon: Icon(Icons.workspaces_filled)),
              Tab(text: 'Химия', icon: Icon(Icons.cleaning_services)),
            ],
            indicatorColor: Colors.brown,
            labelColor: Colors.brown,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0.r),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Поиск товара',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilterButton(
              label: 'Под Эспрессо',
              icon: Icons.filter_alt,
              onPressed: () {},
            ),
            FilterButton(
              label: 'Под Фильтр',
              icon: Icons.filter_alt_outlined,
              onPressed: () {},
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8, // Пропорции карточки
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCardWidget(
                  name: products[index]["name"]!,
                  price: products[index]["price"]!,
                  image: products[index]["image"]!,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

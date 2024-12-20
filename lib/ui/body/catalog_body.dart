import 'package:coffee/domain/blocs/products_bloc/products_bloc.dart';
import 'package:coffee/ui/components/filter_button.dart';
import 'package:coffee/ui/components/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductsLoaded) {
                final products = state.products;
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCardWidget(product: product);
                  },
                );
              } else if (state is ProductsError) {
                return Center(
                  child: Text(
                    'Ошибка загрузки продуктов',
                    style: TextStyle(fontSize: 18.sp, color: Colors.red),
                  ),
                );
              }
              return const Center(child: Text('Неизвестное состояние'));
            },
          ),
        ),
      ],
    );
  }
}

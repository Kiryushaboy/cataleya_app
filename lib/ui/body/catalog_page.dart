import 'package:coffee/domain/api/repositories/products_repository.dart';
import 'package:coffee/domain/blocs/products_bloc/products_bloc.dart';
import 'package:coffee/ui/components/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this); // 8 вкладок
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsBloc(productsRepository: ProductsRepository())
        ..add(ProductsLoadEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Каталог',
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
        body: Column(
          children: [
            // Прокручиваемая верхняя панель с вкладками
            PreferredSize(
              preferredSize: Size.fromHeight(50.h), // Высота TabBar
              child: TabBar(
                controller: _tabController,
                isScrollable: true, // Прокручиваемый TabBar
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
            // Поле поиска
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
            // Фильтры
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterButton(
                  label: 'Под Эспрессо',
                  icon: Icons.filter_alt,
                  onPressed: () {
                    // Обработка фильтра
                  },
                ),
                FilterButton(
                  label: 'Под Фильтр',
                  icon: Icons.filter_alt_outlined,
                  onPressed: () {
                    // Обработка фильтра
                  },
                ),
              ],
            ),
            // Список продуктов
            Expanded(
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoadedState) {
                    final products = state.parameters;
                    return ListView.builder(
                      itemCount: products.total,
                      itemBuilder: (context, index) {
                        final product = products.data?[index];
                        return Card(
                          margin: EdgeInsets.all(8.r),
                          child: ProductCardWidget(
                            imageUrl:
                                'https://api.cataleya.uz:4444/uploads/1721324546126.png',
                            title: product?.name ?? 'Без названия',
                            subtitle:
                                'Цена:\nот ${product?.price.toString() ?? 'Не указано'} UZS',
                            buttonText: 'Текст кнопки',
                            onButtonPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Откроется позже"),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else if (state is ErrorState) {
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
        ),
      ),
    );
  }
}

// Виджет для кнопки фильтра
class FilterButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const FilterButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16.r),
      label: Text(label, style: TextStyle(fontSize: 14.sp)),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        side: const BorderSide(color: Colors.brown),
      ),
    );
  }
}

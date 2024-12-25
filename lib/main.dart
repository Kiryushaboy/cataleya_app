import 'package:coffee/domain/api/repositories/products_repository.dart';
import 'package:coffee/domain/blocs/products_bloc/products_bloc.dart';
import 'package:coffee/ui/routes/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ProductsBloc(
        productsRepository: ProductsRepository(),
      ),
      child: const CataleyaApp(),
    ),
  );
}

class CataleyaApp extends StatelessWidget {
  const CataleyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Размер дизайна
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          routerConfig: AppNavigator.routes,
        );
      },
    );
  }
}

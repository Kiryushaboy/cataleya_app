part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<dynamic> products; // Replace `dynamic` with your product model
  ProductsLoaded({required this.products});
}

class ProductsError extends ProductsState {}

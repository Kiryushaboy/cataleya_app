part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class LoadingState extends ProductsState {}

final class LoadedState extends ProductsState {
  final TestProducts parameters;

  LoadedState({required this.parameters});
}

final class ErrorState extends ProductsState {}

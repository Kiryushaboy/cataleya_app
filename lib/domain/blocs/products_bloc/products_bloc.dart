import 'package:bloc/bloc.dart';
import 'package:coffee/domain/api/repositories/products_repository.dart';
import 'package:coffee/domain/models/test_products.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;

  ProductsBloc({required this.productsRepository}) : super(ProductsInitial()) {
    on<ProductsLoadEvent>(
      (event, emit) async {
        emit(LoadingState());

        try {
          final TestProducts testProducts =
              await productsRepository.getAllProducts();
          emit(LoadedState(parameters: testProducts));
        } catch (e) {
          emit(ErrorState());
        }
      },
    );
  }
}

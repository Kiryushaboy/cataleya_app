import 'package:bloc/bloc.dart';
import 'package:coffee/domain/api/repositories/products_repository.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;

  ProductsBloc({required this.productsRepository}) : super(ProductsInitial());

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event is LoadProducts) {
      yield ProductsLoading();
      try {
        final products = await productsRepository.fetchProducts();
        yield ProductsLoaded(products: products);
      } catch (_) {
        yield ProductsError();
      }
    }
  }
}

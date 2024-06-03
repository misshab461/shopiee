import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopiee/domain/product/product/product.dart';
import 'package:shopiee/domain/product/repo.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepo productRepo;
  ProductBloc(this.productRepo) : super(ProductState.initial()) {
    on<GetAllProduct>((event, emit) async {
      emit(
        const ProductState(
          isLoading: true,
          hasError: false,
          getAllProduct: [],
        ),
      );

      final result = await productRepo.getAllProduct();

      result.fold((f) {
        emit(
          const ProductState(
            isLoading: false,
            hasError: true,
            getAllProduct: [],
          ),
        );
      }, (s) {
        emit(
          ProductState(
            isLoading: false,
            hasError: true,
            getAllProduct: s,
          ),
        );
      });
    });
  }
}

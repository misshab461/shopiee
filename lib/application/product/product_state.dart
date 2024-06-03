part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    required bool isLoading,
    required bool hasError,
    required List<Product> getAllProduct,
  }) = _Initial;

  factory ProductState.initial() => const ProductState(
        isLoading: false,
        hasError: false,
        getAllProduct: [],
      );
}

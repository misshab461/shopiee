import 'package:dartz/dartz.dart';
import 'package:shopiee/domain/core/failures.dart';
import 'package:shopiee/domain/product/product/product.dart';

abstract class ProductRepo {
  Future<Either<MainFailures, List<Product>>> getAllProduct();
}

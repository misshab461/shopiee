import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shopiee/domain/core/api_endpoints.dart';
import 'package:shopiee/domain/core/failures.dart';
import 'package:shopiee/domain/product/product/product.dart';
import 'package:shopiee/domain/product/repo.dart';

@LazySingleton(as: ProductRepo)
class ProductRepository implements ProductRepo {
  @override
  Future<Either<MainFailures, List<Product>>> getAllProduct() async {
    final response = await http.get(Uri.parse(ApiEndpoints.allProduct));

    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final result = jsonDecode(response.body) as List;
        final products = <Product>[];
        for (int i = 0; i < result.length; i++) {
          final product = Product.fromJson(result[i]);
          products.add(product);
        }
        log(products.toString());
        return Right(products);
      } else {
        return Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailures.clientFailure());
    }
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shopiee/application/firebase/firebase_bloc.dart' as _i8;
import 'package:shopiee/application/product/product_bloc.dart' as _i5;
import 'package:shopiee/domain/firebase/repo.dart' as _i6;
import 'package:shopiee/domain/product/repo.dart' as _i3;
import 'package:shopiee/infrastrecture/firebase/repository.dart' as _i7;
import 'package:shopiee/infrastrecture/prodect/product.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ProductRepo>(() => _i4.ProductRepository());
    gh.factory<_i5.ProductBloc>(() => _i5.ProductBloc(gh<_i3.ProductRepo>()));
    gh.lazySingleton<_i6.FirebaseFazard>(() => _i7.FirebaseRepository());
    gh.factory<_i8.FirebaseBloc>(
        () => _i8.FirebaseBloc(gh<_i6.FirebaseFazard>()));
    return this;
  }
}

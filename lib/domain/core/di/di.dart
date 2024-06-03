import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shopiee/domain/core/di/di.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjectable() async =>
    getIt.init(environment: Environment.prod);

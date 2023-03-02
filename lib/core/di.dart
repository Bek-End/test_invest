import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_invest/data/repositories/company_repository_impl.dart';
import 'package:test_invest/domain/repositories/company_repository.dart';
import 'package:test_invest/domain/usecases/company.usecase.dart';

class Di {
  static void init() {
    final getIt = GetIt.I;

    getIt.registerSingleton<Dio>(_getCompanyService());
    getIt.registerSingleton<CompanyRepository>(CompanyRepositoryImpl(getIt.get()));
    getIt.registerSingleton<CompanyUseCase>(CompanyUseCase(getIt.get()));
  }

  static Future<void> dispose() async {
    return GetIt.I.reset();
  }
}

Dio _getCompanyService() {
  return Dio(BaseOptions(
    baseUrl: 'https://www.alphavantage.co',
    queryParameters: {
      'function': 'OVERVIEW',
      'apikey': 'KXQFO36A2FFVA15P',
    },
  ));
}

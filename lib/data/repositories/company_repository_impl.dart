import 'package:dio/dio.dart';
import 'package:test_invest/data/dto/company_dto.dart';
import 'package:test_invest/domain/repositories/company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final Dio dio;
  const CompanyRepositoryImpl(this.dio);

  @override
  Future<CompanyDto?> getInfoCompanyFromName(String companyName) async {
    try {
      final res = await dio.get(
        '/query',
        queryParameters: {'symbol': companyName},
      );
      final data = res.data;
      return (data as Map).isNotEmpty ? CompanyDto.fromJson(res.data!) : null;
    } catch (e) {
      rethrow;
    }
  }
}

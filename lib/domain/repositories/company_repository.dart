import 'package:test_invest/data/dto/company_dto.dart';

abstract class CompanyRepository {
  Future<CompanyDto?> getInfoCompanyFromName(String companyName);
}

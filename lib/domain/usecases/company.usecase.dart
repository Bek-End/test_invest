import 'package:test_invest/domain/entities/company_entity.dart';
import 'package:test_invest/domain/repositories/company_repository.dart';

class CompanyUseCase {
  final CompanyRepository companyRepository;
  const CompanyUseCase(this.companyRepository);

  Future<CompanyEntity?> getInfoCompanyFromName(String companyName) async {
    final dto = await companyRepository.getInfoCompanyFromName(companyName);
    if (dto == null) return null;
    return CompanyEntity(
      symbol: dto.symbol,
      name: dto.name,
      description: dto.description,
      exchange: dto.exchange,
      currency: dto.currency,
      country: dto.country,
      sector: dto.sector,
      latestQuarter: dto.latestQuarter,
      marketCapitalization: double.tryParse(dto.marketCapitalization) ?? 0.0,
      ebitda: double.tryParse(dto.ebitda) ?? 0.0,
      peRatio: double.tryParse(dto.peRatio) ?? 0.0,
      pegRatio: double.tryParse(dto.pegRatio) ?? 0.0,
      bookValue: double.tryParse(dto.bookValue) ?? 0,
      priceToSalesRatioTtm: double.tryParse(dto.priceToSalesRatioTtm) ?? 0.0,
      priceToBookRatio: double.tryParse(dto.priceToBookRatio) ?? 0.0,
      evToRevenue: double.tryParse(dto.evToRevenue) ?? 0.0,
      evToEbitda: double.tryParse(dto.evToEbitda) ?? 0.0,
      dividendDate: dto.dividendDate,
    );
  }
}

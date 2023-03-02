import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_invest/domain/entities/company_entity.dart';
import 'package:test_invest/domain/usecases/company.usecase.dart';
import 'package:test_invest/presentation/widgets/error_overlay.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyBloc() : super(CompanyLoadingState()) {
    final CompanyUseCase companyUseCase = GetIt.I.get();
    final constSymbols = ['AAPL', 'AMZN', 'GOOG', 'MSFT', 'FB'];

    on<CompanyInitEvent>((event, emit) async {
      try {
        final companyList = <CompanyEntity>[];
        for (var i = 0; i < constSymbols.length; i++) {
          final company = await companyUseCase.getInfoCompanyFromName(constSymbols[i]);
          if (company != null) companyList.add(company);
        }
        emit(CompanyCompleteState(companyList: companyList));
      } catch (e) {
        showError(e.toString());
      }
    });
  }
}

abstract class CompanyEvent {}

class CompanyInitEvent extends CompanyEvent {}

abstract class CompanyState {}

class CompanyLoadingState extends CompanyState {}

class CompanyCompleteState extends CompanyState {
  final List<CompanyEntity> companyList;
  CompanyCompleteState({
    required this.companyList,
  });
}

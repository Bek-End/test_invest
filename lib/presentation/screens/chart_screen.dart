import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_invest/presentation/blocs/company_bloc.dart';
import 'package:test_invest/presentation/screens/company_detail_info_screen.dart';
import 'package:test_invest/presentation/widgets/loading.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanyBloc()..add(CompanyInitEvent()),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<CompanyBloc, CompanyState>(
            builder: (context, state) {
              if (state is! CompanyCompleteState) {
                return const Loading();
              }

              final companies = state.companyList;

              return PieChart(
                PieChartData(
                  centerSpaceRadius: 100.0,
                  pieTouchData: PieTouchData(
                    touchCallback: (p0, p1) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => CompanyDetailInfoScreen(
                          company: companies[p1?.touchedSection?.touchedSectionIndex ?? 0],
                        ),
                      ));
                    },
                  ),
                  sections: List.generate(
                    companies.length,
                    (index) {
                      final company = companies[index];
                      return PieChartSectionData(
                        value: company.marketCapitalization,
                        title: company.symbol,
                        showTitle: true,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

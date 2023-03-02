import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_invest/domain/entities/company_entity.dart';

class CompanyDetailInfoScreen extends StatelessWidget {
  final CompanyEntity company;
  const CompanyDetailInfoScreen({
    required this.company,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMMd();
    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        children: [
          Text(company.description),
          const SizedBox(height: 15.0),
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Title',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Value',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows: <DataRow>[
              dataRow('Symbol', company.symbol),
              dataRow('Exchange', company.exchange),
              dataRow('Currency', company.currency),
              dataRow('Country', company.country),
              dataRow('Sector', company.sector),
              dataRow('Symbol', company.symbol),
              dataRow('Latest quarter', dateFormat.format(company.latestQuarter)),
              dataRow('Capitalization', company.marketCapitalization),
              dataRow('EBITDA', company.ebitda),
              dataRow('PE/R', company.peRatio),
              dataRow('PEG/R', company.pegRatio),
              dataRow('BV', company.bookValue),
              dataRow('P/S', company.priceToSalesRatioTtm),
              dataRow('P/B', company.priceToBookRatio),
              dataRow('EV/R', company.evToRevenue),
              dataRow('EV/EBITDA', company.evToEbitda),
              dataRow('Dividend date', company.dividendDate),
            ],
          ),
        ],
      ),
    );
  }

  DataRow dataRow(String title, dynamic value) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(title)),
        DataCell(Text(value.toString())),
      ],
    );
  }
}

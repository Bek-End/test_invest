class CompanyEntity {
    CompanyEntity({
        required this.symbol,
        required this.name,
        required this.description,
        required this.exchange,
        required this.currency,
        required this.country,
        required this.sector,
        required this.latestQuarter,
        required this.marketCapitalization,
        required this.ebitda,
        required this.peRatio,
        required this.pegRatio,
        required this.bookValue,
        required this.priceToSalesRatioTtm,
        required this.priceToBookRatio,
        required this.evToRevenue,
        required this.evToEbitda,
        required this.dividendDate,
    });

    final String symbol;
    final String name;
    final String description;
    final String exchange;
    final String currency;
    final String country;
    final String sector;
    final DateTime latestQuarter;
    final double marketCapitalization;
    final double ebitda;
    final double peRatio;
    final double pegRatio;
    final double bookValue;
    final double priceToSalesRatioTtm;
    final double priceToBookRatio;
    final double evToRevenue;
    final double evToEbitda;
    final String dividendDate;

    CompanyEntity copyWith({
        String? symbol,
        String? name,
        String? description,
        String? exchange,
        String? currency,
        String? country,
        String? sector,
        DateTime? latestQuarter,
        double? marketCapitalization,
        double? ebitda,
        double? peRatio,
        double? pegRatio,
        double? bookValue,
        double? priceToSalesRatioTtm,
        double? priceToBookRatio,
        double? evToRevenue,
        double? evToEbitda,
        String? dividendDate,
    }) => 
        CompanyEntity(
            symbol: symbol ?? this.symbol,
            name: name ?? this.name,
            description: description ?? this.description,
            exchange: exchange ?? this.exchange,
            currency: currency ?? this.currency,
            country: country ?? this.country,
            sector: sector ?? this.sector,
            latestQuarter: latestQuarter ?? this.latestQuarter,
            marketCapitalization: marketCapitalization ?? this.marketCapitalization,
            ebitda: ebitda ?? this.ebitda,
            peRatio: peRatio ?? this.peRatio,
            pegRatio: pegRatio ?? this.pegRatio,
            bookValue: bookValue ?? this.bookValue,
            priceToSalesRatioTtm: priceToSalesRatioTtm ?? this.priceToSalesRatioTtm,
            priceToBookRatio: priceToBookRatio ?? this.priceToBookRatio,
            evToRevenue: evToRevenue ?? this.evToRevenue,
            evToEbitda: evToEbitda ?? this.evToEbitda,
            dividendDate: dividendDate ?? this.dividendDate,
        );

    factory CompanyEntity.fromJson(Map<String, dynamic> json) => CompanyEntity(
        symbol: json["Symbol"],
        name: json["Name"],
        description: json["Description"],
        exchange: json["Exchange"],
        currency: json["Currency"],
        country: json["Country"],
        sector: json["Sector"],
        latestQuarter: DateTime.parse(json["LatestQuarter"]),
        marketCapitalization: json["MarketCapitalization"],
        ebitda: json["EBITDA"],
        peRatio: json["PERatio"],
        pegRatio: json["PEGRatio"],
        bookValue: json["BookValue"],
        priceToSalesRatioTtm: json["PriceToSalesRatioTTM"],
        priceToBookRatio: json["PriceToBookRatio"],
        evToRevenue: json["EVToRevenue"],
        evToEbitda: json["EVToEBITDA"],
        dividendDate: json["DividendDate"],
    );

    Map<String, dynamic> toJson() => {
        "Symbol": symbol,
        "Name": name,
        "Description": description,
        "Exchange": exchange,
        "Currency": currency,
        "Country": country,
        "Sector": sector,
        "LatestQuarter": "${latestQuarter.year.toString().padLeft(4, '0')}-${latestQuarter.month.toString().padLeft(2, '0')}-${latestQuarter.day.toString().padLeft(2, '0')}",
        "MarketCapitalization": marketCapitalization,
        "EBITDA": ebitda,
        "PERatio": peRatio,
        "PEGRatio": pegRatio,
        "BookValue": bookValue,
        "PriceToSalesRatioTTM": priceToSalesRatioTtm,
        "PriceToBookRatio": priceToBookRatio,
        "EVToRevenue": evToRevenue,
        "EVToEBITDA": evToEbitda,
        "DividendDate": dividendDate,
    };
}

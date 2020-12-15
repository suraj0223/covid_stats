// https://covid19.mathdro.id/api

// To parse this JSON data, do
//
//     final covidStats = covidStatsFromJson(jsonString);

import 'dart:convert';

CovidStats covidStatsFromJson(String str) => CovidStats.fromJson(json.decode(str));

String covidStatsToJson(CovidStats data) => json.encode(data.toJson());

class CovidStats {
    CovidStats({
        this.confirmed,
        this.recovered,
        this.deaths,
        this.dailySummary,
        this.dailyTimeSeries,
        this.image,
        this.source,
        this.countries,
        this.countryDetail,
        this.lastUpdate,
    });

    Confirmed confirmed;
    Confirmed recovered;
    Confirmed deaths;
    String dailySummary;
    CountryDetail dailyTimeSeries;
    String image;
    String source;
    String countries;
    CountryDetail countryDetail;
    DateTime lastUpdate;

    factory CovidStats.fromJson(Map<String, dynamic> json) => CovidStats(
        confirmed: Confirmed.fromJson(json["confirmed"]),
        recovered: Confirmed.fromJson(json["recovered"]),
        deaths: Confirmed.fromJson(json["deaths"]),
        dailySummary: json["dailySummary"],
        dailyTimeSeries: CountryDetail.fromJson(json["dailyTimeSeries"]),
        image: json["image"],
        source: json["source"],
        countries: json["countries"],
        countryDetail: CountryDetail.fromJson(json["countryDetail"]),
        lastUpdate: DateTime.parse(json["lastUpdate"]),
    );

    Map<String, dynamic> toJson() => {
        "confirmed": confirmed.toJson(),
        "recovered": recovered.toJson(),
        "deaths": deaths.toJson(),
        "dailySummary": dailySummary,
        "dailyTimeSeries": dailyTimeSeries.toJson(),
        "image": image,
        "source": source,
        "countries": countries,
        "countryDetail": countryDetail.toJson(),
        "lastUpdate": lastUpdate.toIso8601String(),
    };
}

class Confirmed {
    Confirmed({
        this.value,
        this.detail,
    });

    int value;
    String detail;

    factory Confirmed.fromJson(Map<String, dynamic> json) => Confirmed(
        value: json["value"],
        detail: json["detail"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "detail": detail,
    };
}

class CountryDetail {
    CountryDetail({
        this.pattern,
        this.example,
    });

    String pattern;
    String example;

    factory CountryDetail.fromJson(Map<String, dynamic> json) => CountryDetail(
        pattern: json["pattern"],
        example: json["example"],
    );

    Map<String, dynamic> toJson() => {
        "pattern": pattern,
        "example": example,
    };
}


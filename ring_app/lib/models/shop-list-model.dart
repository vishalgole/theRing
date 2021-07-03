// To parse this JSON data, do
//
//     final shopListModel = shopListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ShopListModel shopListModelFromJson(String str) =>
    ShopListModel.fromJson(json.decode(str));

String shopListModelToJson(ShopListModel data) => json.encode(data.toJson());

class ShopListModel {
  ShopListModel({
    required this.shops,
    required this.shopCount,
  });

  final List<Shop> shops;
  final int shopCount;

  factory ShopListModel.fromJson(Map<String, dynamic> json) => ShopListModel(
        shops: List<Shop>.from(json["shops"].map((x) => Shop.fromJson(x))),
        shopCount: json["shop_count"],
      );

  Map<String, dynamic> toJson() => {
        "shops": List<dynamic>.from(shops.map((x) => x.toJson())),
        "shop_count": shopCount,
      };
}

class Shop {
  Shop({
    required this.id,
    required this.slug,
    required this.coverUrl,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.city,
    required this.averageRating,
    required this.reviewCount,
    required this.activityNames,
    required this.isFavourite,
    required this.distanceInMeters,
  });

  final String id;
  final String slug;
  final String coverUrl;
  final String name;
  final Address address;
  final String phoneNumber;
  final CityClass city;
  final double averageRating;
  final int reviewCount;
  final List<String> activityNames;
  final bool isFavourite;
  final int distanceInMeters;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"],
        slug: json["slug"],
        coverUrl: json["cover_url"],
        name: json["name"],
        address: Address.fromJson(json["address"]),
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        city: CityClass.fromJson(json["city"]),
        averageRating: json["average_rating"] == null
            ? null
            : json["average_rating"].toDouble(),
        reviewCount: json["review_count"],
        activityNames: List<String>.from(json["activity_names"].map((x) => x)),
        isFavourite: json["is_favourite"],
        distanceInMeters: json["distance_in_meters"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "cover_url": coverUrl,
        "name": name,
        "address": address.toJson(),
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "city": city.toJson(),
        "average_rating": averageRating == null ? null : averageRating,
        "review_count": reviewCount,
        "activity_names": List<dynamic>.from(activityNames.map((x) => x)),
        "is_favourite": isFavourite,
        "distance_in_meters": distanceInMeters,
      };
}

class Address {
  Address({
    required this.address1,
    required this.zipCode,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  final String address1;
  final String zipCode;
  final CityEnum city;
  final Country country;
  final double latitude;
  final double longitude;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address1: json["address1"],
        zipCode: json["zip_code"],
        city: cityEnumValues.map[json["city"]]!,
        country: countryValues.map[json["country"]]!,
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "address1": address1,
        "zip_code": zipCode,
        "city": cityEnumValues.reverse[city],
        "country": countryValues.reverse[country],
        "latitude": latitude,
        "longitude": longitude,
      };
}

enum CityEnum { LILLE }

final cityEnumValues = EnumValues({"Lille": CityEnum.LILLE});

enum Country { FRANCE }

final countryValues = EnumValues({"France": Country.FRANCE});

class CityClass {
  CityClass({
    required this.id,
    required this.slug,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.zipCode,
    required this.country,
    required this.countryDetails,
  });

  final String id;
  final Slug slug;
  final CityEnum name;
  final double latitude;
  final double longitude;
  final String zipCode;
  final Country country;
  final CountryDetails countryDetails;

  factory CityClass.fromJson(Map<String, dynamic> json) => CityClass(
        id: json["id"],
        slug: slugValues.map[json["slug"]]!,
        name: cityEnumValues.map[json["name"]]!,
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        zipCode: json["zip_code"],
        country: countryValues.map[json["country"]]!,
        countryDetails: CountryDetails.fromJson(json["country_details"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slugValues.reverse[slug],
        "name": cityEnumValues.reverse[name],
        "latitude": latitude,
        "longitude": longitude,
        "zip_code": zipCode,
        "country": countryValues.reverse[country],
        "country_details": countryDetails.toJson(),
      };
}

class CountryDetails {
  CountryDetails({
    required this.name,
    required this.countryCode,
    required this.languageCode,
  });

  final Country name;
  final CountryCode countryCode;
  final LanguageCode languageCode;

  factory CountryDetails.fromJson(Map<String, dynamic> json) => CountryDetails(
        name: countryValues.map[json["name"]]!,
        countryCode: countryCodeValues.map[json["country_code"]]!,
        languageCode: languageCodeValues.map[json["language_code"]]!,
      );

  Map<String, dynamic> toJson() => {
        "name": countryValues.reverse[name],
        "country_code": countryCodeValues.reverse[countryCode],
        "language_code": languageCodeValues.reverse[languageCode],
      };
}

enum CountryCode { FR }

final countryCodeValues = EnumValues({"FR": CountryCode.FR});

enum LanguageCode { FR_FR }

final languageCodeValues = EnumValues({"fr-FR": LanguageCode.FR_FR});

enum Slug { LILLE }

final slugValues = EnumValues({"lille": Slug.LILLE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

class RequestObject {
  Map<String, dynamic> setRequestPayload(
    latitude,
    longitude,
    products,
    filter,
    distance,
    city,
    limit,
    offset,
  ) {
    Map<String, dynamic> requestObj = {};
    if (latitude != null && latitude != "") {
      requestObj["latitude"] = latitude;
    }

    if (longitude != null && longitude != "") {
      requestObj["longitude"] = longitude;
    }

    if (products != null && products != "") {
      requestObj["include[products]"] = products;
    }

    if (filter != null && filter != "") {
      requestObj["filter[selling_products]"] = filter;
    }

    if (distance != null && distance != "") {
      requestObj["filter[distance]"] = distance;
    }

    if (city != null && city != "") {
      requestObj["city"] = city.toString();
    }

    if (limit != null && limit != "") {
      requestObj["limit"] = limit.toString();
    }

    if (offset != null && offset != "") {
      requestObj["offset"] = offset.toString();
    }
    print("$requestObj");
    return requestObj;
  }
}

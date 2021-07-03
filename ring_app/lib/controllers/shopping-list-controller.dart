import 'dart:convert';

import 'package:get/get.dart';
import 'package:ring_app/services/shopping-list-service.dart';

class ShoppingListController extends GetxController {
  Future<dynamic> getList(city, limit, offset) async {
    var response = await ShopplingListService()
        .getShoppingList(city: city, limit: limit, offset: offset);
    print("$response");
    // var res = jsonDecode(response);
    // print("$res");
  }
}

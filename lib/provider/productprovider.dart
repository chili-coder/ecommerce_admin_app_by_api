import 'package:ecommerce_admin_app_by_api/http/custome_http_request.dart';
import 'package:ecommerce_admin_app_by_api/model/productmodel.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> productList = [];
  late ProductModel oproductModel;

  getProduct() async {
    productList = await CustomHttpRequest().getProductData();
    notifyListeners();
  }
}

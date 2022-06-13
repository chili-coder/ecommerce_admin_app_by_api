import 'package:ecommerce_admin_app_by_api/http/custome_http_request.dart';
import 'package:ecommerce_admin_app_by_api/model/categorymodel.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categoryList = [];
  late CategoryModel categoryModel;

  getCategory() async {
    categoryList = await CustomHttpRequest().getAllCategory();
    notifyListeners();
  }
}

import 'package:ecommerce_admin_app_by_api/http/custome_http_request.dart';
import 'package:ecommerce_admin_app_by_api/model/ordermodel.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> orderList = [];
  late OrderModel orderModel;

  getOrder() async {
    orderList = await CustomHttpRequest().getAllOrders();
    notifyListeners();
  }
}
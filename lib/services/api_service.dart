import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:restapiflutter/services/constants.dart';
import 'package:restapiflutter/models/user_model.dart';

class ApiService {

  Future<List<UserModel>?> getProducts() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode != 200) return null; {
        List<UserModel> _model = productModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
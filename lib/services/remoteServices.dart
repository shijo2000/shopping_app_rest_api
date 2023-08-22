import 'package:http/http.dart' as http;
import 'package:shopping_app_rest_apii/models/product.dart';

class RemoteServices{
  static var client = http.Client();

  static Future<List<Products>?> fetchProducts() async{
    var response = await client.get(Uri.parse('http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline') );
    if(response.statusCode == 200){
      var jsonString = response.body;
      return productsFromJson(jsonString);
    }
    else{
      return null;
    }
  }
}
import 'package:get/get.dart';

import '../models/product.dart';
import '../services/remoteServices.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = <Products>[].obs;


  @override
  void onInit(){
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async{
    isLoading(true);
    try {
      var products = await   RemoteServices.fetchProducts();
      if(products!=null){
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
    }
 }




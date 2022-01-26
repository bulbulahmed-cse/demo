import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:product_view/views/home_page_controller.dart';

class ProductDetailsController extends GetxController{
  var price = "0.0".obs;
  RxInt quantity = 0.obs;

  getPrice(selectedColorIndex,selectedSizeIndex) async {
    final homeController = Get.find<HomePageController>();

    homeController.productList.value.products?[homeController.selectedItem].price?.forEach((element) {
      if(element.colorSize=="${homeController.productList.value.products?[homeController.selectedItem].color?[selectedColorIndex]}${homeController.productList.value.products?[homeController.selectedItem].size?[selectedSizeIndex]}"){
        price.value = element.price.toString();
      }
    });
  }

  add(){
    quantity.value += 1;
  }
  minus(){
    if(quantity.value-1 >0){
      quantity.value -= 1;
    }
  }

  @override
  void onInit() {
    getPrice(0, 0);
    super.onInit();
  }

}

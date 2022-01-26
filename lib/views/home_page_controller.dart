import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:product_view/models/products_response.dart';

class HomePageController extends GetxController{
  var productList = ProductsResponse().obs;
  var isLoading = false.obs;
  late int selectedItem;
  @override
  void onInit() {
    getDataFromFirebase();
    super.onInit();
  }

  Future<void> getDataFromFirebase() async {
    isLoading(true);
    DatabaseReference ref = FirebaseDatabase.instance.ref();

// Get the data once
    DatabaseEvent event = await ref.once();

// Print the data of the snapshot
    print(event.snapshot.value);

    productList.value = ProductsResponse.fromJson(event.snapshot.value);
    print(productList.value.products?[0].productName);
    isLoading(false);
  }
}
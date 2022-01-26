import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_view/views/home_page_controller.dart';
import 'package:product_view/views/product/add_product.dart';
import 'package:product_view/views/product/product_details.dart';
import 'package:product_view/widgets/AppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());
    final orientation = MediaQuery.of(context).orientation;
    return Obx(()=>Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  const Expanded(child: Text("Products",textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),maxLines: 2,)),
                  IconButton(onPressed: (){
                    Get.to(()=>const AddProduct());
                  }, icon: const Icon(Icons.create,color: Colors.amber,))

                ],
              ),
              Expanded(
                child: controller.isLoading.value?const Center(child: CircularProgressIndicator(),):GridView.builder(
                  itemCount: controller.productList.value.products?.length??0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                    childAspectRatio: .9
                  ),
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){
                        controller.selectedItem=index;
                        Get.to(()=> const ProductsDetails());
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Image.network("${controller.productList.value.products?[index].thumbnail}",height: 100,width: 100,),
                          ),
                          const Text("100 items are available",textAlign: TextAlign.center,style: TextStyle(color: Colors.amber,fontSize: 10),),
                          Text("${controller.productList.value.products?[index].productName}",textAlign: TextAlign.center,style: const TextStyle(color: Colors.black,fontSize: 14),maxLines: 2,),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text("Price ${controller.productList.value.products?[index].price?[0].price}",textAlign: TextAlign.center,style: const TextStyle(color: Colors.amber,fontSize: 14),),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.black,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          selectedLabelStyle: const TextStyle(color: Colors.amber),
          currentIndex: index,
          onTap: (i){
            setState(() {
              index = i;
            });
          },

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "My Account"),
          ],
        ),
      ),
    );
  }
}

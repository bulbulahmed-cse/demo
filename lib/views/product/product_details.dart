import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_view/utils/shape.dart';
import 'package:product_view/views/home_page_controller.dart';
import 'package:product_view/views/product/product_details_controller.dart';
import 'package:product_view/widgets/AppBar.dart';
import 'package:product_view/widgets/space.dart';

class ProductsDetails extends StatefulWidget {
  const ProductsDetails({Key? key}) : super(key: key);

  @override
  _ProductsDetailsState createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  var selectedImage = Get.find<HomePageController>()
      .productList
      .value
      .products?[Get.find<HomePageController>().selectedItem]
      .image?[0];
  var selectedSizeIndex = 0;

  var  selectedColorIndex = 0;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();
    final detailsController = Get.put(ProductDetailsController());
    return Scaffold(
      appBar: appBar(),
      body: Obx(()=>Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            space(),
            Image.network(
              "$selectedImage",
              width: Get.width*.5,
              height: Get.width*.5,
            ),
            space(),
            SizedBox(
              height: Get.width*.15,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                  itemCount: controller.productList.value.products?[controller.selectedItem].image?.length??0,
                  itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedImage = controller.productList.value.products?[controller.selectedItem].image?[index];
                      });
                    },
                    child: Image.network(
                      "${controller.productList.value.products?[controller.selectedItem].image?[index]}",
                      width: Get.width*.15,
                      height: Get.width*.15,
                    ),
                  ),
                );
              }),
            ),
            space(),
            Text("${controller.productList.value.products?[controller.selectedItem].productName}",style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),maxLines: 2,),
            space(),

            Text("${controller.productList.value.products?[controller.selectedItem].description}",style: const TextStyle(color: Colors.black,fontSize: 14,),maxLines: 2,),
            space(),

            Text(detailsController.price.value,style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),maxLines: 2,),
            space(),
            const Text("Size",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),maxLines: 2,),

            Wrap(
              spacing: 5,
              children: List<Widget>.generate(
                  controller.productList.value.products?[controller.selectedItem].size?.length ?? 0, (i) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedSizeIndex = i;
                      detailsController.getPrice(selectedColorIndex,selectedSizeIndex);
                       });
                  },
                  child: Chip(
                    shape: Shape.shapeRoundedRectangle(),
                    side: BorderSide(
                        color: i==selectedSizeIndex?Colors.amber:Colors.black38, width: 1),
                    label: Text(
                      "${controller.productList.value.products?[controller.selectedItem].size?[i]}",
                      style: const TextStyle(color: Colors.black,fontSize: 12,),
                    ),
                  ),
                );
              }),
            ),

            const Text("Color",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),maxLines: 2,),

            Wrap(
              spacing: 5,
              children: List<Widget>.generate(
                  controller.productList.value.products?[controller.selectedItem].color?.length ?? 0, (i) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedColorIndex = i;
                      detailsController.getPrice(selectedColorIndex,selectedSizeIndex);
                    });
                  },
                  child: Chip(
                    shape: Shape.shapeRoundedRectangle(),
                    side: BorderSide(
                        color: i==selectedColorIndex?Colors.amber:Colors.black38, width: 1),
                    label: Text(
                      "${controller.productList.value.products?[controller.selectedItem].color?[i]}",
                      style: const TextStyle(color: Colors.black,fontSize: 12,),
                    ),
                  ),
                );
              }),
            ),
            Row(
              children: [
                IconButton(onPressed: (){
                  detailsController.minus();
                }, icon: const Icon(Icons.arrow_circle_down_sharp,color: Colors.black,)),
                Text(detailsController.quantity.toString(),style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),maxLines: 2,),
                IconButton(onPressed: (){
                  detailsController.add();
                }, icon: const Icon(Icons.arrow_circle_up_sharp,color: Colors.black,)),

                Text(controller.productList.value.products![controller.selectedItem].totalItem! >= detailsController.quantity.value?"Available":"Sold Out",style: const TextStyle(color: Colors.amber,fontSize: 14,fontWeight: FontWeight.bold),maxLines: 2,),
              ],
            )

          ],
        ),
      ),),
    );
  }
}

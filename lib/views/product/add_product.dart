import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_view/views/product/add_product_controller.dart';
import 'package:product_view/widgets/AppBar.dart';
import 'package:product_view/widgets/space.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  XFile? image;
  List<XFile>? images;
  _imgFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.image = image;
    });
  }
  _mimgFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();
    setState(() {
      this.images = images;
    });
  }
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddProductController());
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              space(),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
              ),
              space(),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              space(),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
              ),
              space(),
              const Text(
                "Thumbnail",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              space(),
              GestureDetector(
                onTap: (){
                  _imgFromGallery();
                },
                child: image != null
                    ? ClipRRect(
                        child: Image.file(
                          File(image!.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
              space(),
              const Text(
                "Image",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              space(),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      _mimgFromGallery();
                    },
                    child:  Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: images?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_,i){
                        return ClipRRect(
                          child: Image.file(
                            File(images![i].path),
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

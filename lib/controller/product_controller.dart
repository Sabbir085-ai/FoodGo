import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/models/product_model.dart';
import 'package:foodgo/services/product_firebase_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductServices productServices = ProductServices();

  var isloading = false.obs;
  var product = <ProductModel>[].obs;

  final TextEditingController productnameController = TextEditingController();
  final TextEditingController productImageController = TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();
  final TextEditingController productpriceController = TextEditingController();

  Future fetchProduct() async {
    try {
      isloading.value = true;
      final data = await productServices.getAllProduct();
      if (data.isNotEmpty) {
        product.assignAll(data);
      }
      isloading.value = false;
    } catch (e) {
      throw Exception("Something Went Wrong");
    }
  }

  Future addProduct(ProductModel productModel) async {
    isloading.value = true;
    await productServices.createProduct(productModel);
    Get.snackbar("Success", "Product Create Successfully",backgroundColor: Colors.green,colorText: Colors.white);
    isloading.value = false;
    await fetchProduct();
    clearAll();

  }


  clearAll(){
    productnameController.clear();
    productpriceController.clear();
    productImageController.clear();
    productDescriptionController.clear();
  }


  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }


}
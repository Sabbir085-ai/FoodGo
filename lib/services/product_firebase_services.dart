import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodgo/models/product_model.dart';

class ProductServices {
  final CollectionReference productcollection = FirebaseFirestore.instance
      .collection("products");

  Future createProduct(ProductModel productmodel) async {
    await productcollection.add(productmodel.toJson());
  }

  Future<List<ProductModel>> getAllProduct() async {
    final snapshot = await productcollection.get();

    return snapshot.docs
        .map(
          (value) => ProductModel.fromJson(
            value.data() as Map<String, dynamic>,
            value.id,
          ),
        )
        .toList();
  }

  Future updateproduct(ProductModel productModel) async {
    await productcollection.doc(productModel.id).update(productModel.toJson());
  }

  Future deleteProduct(String id) async {
    await productcollection.doc(id).delete();
  }
}
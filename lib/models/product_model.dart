class ProductModel {
  String? id;
  String? name;
  String? images;
  String? description;
  String? price;

  ProductModel({
    this.id,
    this.name,
    this.images,
    this.description,
    this.price,

  });

  factory ProductModel.fromJson(Map<String, dynamic> json,String id) => ProductModel(
    id: id,
    name: json["name"],
    images: json["images"],
    description: json["description"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "images": images,
    "description": description,
    "price": price,
  };
}
import 'dart:convert';

class Product {
  int id;
  String title;
  double price;
  String description;
  String image;
  String category;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.category});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': title,
      'descirption': description,
      'price': price,
      'image': image,
      'category': category,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'] as String,
      description: map['description'],
      price: double.parse(map['price'].toString()),
      image: map['image'],
      category: map['category'],
    );
  }

  String toJson() => json.encode(toMap());
  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}

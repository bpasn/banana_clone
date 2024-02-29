import 'dart:convert';


class Category {
  int id;
  String name;
  String image;
  String creationAt;
  String updatedAt;

  Category(
      {required this.id,
      required this.name,
      required this.image,
      required this.creationAt,
      required this.updatedAt});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "image": image,
      "creationAt": creationAt,
      "updatedAt": updatedAt
    };
  }

  factory  Category.fromMap(Map<String, dynamic> m) {
    return Category(
        id: m['id'],
        name: m['name'],
        image: m['image'],
        creationAt: m['creationAt'],
        updatedAt: m['updatedAt']);
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String s) =>
      Category.fromMap(json.decode(s) as Map<String, dynamic>);
}

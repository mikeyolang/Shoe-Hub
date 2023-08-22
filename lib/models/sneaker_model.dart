import 'dart:convert';

Sneakers sneakersFromJson(String str) => Sneakers.fromJson(json.decode(str));

class Sneakers {
  final String id;
  final String name;
  final String category;
  final String size;
  final String color;
  final String price;
  final String image;
  final String oldPrice;
  final List<dynamic> sizes;
  final String description;

  Sneakers({
    required this.id,
    required this.name,
    required this.category,
    required this.size,
    required this.color,
    required this.price,
    required this.image,
    required this.oldPrice,
    required this.sizes,
    required this.description,
  });

  factory Sneakers.fromJson(Map<String, dynamic> json) => Sneakers(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        size: json["size"],
        color: json["color"],
        price: json["price"],
        image: json["image"],
        oldPrice: json["oldPrice"],
        sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
        description: json["description"],
      );

  
}

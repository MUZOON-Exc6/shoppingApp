class Product {
  late int id;
  late double price;
  late String name, image, brand, describtion;
  late List<String> thumbnails;
  Product({
    required this.id,
    required this.price,
    required this.name,
    required this.brand,
    required this.describtion,
    required this.image,
    required this.thumbnails,
  });
  Product.fromMap(Map<String, dynamic> row) {
    id = row["id"];
    name = row["name"];
    price = row["price"];
    brand = row["brand"];
    describtion = row["description"];
    image = row["image"];
    thumbnails = row["thumbnails"];
  }
}

class Reward {
  final String id;
  final int price;
  final String title;
  final String description;
  // final String logo;
  final String image;

  Reward({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    // required this.logo,
    required this.image,
  });

  Reward.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        price = json["price"],
        title = json["title"],
        description = json["description"],
        image = json["image"];
}

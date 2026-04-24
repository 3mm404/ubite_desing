class FoodCardCartModel {
  final List<String> imageUrls; // A list of image URLs
  final String title;
  final String description;
  final double price;

  FoodCardCartModel({
    required this.imageUrls,
    required this.title,
    required this.description,
    required this.price,
  });
}

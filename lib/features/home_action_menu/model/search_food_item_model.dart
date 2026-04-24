class SearchFoodItemModel {
  final String title;
  final String imageUrl;
  final double distance;
  final double rating;
  final int reviews;
  final double price;
  final List<SearchFoodItemModel> recommendedItems;

  SearchFoodItemModel({
    required this.title,
    required this.imageUrl,
    required this.distance,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.recommendedItems,
  });
}

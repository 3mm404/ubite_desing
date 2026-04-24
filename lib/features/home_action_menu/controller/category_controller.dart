import 'package:foodu/features/home_action_menu/model/food_category.dart';
import 'package:foodu/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  var foodCategories = <FoodCategory>[
    FoodCategory(name: 'Hamburger', imageUrl: TImages.burger),
    FoodCategory(name: 'Pizza', imageUrl: TImages.pizza),
    FoodCategory(name: 'Noodles', imageUrl: TImages.noodles),
    FoodCategory(name: 'Meat', imageUrl: TImages.meat),
    FoodCategory(name: 'Vegetable', imageUrl: TImages.vegetable),
    FoodCategory(name: 'Dessert', imageUrl: TImages.dessert),
    FoodCategory(name: 'Drink', imageUrl: TImages.drink),
    FoodCategory(name: 'Bread', imageUrl: TImages.bread),
    FoodCategory(name: 'Croissant', imageUrl: TImages.croissant),
    FoodCategory(name: 'Cheese', imageUrl: TImages.cheese),
    FoodCategory(name: 'French Fries', imageUrl: TImages.frenchFries),
    FoodCategory(name: 'Sandwich', imageUrl: TImages.sandwich),
    FoodCategory(name: 'Pot of Food', imageUrl: TImages.potOfFood),
    FoodCategory(name: 'Salad', imageUrl: TImages.salad),
    FoodCategory(name: 'Bento', imageUrl: TImages.bento),
    FoodCategory(name: 'Cooked Rice', imageUrl: TImages.rice),
    FoodCategory(name: 'Spaghetti', imageUrl: TImages.spaghetty),
    FoodCategory(name: 'Sushi', imageUrl: TImages.sushi),
    FoodCategory(name: 'Ice Cream', imageUrl: TImages.iceCream),
    FoodCategory(name: 'Cookies', imageUrl: TImages.cookies),
    FoodCategory(name: 'Beverages', imageUrl: TImages.beverages),
  ].obs;
}

import 'package:aspen_travel/data/model/product_model.dart';

class Constants {
  static const internetErrorMessage =
      "Connection Lost. Please check your Internet connection.";

  static const defaultErrorMessage =
      "Something went wrong! Please try again later.";

  static List<ProductModel> carouselItems = [
    ProductModel(
        productImagePath: "assets/images/image1.png",
        productPlaceName: "Aspen, USA",
        productPlaceRate: 4.5,
        productPlacePeriod: "Summer",
        productPlaceDescription: "Beautiful place in USA",
        productPlaceReviews: 100,
        productPlacePrice: 200,
        isFaviroute: false,
        isPopular: true,
        isRecommended: false),
    ProductModel(
        productImagePath: "assets/images/image2.png",
        productPlaceName: "Bali, Indonesia",
        productPlaceRate: 4.8,
        productPlacePeriod: "Winter",
        productPlaceDescription: "Beautiful beach in Bali",
        productPlaceReviews: 150,
        productPlacePrice: 250,
        isFaviroute: true,
        isPopular: true,
        isRecommended: false),
    ProductModel(
        productImagePath: "assets/images/image4.png",
        productPlaceName: "Aspen, USA",
        productPlaceRate: 4.5,
        productPlacePeriod: "Summer",
        productPlaceDescription: "Beautiful place in USA",
        productPlaceReviews: 100,
        productPlacePrice: 200,
        isFaviroute: false,
        isPopular: true,
        isRecommended: false),
    ProductModel(
        productImagePath: "assets/images/image3.png",
        productPlaceName: "Bali, Indonesia",
        productPlaceRate: 4.8,
        productPlacePeriod: "Winter",
        productPlaceDescription: "Beautiful beach in Bali",
        productPlaceReviews: 150,
        productPlacePrice: 250,
        isFaviroute: true,
        isPopular: true,
        isRecommended: false),
    ProductModel(
        productImagePath: "assets/images/image1.png",
        productPlaceName: "NewYork, USA",
        productPlaceRate: 4.7,
        productPlacePeriod: "3D/4N",
        productPlaceDescription: "Eiffel Tower view",
        productPlaceReviews: 200,
        productPlacePrice: 300,
        isFaviroute: true,
        isPopular: false,
        isRecommended: true),

    ProductModel(
        productImagePath: "assets/images/image4.png",
        productPlaceName: "Paris, France",
        productPlaceRate: 4.7,
        productPlacePeriod: "5D/6N",
        productPlaceDescription: "Eiffel Tower view",
        productPlaceReviews: 200,
        productPlacePrice: 300,
        isFaviroute: true,
        isPopular: false,
        isRecommended: true),

  ];

  static const List<String> locations = [
    "aspen,USA ",
    "bali,Indonesia ",
    "paris,France "
  ];
  static const List<String> tabs = ["Location", "Hotels", "Food", "adventure"];
}

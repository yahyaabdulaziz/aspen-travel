class ProductModel {
  String? productImagePath;
  String? productPlaceName;
  String? productPlacePeriod;
  String? productPlaceDescription;
  int? productPlaceReviews;
  double? productPlaceRate;
  int? productPlacePrice;
  bool? isFaviroute;
  bool isPopular;
  bool isRecommended;

  ProductModel(
      {this.productImagePath,
      this.productPlaceName,
      this.productPlacePeriod,
      this.productPlaceDescription,
      this.productPlaceReviews,
      this.productPlaceRate,
      this.productPlacePrice,
      this.isFaviroute,
      required this.isPopular,
      required this.isRecommended});
}

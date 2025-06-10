class ProductDetailsModel {
  int? id;
  String? userCreatedId;
  String? name;
  String? description;
  String? imageUrl;
  double? price;
  double? oldPrice;
  bool? inStock;
  int? averageRating;
  int? totalRatings;
  int? unitsSold;
  String? color;
  String? size;
  String? dimensions;
  int? productCategoryId;
  String? categoryName;
  bool? isAuction;
  String? auctionStartTime;
  String? auctionEndTime;
  int? currentBid;
  int? currentWinnerUserId;
  bool? isAuctionClosed;
  String? createdAt;

  ProductDetailsModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'] as int?;
    userCreatedId = data['userCreatedId'] as String?;
    name = data['name'] as String?;
    description = data['description'] as String?;
    imageUrl = data['imageUrl'] as String?;
    price = data['price'] as double?;
    oldPrice = data['oldPrice'] as double?;
    inStock = data['inStock'] as bool?;
    averageRating = data['averageRating'] as int?;
    totalRatings = data['totalRatings'] as int?;
    unitsSold = data['unitsSold'] as int?;
    color = data['color'] as String?;
    size = data['size'] as String?;
    dimensions = data['dimensions'] as String?;
    productCategoryId = data['productCategoryId'] as int?;
    categoryName = data['categoryName'] as String?;
    isAuction = data['isAuction'] as bool?;
    auctionStartTime = data['auctionStartTime'] as String?;
    auctionEndTime = data['auctionEndTime'] as String?;
    currentBid = data['currentBid'] as int?;
    currentWinnerUserId = data['currentWinnerUserId'] as int?;
    isAuctionClosed = data['isAuctionClosed'] as bool?;
    createdAt = data['createdAt'] as String?;
  }
}

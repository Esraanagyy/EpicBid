class ProductModel {
  int? id;
  String? name;
  int? price;
  String? imageUrl;
  String? color;
  bool? isAuction;
  String? auctionStartTime;
  String? auctionEndTime;

  ProductModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'].toInt();
    name = data['name'];
    price = data['price'].toInt();
    imageUrl = data['imageUrl'];
    color = data['color'];
    isAuction = data['isAuction'];
    auctionStartTime = data['auctionStartTime'];
    auctionEndTime = data['auctionEndTime'];
  }
}

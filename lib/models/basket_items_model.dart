class BasketItemModel {
  int? id;
  String? productName;
  String? pictureUrl;
  double? price;
  int? quantity;
  String? category;

  BasketItemModel({
    this.id,
    this.productName,
    this.pictureUrl,
    this.price,
    this.quantity,
    this.category,
  });

  BasketItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    productName = json['productName'];
    pictureUrl = json['pictureUrl'];
    price = json['price']?.toDouble();
    quantity = json['quantity']?.toInt();
    category = json['category']?.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'pictureUrl': pictureUrl,
      'price': price,
      'quantity': quantity,
      'category': category,
    };
  }
}

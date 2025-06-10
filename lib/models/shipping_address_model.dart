class ShippingAddressModel {
  final String firstName;
  final String lastName;
  final String street;
  final String city;
  final String country;

  ShippingAddressModel({
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.city,
    required this.country,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'lastName': lastName,
      'street': street,
      'city': city,
      'country': country,
    };
  }

  // Create from JSON
  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      firstName: json['FirstName'] ?? '',
      lastName: json['lastName'] ?? '',
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      country: json['country'] ?? '',
    );
  }
}

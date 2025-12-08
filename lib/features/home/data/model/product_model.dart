class ProductModel {
  final int id;
  final String brand;
  final String name;
  final String price;
  final String? priceSign;
  final String? currency;
  final String imageLink;
  final String productLink;
  final String websiteLink;
  final String description;
  final double? rating;
  final String? category;
  final String productType;
  final List<String> tagList;
  final String createdAt;
  final String updatedAt;
  final String productApiUrl;
  final String apiFeaturedImage;
  final List<ProductColor> productColors;

  ProductModel({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    this.priceSign,
    this.currency,
    required this.imageLink,
    required this.productLink,
    required this.websiteLink,
    required this.description,
    this.rating,
    this.category,
    required this.productType,
    required this.tagList,
    required this.createdAt,
    required this.updatedAt,
    required this.productApiUrl,
    required this.apiFeaturedImage,
    required this.productColors,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      brand: json["brand"] ?? "",
      name: json["name"] ?? "",
      price: json["price"] ?? "",
      priceSign: json["price_sign"],
      currency: json["currency"],
      imageLink: json["image_link"] ?? "",
      productLink: json["product_link"] ?? "",
      websiteLink: json["website_link"] ?? "",
      description: json["description"] ?? "",
      rating: json["rating"] != null
          ? (json["rating"] as num).toDouble()
          : null,
      category: json["category"],
      productType: json["product_type"] ?? "",
      tagList: List<String>.from(json["tag_list"] ?? []),
      createdAt: json["created_at"] ?? "",
      updatedAt: json["updated_at"] ?? "",
      productApiUrl: json["product_api_url"] ?? "",
      apiFeaturedImage: json["api_featured_image"] ?? "",
      productColors:
          (json["product_colors"] as List<dynamic>?)
              ?.map((e) => ProductColor.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "brand": brand,
      "name": name,
      "price": price,
      "price_sign": priceSign,
      "currency": currency,
      "image_link": imageLink,
      "product_link": productLink,
      "website_link": websiteLink,
      "description": description,
      "rating": rating,
      "category": category,
      "product_type": productType,
      "tag_list": tagList,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "product_api_url": productApiUrl,
      "api_featured_image": apiFeaturedImage,
      "product_colors": productColors.map((e) => e.toJson()).toList(),
    };
  }
}

class ProductColor {
  final String hexValue;
  final String colourName;

  ProductColor({required this.hexValue, required this.colourName});

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      hexValue: json["hex_value"] ?? "",
      colourName: json["colour_name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {"hex_value": hexValue, "colour_name": colourName};
  }
}

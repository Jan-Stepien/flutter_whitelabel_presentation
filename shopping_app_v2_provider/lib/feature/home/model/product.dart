class Product {
  final int id;
  final String assetImageFile;
  final String productName;
  final String productDescription;

  Product(
      this.id, this.assetImageFile, this.productName, this.productDescription);

  Product.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        assetImageFile = map['assetImageFile'],
        productName = map['productName'],
        productDescription = map['productDescription'];
}

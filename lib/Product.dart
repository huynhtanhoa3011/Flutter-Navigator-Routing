class Product {
  final String? name;
  final String? description;
  final int? price;
  final String? image;
  Product(this.name, this.description, this.price, this.image);
  static List <Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(
        Product("Iphone XS Mas", "prouct of Apple", 1000, "assets/iphone10.jpg")
    );
    items.add(
        Product("Samsung Galaxy", "prouct of Samsung", 1500, "assets/samsung.jpg")
    );
    items.add(
        Product("Sony Xperial", "prouct of Apple", 2000, "assets/sony.jpg")
    );
    items.add(
        Product("Oppo X7", "prouct of Oppo", 2500, "assets/oppo.jpg")
    );
    items.add(
        Product("Motorola Z", "prouct of Motorola", 3000, "assets/motorola.jpg")
    );
    return items;
  }
}
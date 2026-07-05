class Embroidery {
  final int id;
  final String title;
  final String description;
  final double price;
  final List<String> sizes;
  final String imageUrl;

  Embroidery({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.sizes,
    required this.imageUrl,
  });
}

final List<Embroidery> embroideryList = [
  Embroidery(
    id: 1,
    title: "Rose Bouquet",
    description:
        "Beautiful handcrafted rose embroidery perfect for dresses and home décor.",
    price: 12.99,
    sizes: ["4×4", "5×7", "6×10"],
    imageUrl: "https://picsum.photos/id/1011/800/900",
  ),
  Embroidery(
    id: 2,
    title: "Sunflower Garden",
    description: "Bright sunflower embroidery with rich stitching details.",
    price: 14.99,
    sizes: ["5×7", "6×8", "8×10"],
    imageUrl: "https://picsum.photos/id/1025/800/900",
  ),
  Embroidery(
    id: 3,
    title: "Peacock Feather",
    description: "Elegant peacock feather embroidery featuring vibrant colors.",
    price: 18.99,
    sizes: ["6×10", "8×8", "9×12"],
    imageUrl: "https://picsum.photos/id/1035/800/900",
  ),
  Embroidery(
    id: 4,
    title: "Butterfly Dreams",
    description: "Delicate butterfly embroidery ideal for children's clothing.",
    price: 10.99,
    sizes: ["4×4", "5×5"],
    imageUrl: "https://picsum.photos/id/1043/800/900",
  ),
  Embroidery(
    id: 5,
    title: "Traditional Mandala",
    description: "Intricate mandala embroidery inspired by traditional art.",
    price: 19.99,
    sizes: ["5×5", "6×6", "8×8", "10×10"],
    imageUrl: "https://picsum.photos/id/1050/800/900",
  ),
  Embroidery(
    id: 6,
    title: "Cherry Blossom",
    description:
        "Japanese-inspired cherry blossom embroidery with soft colors.",
    price: 15.49,
    sizes: ["4×4", "5×7", "7×9"],
    imageUrl: "https://picsum.photos/id/1067/800/900",
  ),
  Embroidery(
    id: 7,
    title: "Cute Teddy Bear",
    description:
        "Adorable teddy bear embroidery for baby clothing and blankets.",
    price: 11.99,
    sizes: ["3×3", "4×4", "5×5"],
    imageUrl: "https://picsum.photos/id/1074/800/900",
  ),
  Embroidery(
    id: 8,
    title: "Lotus Flower",
    description:
        "Elegant lotus flower embroidery representing peace and purity.",
    price: 16.99,
    sizes: ["5×7", "6×10", "8×12"],
    imageUrl: "https://picsum.photos/id/1084/800/900",
  ),
  Embroidery(
    id: 9,
    title: "Christmas Wreath",
    description:
        "Festive embroidery perfect for Christmas decorations and gifts.",
    price: 13.99,
    sizes: ["4×4", "5×7", "6×6"],
    imageUrl: "https://picsum.photos/id/1080/800/900",
  ),
  Embroidery(
    id: 10,
    title: "Vintage Lace Border",
    description: "Classic lace border embroidery for tablecloths and garments.",
    price: 21.99,
    sizes: ["6×10", "8×12", "10×14"],
    imageUrl: "https://picsum.photos/id/1062/800/900",
  ),
];

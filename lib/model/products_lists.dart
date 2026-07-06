import 'package:flutter/material.dart';

class Shoe {
  final int id;
  final String title;
  final String description;
  final double price;
  final List<double> sizes;
  final List<Color> colors;
  final String imageUrl;

  Shoe({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.sizes,
    required this.colors,
    required this.imageUrl,
  });
}

final List<Shoe> shoeList = [
  Shoe(
    id: 1,
    title: "Nike Air Infuriate III",
    description:
        "The Nike Air Infuriate III pays homage to the women who are setting an example for the next generation by being forces of change in their.",
    price: 139.0,
    sizes: [6, 7.5, 8],
    colors: [Colors.blue, Colors.orange, Colors.red],
    imageUrl: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
  ),
  Shoe(
    id: 2,
    title: "Sepats Air Max",
    description:
        "Experience incredible comfort with the Sepats Air Max. Engineered for all-day performance and style.",
    price: 210.0,
    sizes: [7, 8, 9, 10],
    colors: [Colors.teal, Colors.black, Colors.grey],
    imageUrl: "https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
  ),
  Shoe(
    id: 3,
    title: "Nike Joyride Run",
    description:
        "A running shoe like no other. Tiny foam beads underfoot conform to your foot for cushioning that stands up to your mileage.",
    price: 180.0,
    sizes: [6.5, 7.5, 8.5, 9.5],
    colors: [Colors.white, Colors.pink, Colors.blueAccent],
    imageUrl: "https://images.unsplash.com/photo-1511556532299-8f662fc26c06?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
  ),
];

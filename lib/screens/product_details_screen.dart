import 'package:direct_deal/model/products_lists.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetails extends StatelessWidget {
  final Embroidery product;

  const ProductDetails({super.key, required this.product});

  Future<void> openWhatsApp(Embroidery product) async {
    final message = Uri.encodeComponent(
      "Hello, I would like to order:\n\n"
      "Design: ${product.title}\n"
      "Price: \$${product.price}\n"
      "Size: ${product.sizes.join(', ')}",
    );

    final url = Uri.parse("https://wa.me/9779709047193?text=$message");

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint("Could not launch WhatsApp");
    }
  }

  Future<void> openViber(Embroidery product) async {
    final message = Uri.encodeComponent(
      "Hello, I would like to order:\n\n"
      "Design: ${product.title}\n"
      "Price: \$${product.price}\n"
      "Size: ${product.sizes.join(', ')}",
    );

    final url = Uri.parse("viber://forward?text=$message");

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint("Could not launch Viber");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: product.id,
            child: Image.network(
              product.imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: .45,
            minChildSize: .45,
            maxChildSize: .90,

            builder: (context, controller) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),

                child: SingleChildScrollView(
                  controller: controller,

                  padding: const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Center(
                        child: Container(
                          height: 5,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "\$${product.price}",
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        product.description,
                        style: const TextStyle(fontSize: 17, height: 1.5),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        "Available Sizes",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Wrap(
                        spacing: 10,
                        runSpacing: 10,

                        children: product.sizes.map((size) {
                          return Chip(label: Text(size));
                        }).toList(),
                      ),

                      const SizedBox(height: 35),

                      SizedBox(
                        width: double.infinity,
                        height: 55,

                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () => openWhatsApp(product),
                                icon: const Icon(Icons.chat),
                                label: const Text("WhatsApp"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF25D366),
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size.fromHeight(55),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () => openViber(product),
                                icon: const Icon(Icons.call),
                                label: const Text("Viber"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF7360F2),
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size.fromHeight(55),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

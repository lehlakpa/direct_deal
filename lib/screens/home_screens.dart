import 'package:direct_deal/model/products_lists.dart';
import 'package:direct_deal/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Direct Deal"), centerTitle: true),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                const Text(
                  "Embrodiary Clothes",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const Spacer(),

                TextButton(onPressed: () {}, child: const Text("View All")),
              ],
            ),
          ),

          SizedBox(
            height: 280,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: embroideryList.length,

              itemBuilder: (context, index) {
                final embroidery = embroideryList[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetails(product: embroidery),
                      ),
                    );
                  },

                  child: Container(
                    width: 170,
                    margin: const EdgeInsets.only(left: 16),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Hero(
                          tag: embroidery.id,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(18),
                            ),

                            child: Image.network(
                              embroidery.imageUrl,
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                embroidery.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                "\$${embroidery.price}",
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                "${embroidery.sizes.length} Sizes Available",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
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
          ),
        ],
      ),
    );
  }
}

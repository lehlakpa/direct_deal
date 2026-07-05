import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> openLocation() async {
    final Uri url = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=Gokarna+Namgyal+Kathmandu+Nepal",
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch Google Maps');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Us"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.deepPurple,
                child: Icon(
                  Icons.design_services,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Direct Deal Embroidery",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "About Our Company",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Direct Deal Embroidery has been providing high-quality embroidery services since 2000/03/04. "
              "We specialize in creating beautiful embroidery designs for school uniforms, company logos, traditional clothing, dresses, jackets, caps, bags, and custom embroidery projects.\n\n"
              "Our experienced team is committed to delivering precise craftsmanship, premium materials, and excellent customer service. Whether you need a single custom design or bulk embroidery for businesses and organizations, we strive to produce work that meets your expectations.",
              style: TextStyle(fontSize: 16, height: 1.6),
            ),

            const SizedBox(height: 25),

            const Divider(),

            ListTile(
              leading: const Icon(
                Icons.calendar_today,
                color: Colors.deepPurple,
              ),
              title: const Text("Established"),
              subtitle: const Text("2000/03/04"),
            ),

            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.red),
              title: const Text("Location"),
              subtitle: const Text("Gokarna Namgyal, Kathmandu, Nepal"),
              trailing: const Icon(Icons.open_in_new),
              onTap: openLocation,
            ),

            ListTile(
              leading: const Icon(Icons.phone, color: Colors.green),
              title: const Text("Contact"),
              subtitle: const Text("+977 9709047193"),
            ),

            ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.orange),
              title: const Text("Our Services"),
              subtitle: const Text(
                "• School Uniform Embroidery\n"
                "• Company Logo Embroidery\n"
                "• Traditional Dress Embroidery\n"
                "• Caps & Hats\n"
                "• Jackets & Hoodies\n"
                "• Bags & Accessories\n"
                "• Name & Monogram Embroidery\n"
                "• Custom Embroidery Orders",
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Thank you for choosing Direct Deal Embroidery.\nWe look forward to serving you!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

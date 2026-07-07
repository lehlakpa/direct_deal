import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PEAK",
            style: GoogleFonts.leagueSpartan(
              fontSize: 42,
              fontWeight: FontWeight.w900,
              color: Colors.black,
              height: .9,
              letterSpacing: -.5,
            ),
          ),

          Text(
            "PREMIUM",
            style: GoogleFonts.leagueSpartan(
              fontSize: 42,
              fontWeight: FontWeight.w900,
              color: Colors.black,
              height: .9,
              letterSpacing: -.5,
            ),
          ),

          Text(
            "Shoes",
            style: GoogleFonts.leagueSpartan(
              fontSize: 42,
              fontWeight: FontWeight.w900,
              color: const Color(0xffFFC107),
              height: .9,
              letterSpacing: -.5,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Buy Now, Pay Later",
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 35),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured",
                style: GoogleFonts.inter(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Text(
            "Shoes",
            style: GoogleFonts.leagueSpartan(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              letterSpacing: -.5,
            ),
          ),
        ],
      ),
    );
  }
}

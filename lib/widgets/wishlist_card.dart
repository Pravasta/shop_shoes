import 'package:flutter/material.dart';
import '../theme.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(
        top: 12,
        left: 14,
        bottom: 16,
        right: 22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/image_shoes.png',
              width: 80,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terrex Urban Low',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '\$143,98',
                  style: priceTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: reguler,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/button_wishlist_blue.png',
            width: 44,
          ),
        ],
      ),
    );
  }
}

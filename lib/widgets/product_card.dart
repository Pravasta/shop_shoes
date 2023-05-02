import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../theme.dart';

import '../pages/product_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductPage(productModel: product),
          //membawa product model
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.8,
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Image.network(
              "${product.galleries![0].url}",
              width: MediaQuery.of(context).size.width / 1.8,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Text(
                    '${product.category!.name}',
                    style: secondaryTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.name!,
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 22,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '\$${product.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

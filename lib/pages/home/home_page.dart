import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_shoes/models/user_model.dart';
import 'package:shop_shoes/providers/auth_provider.dart';
import 'package:shop_shoes/providers/product_provider.dart';

import 'package:shop_shoes/theme.dart';
import 'package:shop_shoes/widgets/product_card.dart';

import '../../widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.read<AuthProvider>();

    UserModel? user = authProvider.user;

    // untuk ambil data dari backend
    ProductProvider productProvider = context.read<ProductProvider>();

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user!.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 26,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    '${user.profilePhotoUrl}',
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      Widget categori(
          String text, Color color, TextStyle style, Color borderColor) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 14,
          ),
          margin: const EdgeInsets.only(right: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
            border: Border.all(
              color: borderColor,
            ),
          ),
          child: Text(
            text,
            style: style,
          ),
        );
      }

      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin),
              categori(
                'All Shoes',
                primaryColor,
                primaryTextStyle.copyWith(fontSize: 15, fontWeight: medium),
                subtitleColor,
              ),
              categori(
                'Running',
                transparentColor,
                primaryTextStyle.copyWith(fontSize: 15, fontWeight: medium),
                subtitleColor,
              ),
              categori(
                'Training',
                transparentColor,
                primaryTextStyle.copyWith(fontSize: 15, fontWeight: medium),
                subtitleColor,
              ),
              categori(
                'Basketball',
                transparentColor,
                primaryTextStyle.copyWith(fontSize: 15, fontWeight: medium),
                subtitleColor,
              ),
              categori(
                'Hiking',
                transparentColor,
                primaryTextStyle.copyWith(fontSize: 15, fontWeight: medium),
                subtitleColor,
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      );
    }

    Widget popularProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Text(
          'Popular Products',
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin),
              Row(
                children: productProvider.products
                    .map(
                      (product) => ProductCard(
                        product: product,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Text(
          'New Arrivals',
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Column(
          children: productProvider.products
              .map(
                (product) => ProductsTile(
                  product: product,
                ),
              )
              .toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularProductsTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals(),
      ],
    );
  }
}

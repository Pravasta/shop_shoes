import 'package:flutter/material.dart';
import 'package:shop_shoes/widgets/checkout_card.dart';
import '../theme.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: const Text('Checkout Details'),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // List Items
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                ),
                // CHECKOUT CARD
                const CheckoutCard(),
                const CheckoutCard(),
                // ADDRESS DETAILS
                Container(
                  margin: EdgeInsets.only(top: defaultMargin),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: backgroundColor4,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address Details',
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/icon_store_location.png',
                                width: 50,
                              ),
                              Image.asset(
                                'assets/icon_line.png',
                                height: 40,
                              ),
                              Image.asset(
                                'assets/icon_your_address.png',
                                width: 50,
                              ),
                            ],
                          ),
                          const SizedBox(width: 14),
                          Column(
                            children: [
                              Text(
                                'Store Location',
                                style: secondaryTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: light,
                                ),
                              ),
                              Text(
                                'Adidas Core',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: medium,
                                ),
                              ),
                              SizedBox(height: defaultMargin),
                              Text(
                                'Your Address',
                                style: secondaryTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: light,
                                ),
                              ),
                              Text(
                                'Marsemoon',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // Payment Summary
                Container(
                  margin: EdgeInsets.only(top: defaultMargin),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: backgroundColor4,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Summary',
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Quantity',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '2 Items',
                            style: primaryTextStyle.copyWith(
                                fontSize: 18, fontWeight: medium),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Price',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '\$575,96',
                            style: primaryTextStyle.copyWith(
                                fontSize: 18, fontWeight: medium),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Free',
                            style: primaryTextStyle.copyWith(
                                fontSize: 18, fontWeight: medium),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      const Divider(
                        thickness: 1,
                        color: Color(0xff2e3141),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: priceTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            '\$575,96',
                            style: priceTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // CheckOut BUTTON
                SizedBox(height: defaultMargin),
                const Divider(
                  thickness: 1,
                  color: Color(0xff2e3141),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: defaultMargin),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context, '/checkout-succes', (route) => false),
                    child: Text(
                      'Checkout Now',
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}

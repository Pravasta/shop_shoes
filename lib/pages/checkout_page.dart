import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_shoes/providers/auth_provider.dart';
import 'package:shop_shoes/providers/cart_provider.dart';
import 'package:shop_shoes/providers/transaction_provider.dart';
import 'package:shop_shoes/widgets/checkout_card.dart';
import 'package:shop_shoes/widgets/loading_button.dart';
import '../theme.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = context.read<CartProvider>();
    TransactionProvider transactionProvider =
        context.read<TransactionProvider>();

    // Untuk dapatkan token
    AuthProvider authProvider = context.read<AuthProvider>();

    handleCheckOut() async {
      setState(() {
        isLoading = true;
      });

      if (await transactionProvider.checkout(
        authProvider.user!.token!,
        cartProvider.cart,
        cartProvider.totalPrice(),
      )) {
        cartProvider.cart = [];
        // Jika berhasil maka mengarahkan ke page succes
        if (!mounted) {
          return;
        }
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-succes', (route) => false);
      }

      setState(() {
        isLoading = false;
      });
    }

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
                Column(
                  children: cartProvider.cart
                      .map(
                        (cart) => CheckoutCard(
                          cartModel: cart,
                        ),
                      )
                      .toList(),
                ),
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
                            '${cartProvider.totalitems()} items',
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
                            NumberFormat.currency(
                                    decimalDigits: 0,
                                    locale: 'id',
                                    symbol: '\$')
                                .format(cartProvider.totalPrice()),
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
                            '30%',
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
                            NumberFormat.currency(
                                    decimalDigits: 0,
                                    locale: 'id',
                                    symbol: '\$')
                                .format(cartProvider.totalPrice() +
                                    (cartProvider.totalPrice() * 0.3)),
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
                isLoading
                    ? Container(
                        margin: EdgeInsets.only(bottom: defaultMargin),
                        child: const LoadingButton(),
                      )
                    : Container(
                        height: 70,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: defaultMargin),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: handleCheckOut,
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

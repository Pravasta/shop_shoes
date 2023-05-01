import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_shoes/pages/cart_page.dart';
import 'package:shop_shoes/pages/checkout_page.dart';
import 'package:shop_shoes/pages/checkout_success_page.dart';
import 'package:shop_shoes/pages/detail_chat_page.dart';
import 'package:shop_shoes/pages/edit_profile_page.dart';
import 'package:shop_shoes/pages/home/main_page.dart';
import 'package:shop_shoes/pages/sign_in_page.dart';
import 'package:shop_shoes/pages/sign_up_page.dart';
import 'package:shop_shoes/providers/auth_provider.dart';
import 'package:shop_shoes/providers/cart_provider.dart';
import 'package:shop_shoes/providers/product_provider.dart';
import 'package:shop_shoes/providers/transaction_provider.dart';
import 'package:shop_shoes/providers/wishlist_provider.dart';
import '../pages/splash_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishListProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const MainPage(),
          '/detail-chat': (context) => const DetailChatPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-succes': (context) => const CheckoutSuccessPage(),
        },
      ),
    );
  }
}

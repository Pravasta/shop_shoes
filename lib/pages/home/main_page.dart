import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/page_provider.dart';
import '../home/chat_page.dart';
import '../home/home_page.dart';
import '../home/profile_page.dart';
import '../home/wishlist_page.dart';
import '/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = context.watch<PageProvider>();

    Widget cartButton() {
      return FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () => Navigator.pushNamed(context, '/cart'),
        child: Image.asset(
          'assets/icon_cart.png',
          width: 22,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(
            30,
          ),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 14,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            currentIndex: pageProvider.currIndex,
            onTap: (value) {
              pageProvider.currIndex = value;
            },
            backgroundColor: backgroundColor4,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 22, bottom: 12),
                  child: Image.asset(
                    'assets/icon_home.png',
                    width: 23,
                    color: pageProvider.currIndex == 0
                        ? primaryColor
                        : const Color(0xFF808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 22, bottom: 12),
                  child: Image.asset(
                    'assets/icon_chat.png',
                    width: 22,
                    color: pageProvider.currIndex == 1
                        ? primaryColor
                        : const Color(0xFF808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 22, bottom: 12),
                  child: Image.asset(
                    'assets/icon_wishlist.png',
                    width: 22,
                    color: pageProvider.currIndex == 2
                        ? primaryColor
                        : const Color(0xFF808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 22, bottom: 12),
                  child: Image.asset(
                    'assets/icon_profile.png',
                    width: 20,
                    color: pageProvider.currIndex == 3
                        ? primaryColor
                        : const Color(0xFF808191),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ChatPage();
        case 2:
          return const WishListPage();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      /// membuat sesuai warna background color bottom navigation bar
      backgroundColor:
          pageProvider.currIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}

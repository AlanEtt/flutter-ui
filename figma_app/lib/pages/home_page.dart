import 'package:flutter/material.dart';
import 'package:figma_app/components/header.dart';
import 'package:figma_app/components/search.dart';
import 'package:figma_app/components/gopay.dart';
import 'package:figma_app/components/menus.dart';
import 'package:figma_app/components/goclub.dart';
import 'package:figma_app/components/akses.dart';
import 'package:figma_app/components/news.dart';
import 'package:figma_app/pages/promo_page.dart';
import 'package:figma_app/pages/pesanan_page.dart';
import 'package:figma_app/pages/chat_page.dart';
import 'package:figma_app/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [Search(), Gopay(), Menus(), GoCLub(), Akses(), News()],
      ),
    ),
    const PromoPage(),
    const PesananPage(),
    const ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: green2,
        elevation: 0,
        toolbarHeight: 71,
        title: _buildHeader(),
      ),
      body: _pages[_selectedIndex],
    );
  }

  Widget _buildHeader() {
    final List<String> titles = ['Beranda', 'Promo', 'Pesanan', 'Chat'];
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: green1,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: List.generate(titles.length, (index) {
          final bool isSelected = _selectedIndex == index;
          return Flexible(
            fit: FlexFit.loose,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      titles[index],
                      style: semibold14.copyWith(
                        color: isSelected ? green1 : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

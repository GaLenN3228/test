import 'package:chalenge/ui/block/block.dart';
import 'package:chalenge/ui/news/news_page.dart';
import 'package:chalenge/ui/themes/fond_and_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottm_appbar_animation.dart';

class Home extends StatefulWidget {

  final int cityId;
  final String cityName;

  const Home({Key key, this.cityId, this.cityName}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedBarIndex = 0;
  Widget currentPage;
  List<Widget> pages;
  List<BarItem> barItems = [
    BarItem(
      text: "",
    imageicon: Icons.home,
      color: Color(0xFF485366),
    ),
    BarItem(
      text: "",
      imageicon: Icons.pan_tool,
      color: Color(0xFF485366),
    ),
    BarItem(
      text: "",
      imageicon: Icons.credit_card,
      color: Color(0xFF485366),
    ),
    BarItem(
      text: "",
      imageicon: Icons.functions,
      color: Color(0xFF485366),
    ),
    BarItem(
      text: "",
      imageicon: Icons.person,
      color: Color(0xFF485366),
    ),
  ];

  @override
  void initState() {
    pages = [NewsPage(), Container(), Container(),Container(), Container(),];
    currentPage = pages[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: AnimatedBottomBar(
          barItems: barItems,
          animationDuration: const Duration(milliseconds: 150),
          barStyle: BarStyle(fontSize: 20.0, iconSize: 24.0),
          onBarTap: (index) {
            setState(() {
              selectedBarIndex = index;
              currentPage = pages[index];
            });
          }),
    );
  }
}


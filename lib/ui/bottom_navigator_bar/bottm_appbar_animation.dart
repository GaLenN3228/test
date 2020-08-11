import 'package:chalenge/ui/themes/fond_and_colors.dart';
import 'package:flutter/material.dart';

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final Function onBarTap;
  final BarStyle barStyle;

  AnimatedBottomBar(
      {this.barItems,
      this.animationDuration = const Duration(milliseconds: 300),
      this.onBarTap,
      this.barStyle});

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
          top: 10.0,
          left: 10.0,
          right: 10.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();
    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = selectedBarIndex == i;
      _barItems.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedBarIndex = i;
            widget.onBarTap(selectedBarIndex);
          });
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          duration: widget.animationDuration,
//          decoration: CustomBoxDecoration.renderBoxDecoration(context, isSelected),
          child: item.text != ''
              ? Stack(
                  alignment: Alignment(2.4, -1.8),
                  children: <Widget>[
                    Icon(
                      item.imageicon,
                      color: isSelected ? item.color : Colors.black54,
                      size: 24,
                    ),
                    AnimatedSize(
                      duration: widget.animationDuration,
                      curve: Curves.easeInOut,
                      vsync: this,
                      child: CircleAvatar(
                        child: new buttonText(
                          item: item,
                          isSelected: isSelected,
                          widget: widget,
                        ),
                        radius: 7,
                        backgroundColor: Thm.of(context).accentColor,
                      ),
                    )
                  ],
                )
              : Row(
                  children: <Widget>[
                    Icon(
                      item.imageicon,
                      color: isSelected ? item.color : Color(0xff9DA4B3),
                      size: 24,
                    ),
                  ],
                ),
        ),
      ));
    }
    return _barItems;
  }
}

class buttonText extends StatelessWidget {
  const buttonText({
    Key key,
    @required this.item,
    @required this.isSelected,
    @required this.widget,
  }) : super(key: key);

  final BarItem item;
  final bool isSelected;
  final AnimatedBottomBar widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      item.text,
      style: TextStyle(
          color: item.color,
          fontWeight: widget.barStyle.fontWeight,
          fontSize: 12),
    );
  }
}

class BarStyle {
  final double fontSize, iconSize;
  final FontWeight fontWeight;

  BarStyle(
      {this.fontSize = 20.0,
      this.iconSize = 24,
      this.fontWeight = FontWeight.w600});
}

class BarItem {
  String text;
  IconData imageicon;
  Color color;

  BarItem({this.text, this.imageicon, this.color});
}



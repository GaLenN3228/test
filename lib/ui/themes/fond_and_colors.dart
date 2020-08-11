import 'package:flutter/cupertino.dart';


class Thm extends InheritedWidget {
  final AppThemeData data;

  const Thm({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(child != null),
        assert(data != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(Thm oldWidget) => data != oldWidget.data;

  static AppThemeData of(BuildContext context) {
    // ignore: omit_local_variable_types
    final Thm theme = context.dependOnInheritedWidgetOfExactType();
    return theme?.data ?? AppThemeData.dark();
  }
}

class AppThemeData {
  final Color transparent;
  final Color backgroundColor;
  final Color pinkColor;
  final Color lightBackgroundColor;
  final Color secondaryColor;
  final Color secondaryLighterColor;
  final Color secondaryDarker50Color;
  final Color primaryColor;
  final Color accentColor;
  final Color blackColor;
  final Color acceptedColor;
  final Color draftColor;
  final Color orangeEdok;

  final TextStyle toolbarTitle;
  final TextStyle toolbarTitleNormal;
  final TextStyle author;
  final TextStyle contentBodyTitle;
  final TextStyle contentBodyTitleBold;
  final TextStyle contentBodyPrimary;
  final TextStyle contentBodySecondary;
  final TextStyle contentBodySecondaryLess;
  final TextStyle contentBodySecondaryOrange;
  final TextStyle contentBodyTitleSecondary;
  final TextStyle description;

  AppThemeData({
    @required this.acceptedColor,
    @required this.draftColor,
    @required this.orangeEdok,
    @required this.backgroundColor,
    @required this.pinkColor,
    @required this.blackColor,
    @required this.lightBackgroundColor,
    @required this.secondaryColor,
    @required this.secondaryLighterColor,
    @required this.secondaryDarker50Color,
    @required this.primaryColor,
    @required this.accentColor,
  })  : transparent = const Color(0x00000000),
        contentBodyTitle = _newFont.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 24.0,
          color: blackColor,
        ),
        contentBodyTitleBold = _newFont.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          color: blackColor,
        ),
        contentBodyPrimary = _newFont.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          color: blackColor,
        ),
        contentBodyTitleSecondary = _newFont.copyWith(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 18.0,
          color: blackColor,
        ),
        contentBodySecondary = _newFont.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 14.0,
          color: secondaryDarker50Color,
        ),
        contentBodySecondaryLess = _newFont.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 12.0,
          color: secondaryColor,
        ),
        author = _newFont.copyWith(
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.italic,
          fontSize: 14.0,
          color: secondaryColor,
        ),
        contentBodySecondaryOrange = _newFont.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          color: orangeEdok,
        ),
        description = _newFont.copyWith(
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          fontSize: 16.0,
          color: secondaryColor,
        ),
        toolbarTitleNormal = _newFont.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 16.0,
          color: blackColor,
        ),
        toolbarTitle = _newFont.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 21.0,
          color: accentColor,
        );

  factory AppThemeData.dark() => AppThemeData(
    backgroundColor: const Color(0xFF0e1418),
    lightBackgroundColor: const Color(0xFF1a2023),
    secondaryColor: const Color(0xFFb0b1b2),
    secondaryDarker50Color: const Color(0xFF626669),
    primaryColor: const Color(0xFFffffff),
    accentColor: const Color(0xFF485366),
    secondaryLighterColor: const Color(0xFF909293),
    pinkColor: const Color(0xFFE1306C),
    blackColor: const Color(0xFF000000),
    draftColor:const Color(0xFF1DA1F2),
    acceptedColor: const Color(0xFF1AAD19),
  );
  static const String _newFontFamily = 'SF Pro Display';
  static const TextStyle _newFont = TextStyle(
    fontFamily: _newFontFamily,
  );
}
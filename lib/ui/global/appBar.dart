import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int index;
  final double toolbarHeight;
  final double iconSize;
  final Color backgroundColor;
  final Color titleColor;
  final Color iconColor;
  final bool showBackButton;
  final Widget? rightIcon;

  CustomAppBar({
    Key? key,
    this.title = "",
    required this.index,
    this.toolbarHeight = 40.0,
    this.iconSize = 24.0,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.iconColor = Colors.black,
    this.showBackButton = true,
    this.rightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      elevation: 0,
      // centerTitle: true,
      backgroundColor: backgroundColor,
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.keyboard_arrow_left_outlined,
                  size: iconSize,
                  color: iconColor,
                ),
              ),
            )
          : null,
      title: Text(
        title.isEmpty ? "" : title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: titleColor,
          fontFamily: 'Manrope',
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: rightIcon != null
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: rightIcon,
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

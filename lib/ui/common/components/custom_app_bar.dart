import 'package:currency_converter/ui/style/app_themes.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actionWidget,
    this.popFunction,
    this.bgColor,
    this.canPop = true,
    this.hasDrawer = false,
    this.refreshWhenPop = false,
  });

  final String title;
  final Widget? actionWidget;
  final Function? popFunction;
  final Color? bgColor;
  final bool hasDrawer;
  final bool canPop;
  final bool refreshWhenPop;

  @override
  final Size preferredSize = const Size.fromHeight(56);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      backgroundColor: widget.bgColor ?? Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      actionsIconTheme: IconThemeData(color: Theme.of(context).customLabelColor),
      iconTheme: IconThemeData(color: Theme.of(context).customLabelColor),
      title: Text(
        widget.title,
        style: TextStyle(
            height: 1.4, fontSize: 16, fontWeight: FontWeight.w600, color: Theme.of(context).customLabelColor),
      ),
      leading: widget.hasDrawer
          ? IconButton(
              icon: Icon(Icons.menu, size: 18, color: Theme.of(context).customLabelColor),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : widget.canPop ? IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 18, color: Theme.of(context).customLabelColor),
              onPressed: () {
                widget.popFunction != null
                    ? widget.popFunction!()
                    : Navigator.pop(context, widget.refreshWhenPop ? 'refresh' : null);
              },
            ) :SizedBox(),
      actions: [widget.actionWidget ?? const SizedBox()],
    );
  }
}

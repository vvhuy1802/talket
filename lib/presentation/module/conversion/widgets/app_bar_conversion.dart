import 'package:flutter/material.dart';

class AppBarConversion extends StatefulWidget implements PreferredSizeWidget {
  const AppBarConversion({super.key, this.leading, this.title, this.trailing});

  final Widget? leading;
  final Widget? title;
  final Widget? trailing;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AppBarConversion> createState() => _AppBarConversionState();
}

class _AppBarConversionState extends State<AppBarConversion> {
  final GlobalKey _leftKey = GlobalKey();
  final GlobalKey _rightKey = GlobalKey();

  double _leftWidth = 0;
  double _rightWidth = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureWidgets());
  }

  void _measureWidgets() {
    final leftContext = _leftKey.currentContext;
    final rightContext = _rightKey.currentContext;

    if (leftContext != null && rightContext != null) {
      final leftBox = leftContext.findRenderObject() as RenderBox;
      final rightBox = rightContext.findRenderObject() as RenderBox;

      setState(() {
        _leftWidth = leftBox.size.width;
        _rightWidth = rightBox.size.width;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(mainAxisSize: MainAxisSize.min, spacing: 4, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Material(
                  key: _leftKey,
                  child: widget.leading
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      (_leftWidth > _rightWidth ? _leftWidth : _rightWidth) +
                          10,
                ),
                child: widget.title
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  key: _rightKey,
                  child: widget.trailing
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          color: Colors.grey,
        )
      ]),
    );
  }
}

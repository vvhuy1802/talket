import 'package:flutter/material.dart';

class AppBarChat extends StatelessWidget implements PreferredSizeWidget {
  const AppBarChat(
      {super.key,
      required this.title,
      this.onLeftPressed,
      this.onRightPressed});

  final String title;
  final Function? onLeftPressed;
  final Function? onRightPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {
              if (onLeftPressed != null) {
                onLeftPressed!();
              }
            },
            child: Text("Edit")),
        Text(title),
        IconButton(
            onPressed: () {
              if (onRightPressed != null) {
                onRightPressed!();
              }
            },
            icon: const Icon(Icons.history)),
      ],
    );
  }
}

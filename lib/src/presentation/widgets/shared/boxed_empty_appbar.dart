import 'package:flutter/material.dart';

class BoxedEmptyAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const BoxedEmptyAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => const Size(0.0, 0.0);
}

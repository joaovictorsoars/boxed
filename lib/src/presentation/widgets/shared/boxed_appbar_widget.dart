import 'package:boxed/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoxedAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const BoxedAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      backgroundColor: BoxedColors.white,
      title: SvgPicture.asset(
        'assets/images/logo.svg',
        height: 40,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

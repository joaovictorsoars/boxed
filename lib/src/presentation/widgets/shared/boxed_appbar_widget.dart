import 'package:boxed/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BoxedAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBack;
  final bool centerTitle;

  const BoxedAppBarWidget({
    Key? key,
    this.centerTitle = false,
    this.hasBack = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      backgroundColor: BoxedColors.white,
      centerTitle: centerTitle,
      title: SvgPicture.asset(
        'assets/images/logo.svg',
        height: 40,
      ),
      iconTheme: const IconThemeData(color: BoxedColors.black),
      leading: hasBack
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(PhosphorIcons.regular.caretLeft),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:boxed/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ShipmentCardItem extends StatefulWidget {
  const ShipmentCardItem({super.key});

  @override
  State<ShipmentCardItem> createState() => _ShipmentCardItemState();
}

class _ShipmentCardItemState extends State<ShipmentCardItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(15),
      splashColor: BoxedColors.grayLight,
      child: Ink(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: BoxedColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: BoxedColors.black.withOpacity(0.02),
              blurRadius: 6,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: BoxedColors.black.withOpacity(0.08),
              blurRadius: 4,
              offset: const Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 6),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: BoxedColors.greenDark,
                  ),
                  child: Icon(
                    PhosphorIcons.regular.check,
                    color: BoxedColors.green,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Doces',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Entregue em: 24 de setembro',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: BoxedColors.black,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 60,
                height: 20,
                decoration: BoxDecoration(
                  color: BoxedColors.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

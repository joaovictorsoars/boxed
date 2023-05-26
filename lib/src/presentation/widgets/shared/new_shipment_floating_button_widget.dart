import 'package:boxed/src/core/constants/colors.dart';
import 'package:boxed/src/presentation/widgets/shared/add_shipment_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NewShipmentFloatingButtonWidget extends StatelessWidget {
  const NewShipmentFloatingButtonWidget({super.key});

  Widget addNewShipmentForm(BuildContext context) {
    var paddingBottom = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Wrap(
        children: [
          Align(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: 5,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: BoxedColors.grayLight,
              ),
            ),
          ),
          const Text(
            'Nova remessa',
            style: TextStyle(
              color: BoxedColors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Adicione uma nova remessa para rastreio.',
            style: TextStyle(
              color: BoxedColors.gray,
              fontSize: 16,
            ),
          ),
          const Divider(
            height: 20,
            thickness: 0,
            color: BoxedColors.white,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: paddingBottom),
            child: const AddShipmentFormWidget(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            barrierColor: BoxedColors.gray.withOpacity(0.8),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            backgroundColor: BoxedColors.white,
            isScrollControlled: true,
            builder: (context) => addNewShipmentForm(context));
      },
      backgroundColor: BoxedColors.primary,
      child: Icon(
        PhosphorIcons.regular.plus,
        color: BoxedColors.black,
      ),
    );
  }
}

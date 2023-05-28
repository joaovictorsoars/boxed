import 'package:boxed/src/core/constants/colors.dart';
import 'package:boxed/src/core/constants/companies.dart';
import 'package:boxed/src/core/instances.dart';
import 'package:boxed/src/logic/cubits/correios/shipment_correios_cubit.dart';
import 'package:boxed/src/logic/cubits/correios/shipment_correios_state.dart';
import 'package:boxed/src/logic/cubits/shipment/listing/listing_shipment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AddShipmentFormWidget extends StatefulWidget {
  const AddShipmentFormWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AddShipmentFormState();
}

class _AddShipmentFormState extends State<AddShipmentFormWidget> {
  final nickNameController = TextEditingController();
  final trackCodeController = TextEditingController();
  final List<String> companies = ['Correios'];
  final _formKey = GlobalKey<FormState>();
  late final ShipmentCorreiosCubit addShipmentCorreiosCubit =
      context.read<ShipmentCorreiosCubit>();

  var actualCompany = '';

  void onShipmentListen(BuildContext context, ShipmentCorreiosState state) {
    if (state is AddedShipmentCorreiosState) {
      Navigator.pop(context);

      var shipmentCubit = Instances.it.get<ListingShipmentCubit>();
      shipmentCubit.listShipments();
    }
  }

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (actualCompany == Companies.correios) {
        var nickname = nickNameController.text;
        var trackingCode = trackCodeController.text.trim().toUpperCase();

        await addShipmentCorreiosCubit.addShipment(
            nickname, trackingCode, actualCompany);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              text: 'Empresa ',
              style: TextStyle(
                color: BoxedColors.gray,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: BoxedColors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 8,
            color: BoxedColors.white,
          ),
          DropdownButtonFormField(
            hint: const Text(
              'Selecione uma empresa de entrega',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            borderRadius: BorderRadius.circular(15),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: BoxedColors.grayLight,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: BoxedColors.redDark,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: BoxedColors.redDark,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: BoxedColors.red,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: Icon(
                PhosphorIcons.regular.buildings,
                color: BoxedColors.gray,
              ),
            ),
            icon: Icon(
              PhosphorIcons.regular.caretDown,
              color: BoxedColors.gray,
            ),
            items: companies
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                .toList(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo é obrigatório!';
              }

              return null;
            },
            onChanged: (value) {
              setState(() {
                actualCompany = value!;
              });
            },
          ),
          const Divider(
            height: 12,
            color: BoxedColors.white,
          ),
          RichText(
            text: const TextSpan(
              text: 'Código de rastreio ',
              style: TextStyle(
                color: BoxedColors.gray,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: BoxedColors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 8,
            color: BoxedColors.white,
          ),
          TextFormField(
            controller: trackCodeController,
            textCapitalization: TextCapitalization.characters,
            cursorColor: BoxedColors.gray,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Digite o código de rastreio',
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: BoxedColors.gray,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: BoxedColors.grayLight,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: BoxedColors.redDark,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: BoxedColors.red,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusColor: BoxedColors.gray,
              prefixIcon: Icon(PhosphorIcons.regular.barcode),
              prefixIconColor: BoxedColors.gray,
            ),
            validator: (value) {
              final regExp = RegExp(r'[a-zA-Z]{2}[0-9]{9}[a-zA-Z]{2}');

              if (value == null || value.isEmpty) {
                return 'Este campo é obrigatório!';
              }

              if (!regExp.hasMatch(value)) {
                return 'O código inserido é inválido!';
              }

              return null;
            },
          ),
          const Divider(
            height: 12,
            color: BoxedColors.white,
          ),
          RichText(
            text: const TextSpan(
              text: 'Apelido da remessa ',
              style: TextStyle(
                color: BoxedColors.gray,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: BoxedColors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 8,
            color: BoxedColors.white,
          ),
          TextFormField(
            controller: nickNameController,
            cursorColor: BoxedColors.gray,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Digite o apelido da remessa',
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: BoxedColors.gray,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: BoxedColors.grayLight,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: BoxedColors.redDark,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: BoxedColors.red,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusColor: BoxedColors.gray,
              prefixIcon: Icon(PhosphorIcons.regular.pencil),
              prefixIconColor: BoxedColors.gray,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo é obrigatório!';
              }

              if (value.length < 5) {
                return 'O apelido deve ter ao menos 5 caracteres!';
              }

              return null;
            },
          ),
          const Divider(
            height: 12,
            color: BoxedColors.white,
          ),
          BlocConsumer<ShipmentCorreiosCubit, ShipmentCorreiosState>(
            listener: onShipmentListen,
            builder: (context, state) => InkWell(
              onTap: actualCompany.isNotEmpty ? submitForm : null,
              borderRadius: BorderRadius.circular(15),
              splashColor: BoxedColors.grayLight,
              child: Ink(
                height: 60,
                decoration: BoxDecoration(
                  color: actualCompany.isNotEmpty
                      ? BoxedColors.primary
                      : BoxedColors.grayLight,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Adicionar remessa',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

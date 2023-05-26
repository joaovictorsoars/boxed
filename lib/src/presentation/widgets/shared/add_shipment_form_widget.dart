import 'package:boxed/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AddShipmentFormWidget extends StatefulWidget {
  const AddShipmentFormWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AddShipmentFormState();
}

class _AddShipmentFormState extends State<AddShipmentFormWidget> {
  final List<String> companies = ['Correios', 'TNT Express', 'Sequoia'];
  final _formKey = GlobalKey<FormState>();

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
            items: companies
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                .toList(),
            onChanged: (value) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo é obrigatório!';
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
              if (value == null || value.isEmpty) {
                return 'Este campo é obrigatório!';
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
          InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).pop();
              }
            },
            borderRadius: BorderRadius.circular(15),
            splashColor: BoxedColors.grayLight,
            child: Ink(
              height: 60,
              decoration: BoxDecoration(
                color: BoxedColors.primary,
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
        ],
      ),
    );
  }
}

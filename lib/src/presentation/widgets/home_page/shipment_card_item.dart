import 'package:boxed/src/core/constants/colors.dart';
import 'package:boxed/src/core/routes.dart';
import 'package:boxed/src/data/models/shipment/shipment.dart';
import 'package:boxed/src/logic/cubits/shipment/listing/listing_shipment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shimmer/shimmer.dart';

class ShipmentCardItem extends StatefulWidget {
  final Shipment? shipment;
  final ListingShipmentCubit listingShipmentCubit;

  const ShipmentCardItem(
      {super.key, this.shipment, required this.listingShipmentCubit});

  @override
  State<ShipmentCardItem> createState() => _ShipmentCardItemState();
}

class _ShipmentCardItemState extends State<ShipmentCardItem> {
  Widget getCompanyLogo() {
    if (widget.shipment!.company == 'Correios') {
      return SizedBox(
        height: 20,
        width: 80,
        child: SvgPicture.asset('assets/images/companies/correios.svg'),
      );
    }

    return SizedBox(
      height: 20,
      width: 80,
      child: SvgPicture.asset('assets/images/companies/correios.svg'),
    );
  }

  Color getStatusColor() {
    var status = widget.shipment!.lastEvent;

    if (status == 'PAR') {
      return Colors.green.shade900;
    }

    if (status == 'PO') {
      return BoxedColors.grayLight;
    }

    if (status == 'RO') {
      return BoxedColors.blueDark;
    }

    if (status == 'BDE') {
      return BoxedColors.greenDark;
    }

    if (status == 'OEC') {
      return Colors.orange;
    }

    return BoxedColors.blueDark;
  }

  Icon getStatusIcon() {
    var status = widget.shipment!.lastEvent;

    if (status == 'PAR') {
      return Icon(
        PhosphorIcons.regular.magnifyingGlass,
        color: Colors.green.shade200,
      );
    }

    if (status == 'PO') {
      return Icon(
        PhosphorIcons.regular.signpost,
        color: BoxedColors.gray,
      );
    }

    if (status == 'RO') {
      return Icon(
        PhosphorIcons.regular.van,
        color: BoxedColors.blue,
      );
    }

    if (status == 'BDE') {
      return Icon(
        PhosphorIcons.regular.check,
        color: BoxedColors.green,
      );
    }

    if (status == 'OEC') {
      return Icon(
        PhosphorIcons.regular.backpack,
        color: Colors.black,
      );
    }

    return Icon(
      PhosphorIcons.regular.check,
      color: BoxedColors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.shipment == null
        ? Ink(
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
                    Shimmer.fromColors(
                      baseColor: BoxedColors.grayLight,
                      highlightColor: BoxedColors.grayShimmer,
                      child: Container(
                        margin: const EdgeInsets.only(right: 6),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: BoxedColors.primary,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      height: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 3),
                            child: Shimmer.fromColors(
                              baseColor: BoxedColors.grayLight,
                              highlightColor:
                                  BoxedColors.grayShimmer.withOpacity(0.4),
                              child: Container(
                                width: 80,
                                height: 16,
                                color: BoxedColors.primary,
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: BoxedColors.grayLight,
                            highlightColor:
                                BoxedColors.grayShimmer.withOpacity(0.4),
                            child: Container(
                              width: 140,
                              height: 14,
                              color: BoxedColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Shimmer.fromColors(
                    baseColor: BoxedColors.grayLight,
                    highlightColor: BoxedColors.grayShimmer,
                    child: Container(
                      width: 80,
                      height: 20,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: BoxedColors.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.shipmentDetails,
                  arguments: {'shipment': widget.shipment});
            },
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
                            color: getStatusColor(),
                          ),
                          child: getStatusIcon()),
                      SizedBox(
                        width: 250,
                        height: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 3),
                              child: Text(
                                widget.shipment!.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              widget.shipment!.lastEventDescription,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: BoxedColors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: BoxedColors.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: getCompanyLogo(),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

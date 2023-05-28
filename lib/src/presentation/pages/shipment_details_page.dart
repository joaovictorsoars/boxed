import 'package:boxed/src/core/constants/colors.dart';
import 'package:boxed/src/data/models/shipment/shipment.dart';
import 'package:boxed/src/logic/cubits/shipment/get_events/get_shipment_events_cubit.dart';
import 'package:boxed/src/logic/cubits/shipment/get_events/get_shipment_events_state.dart';
import 'package:boxed/src/logic/cubits/shipment/listing/listing_shipment_cubit.dart';
import 'package:boxed/src/presentation/widgets/shared/boxed_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shimmer/shimmer.dart';

class ShipmentDetailsPage extends StatefulWidget {
  final Shipment shipment;

  const ShipmentDetailsPage({
    super.key,
    required this.shipment,
  });

  @override
  State<ShipmentDetailsPage> createState() => _ShipmentDetailsPageState();
}

class _ShipmentDetailsPageState extends State<ShipmentDetailsPage> {
  late final GetShipmentEventsCubit shipmentEventsCubit = context.read();
  late final ListingShipmentCubit listingShipmentCubit = context.read();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      shipmentEventsCubit.getShipmentEvents(widget.shipment.code);
    });

    super.initState();
  }

  Color getStatusColor(String status, {first = false}) {
    if (status == 'PAR') {
      return first ? Colors.green.shade900 : BoxedColors.grayLight;
    }

    if (status == 'PO') {
      return BoxedColors.grayLight;
    }

    if (status == 'RO') {
      return first ? BoxedColors.blueDark : BoxedColors.grayLight;
    }

    if (status == 'BDE') {
      return first ? BoxedColors.greenDark : BoxedColors.grayLight;
    }

    if (status == 'OEC') {
      return first ? Colors.orange : BoxedColors.grayLight;
    }

    return first ? BoxedColors.blueDark : BoxedColors.grayLight;
  }

  Icon getStatusIcon(String status, {bool first = false}) {
    if (status == 'PAR') {
      return Icon(
        PhosphorIcons.regular.magnifyingGlass,
        color: first ? Colors.green.shade200 : BoxedColors.gray,
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
        color: first ? BoxedColors.blue : BoxedColors.gray,
      );
    }

    if (status == 'BDE') {
      return Icon(
        PhosphorIcons.regular.check,
        color: first ? BoxedColors.green : BoxedColors.gray,
      );
    }

    if (status == 'OEC') {
      return Icon(
        PhosphorIcons.regular.backpack,
        color: first ? Colors.black : BoxedColors.gray,
      );
    }

    return Icon(
      PhosphorIcons.regular.check,
      color: first ? BoxedColors.green : BoxedColors.gray,
    );
  }

  void onShipmentEventsListen(
      BuildContext context, GetShipmentEventsState state) {
    if (state is ErasedShipmentState) {
      Navigator.pop(context, true);
      listingShipmentCubit.listShipments();
    }
  }

  Future<void> refreshScreen() async {
    shipmentEventsCubit.getShipmentEvents(widget.shipment.code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BoxedColors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: const Text(
                  'Excluir remessa',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                content: const Text('Deseja mesmo excluir essa remessa?'),
                actions: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      shipmentEventsCubit.deleteShipment(widget.shipment.code);
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: BoxedColors.redDark,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Sim',
                        style: TextStyle(color: BoxedColors.red),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Não',
                        style: TextStyle(color: BoxedColors.gray),
                      ))
                ],
              );
            },
          );
        },
        backgroundColor: BoxedColors.redDark,
        label: const Text(
          'Excluir remessa',
          style: TextStyle(
            color: BoxedColors.red,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: Icon(
          PhosphorIcons.regular.trash,
          color: BoxedColors.red,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshScreen,
        child: BlocConsumer<GetShipmentEventsCubit, GetShipmentEventsState>(
          listener: onShipmentEventsListen,
          builder: (context, state) => CustomScrollView(
            slivers: [
              const BoxedAppBarWidget(
                centerTitle: true,
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 30),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${widget.shipment.name} ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: BoxedColors.black,
                              fontSize: 28,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: BoxedColors.primary,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: SizedBox(
                              height: 20,
                              width: 80,
                              child: SvgPicture.asset(
                                  'assets/images/companies/correios.svg'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Código de rastreio: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: BoxedColors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            widget.shipment.code,
                            style: const TextStyle(
                              color: BoxedColors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              state is GettedShipmentEventsState
                  ? SliverPadding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 80),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: state.shipmentEvent.length,
                          (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: getStatusColor(
                                          state.shipmentEvent[index].codigo,
                                          first: index == 0),
                                    ),
                                    child: getStatusIcon(
                                        state.shipmentEvent[index].codigo,
                                        first: index == 0),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    margin: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      state.shipmentEvent[index].descricao,
                                      style: TextStyle(
                                        fontSize: index == 0 ? 16 : 14,
                                        fontWeight: index == 0
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (index < state.shipmentEvent.length - 1)
                                Container(
                                  width: 60,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: double.infinity,
                                    width: 4,
                                    decoration: BoxDecoration(
                                      color: index == 0
                                          ? BoxedColors.greenDark
                                          : BoxedColors.grayLight,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SliverPadding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 80),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 4,
                          (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: BoxedColors.grayLight,
                                    highlightColor: BoxedColors.grayShimmer
                                        .withOpacity(0.4),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: BoxedColors.primary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    margin: const EdgeInsets.only(left: 8),
                                    child: Shimmer.fromColors(
                                      baseColor: BoxedColors.grayLight,
                                      highlightColor: BoxedColors.grayShimmer
                                          .withOpacity(0.4),
                                      child: Container(
                                        height: index == 0 ? 16 : 14,
                                        color: BoxedColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (index < 3)
                                Container(
                                  width: 60,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: double.infinity,
                                    width: 4,
                                    decoration: const BoxDecoration(
                                      color: BoxedColors.grayLight,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

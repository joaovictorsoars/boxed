import 'package:boxed/src/core/constants/colors.dart';
import 'package:boxed/src/logic/cubits/shipment/listing/listing_shipment_cubit.dart';
import 'package:boxed/src/logic/cubits/shipment/listing/listing_shipment_state.dart';
import 'package:boxed/src/presentation/widgets/home_page/shipment_card_item.dart';
import 'package:boxed/src/presentation/widgets/shared/boxed_appbar_widget.dart';
import 'package:boxed/src/presentation/widgets/shared/new_shipment_floating_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  late final ListingShipmentCubit shipmentCubit = context.read();

  bool pausedApp = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      shipmentCubit.listShipments();
    });
  }

  Future<void> refreshScreen() async {
    shipmentCubit.listShipments();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      pausedApp = true;
    }
    if (state == AppLifecycleState.resumed && pausedApp) {
      refreshScreen();
      pausedApp = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const NewShipmentFloatingButtonWidget(),
      body: RefreshIndicator(
        onRefresh: refreshScreen,
        child: BlocBuilder<ListingShipmentCubit, ListingShipmentState>(
          builder: (context, state) => CustomScrollView(
            slivers: [
              const BoxedAppBarWidget(hasBack: false),
              SliverPadding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const Text(
                      'Remessas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: BoxedColors.black,
                        fontSize: 28,
                      ),
                    ),
                  ]),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                sliver: state is ListedShipmentsState &&
                        state.shipments.isNotEmpty
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: state.shipments.length,
                          (context, index) => Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: ShipmentCardItem(
                                shipment: state.shipments[index],
                                listingShipmentCubit: shipmentCubit,
                              )),
                        ),
                      )
                    : state is ListingShipmentsState
                        ? SliverList(
                            delegate: SliverChildBuilderDelegate(
                              childCount: 4,
                              (context, index) => Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: ShipmentCardItem(
                                    listingShipmentCubit: shipmentCubit,
                                  )),
                            ),
                          )
                        : SliverToBoxAdapter(
                            child: SizedBox(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset('assets/lottie/empty_box.json'),
                                  const Text(
                                    'Nenhuma remessa cadastrada!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )
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

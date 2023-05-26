import 'package:boxed/src/core/constants/colors.dart';
import 'package:boxed/src/presentation/widgets/home_page/shipment_card_item.dart';
import 'package:boxed/src/presentation/widgets/shared/boxed_appbar_widget.dart';
import 'package:boxed/src/presentation/widgets/shared/new_shipment_floating_button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> refreshScreen() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const NewShipmentFloatingButtonWidget(),
      body: RefreshIndicator(
        onRefresh: refreshScreen,
        child: CustomScrollView(
          slivers: [
            const BoxedAppBarWidget(),
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
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 8,
                  (context, index) => Container(
                    margin: EdgeInsets.only(bottom: index < 7 ? 10 : 40),
                    child: const ShipmentCardItem(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:boxed/src/data/models/shipment/shipment.dart';
import 'package:boxed/src/data/repositories/correios/correios_repository.dart';
import 'package:boxed/src/data/repositories/local_shipment/local_shipment_repository.dart';
import 'package:boxed/src/logic/cubits/shipment/shipment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShipmentCubit extends Cubit<ShipmentState> {
  final LocalShipmentRepository localShipmentRepository;
  final CorreiosRepository correiosRepository;

  ShipmentCubit(
      {required this.localShipmentRepository, required this.correiosRepository})
      : super(InitialShipmentState());

  Future<void> listShipments() async {
    try {
      emit(ListingShipmentsState());

      var shipments = await localShipmentRepository.getShipments();
      await getShipmentsLastEvent();

      emit(ListedShipmentsState(shipments));
    } catch (e) {
      print(e);
      emit(const ErrorListingShipmentsState(
          'Ocorreu um erro desconhecido enquanto listavamos suas remessas!'));
    }
  }

  Future<void> getShipmentsLastEvent() async {
    var localShipments = await localShipmentRepository.getShipments();
    var newShipments = <Shipment>[];

    for (var shipment in localShipments) {
      var tracked = await correiosRepository.track(shipment.code);
      var lastEvent = tracked.objetos[0].eventos[0];

      newShipments.add(Shipment(
          name: shipment.name,
          code: shipment.code,
          company: shipment.company,
          lastEvent: lastEvent.codigo,
          lastEventDescription: lastEvent.descricao));
    }

    await localShipmentRepository.setShipments(newShipments);
  }
}

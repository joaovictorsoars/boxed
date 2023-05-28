import 'package:boxed/src/data/repositories/correios/correios_repository.dart';
import 'package:boxed/src/data/repositories/local_shipment/local_shipment_repository.dart';
import 'package:boxed/src/logic/cubits/shipment/get_events/get_shipment_events_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetShipmentEventsCubit extends Cubit<GetShipmentEventsState> {
  final LocalShipmentRepository localShipmentRepository;
  final CorreiosRepository correiosRepository;

  GetShipmentEventsCubit(
      {required this.localShipmentRepository, required this.correiosRepository})
      : super(InitialGetShipmentEventsState());

  Future<void> getShipmentEvents(String trackingCode) async {
    try {
      emit(GettingShipmentEventsState());

      var tracked = await correiosRepository.track(trackingCode);
      var events = tracked.objetos[0].eventos;

      emit(GettedShipmentEventsState(events));
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteShipment(String trackingCode) async {
    try {
      emit(ErasingShipmentState());
      var shipments = await localShipmentRepository.getShipments();
      shipments.removeWhere((shipment) => shipment.code == trackingCode);

      await localShipmentRepository.setShipments(shipments);
      emit(ErasedShipmentState());
    } catch (e) {
      print(e);
    }
  }
}

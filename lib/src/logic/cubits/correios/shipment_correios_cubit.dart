import 'package:boxed/src/data/models/shipment/shipment.dart';
import 'package:boxed/src/data/repositories/correios/correios_repository.dart';
import 'package:boxed/src/data/repositories/local_shipment/local_shipment_repository.dart';
import 'package:boxed/src/logic/cubits/correios/shipment_correios_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ShipmentCorreiosCubit extends Cubit<ShipmentCorreiosState> {
  final FlutterSecureStorage storage;
  final LocalShipmentRepository localShipmentRepository;
  final CorreiosRepository correiosRepository;

  ShipmentCorreiosCubit({
    required this.storage,
    required this.localShipmentRepository,
    required this.correiosRepository,
  }) : super(InitialCorreiosState());

  Future<void> addShipment(
      String nickname, String trackingCode, String company) async {
    try {
      emit(AddingShipmentCorreiosState());

      var tracked = await correiosRepository.track(trackingCode);
      var lastEvent = tracked.objetos[0].eventos[0];
      await localShipmentRepository.addShipment(Shipment(
          name: nickname,
          code: trackingCode,
          company: company,
          lastEvent: lastEvent.codigo,
          lastEventDescription: lastEvent.descricao));

      emit(AddedShipmentCorreiosState(trackingCode));
    } catch (e) {
      print(e);

      String? message;
      int? code;

      if (e is DioError) {
        message = e.response!.statusMessage;
        code = e.response?.statusCode;
      } else {
        message = 'Objeto não existe!';
        code = 400;
      }

      emit(AddShipmentErrorState(message, code));
    }
  }
}

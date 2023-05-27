import 'package:boxed/src/core/constants/env_variables.dart';
import 'package:boxed/src/core/constants/storage_keys.dart';
import 'package:boxed/src/data/models/dto/correios/correios_request_token_dto.dart';
import 'package:boxed/src/data/repositories/correios/token_correios_repository.dart';
import 'package:boxed/src/logic/cubits/correios/token_correios_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenCorreiosCubit extends Cubit<TokenCorreiosState> {
  final FlutterSecureStorage storage;
  final TokenCorreiosRepository tokenCorreiosRepository;

  TokenCorreiosCubit({
    required this.storage,
    required this.tokenCorreiosRepository,
  }) : super(InitialTokenCorreiosState());

  Future<void> saveToken() async {
    try {
      var response = await tokenCorreiosRepository.token(
          const CorreiosRequestTokenDTO(
              requestToken: EnvVariables.correiosRequestToken));

      await storage.write(
          key: StorageKeys.correiosToken, value: response.token);
    } catch (e) {
      print(e);
    }
  }

  Future<String?> get token async {
    return await storage.read(key: StorageKeys.correiosToken);
  }
}

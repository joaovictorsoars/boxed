import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CubitWithClearState<State> extends Cubit<State> {
  CubitWithClearState(super.initialState);

  clearState();
}

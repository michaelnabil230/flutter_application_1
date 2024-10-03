import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<State> extends Cubit<State> {
  /// {@macro cubit}
  BaseCubit(super.initialState);

  @override
  void emit(State state) {
    if (isClosed) {
      String blocName = toString().split('Instance of').last.split("'")[1];

      return log('The [$blocName] is closed and cannot emit new states');
    }

    super.emit(state);
  }
}

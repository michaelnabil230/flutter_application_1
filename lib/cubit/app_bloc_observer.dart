import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    String name = bloc.toStr();

    if (!name.isUnknown) {
      log(event.toString(), name: name, level: 2);
    }

    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    String name = bloc.toStr();

    if (!name.isUnknown) {
      log(change.toString(), name: name, level: 2);
    }

    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    String name = bloc.toStr();

    if (!name.isUnknown) {
      log(bloc.toString(), name: name, level: 2);
    }

    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    String name = bloc.toStr();
    if (!name.isUnknown) {
      log(
        'Bloc Error',
        name: name,
        level: 4,
        error: error,
        stackTrace: stackTrace,
      );
    }

    super.onError(bloc, error, stackTrace);
  }
}

extension on BlocBase {
  String toStr() {
    final array = toString().split('Instance of').last.split("'");

    return array.length > 1 ? array[1] : 'Unknown';
  }
}

extension on String {
  bool get isUnknown => this == 'Unknown';
}

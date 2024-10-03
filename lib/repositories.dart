import 'package:flutter_application_1/network/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositories/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

class RepositoryProviders extends StatefulWidget {
  final Widget child;

  const RepositoryProviders({
    super.key,
    required this.child,
  });

  @override
  State<RepositoryProviders> createState() => _RepositoryProvidersState();
}

class _RepositoryProvidersState extends State<RepositoryProviders> {
  late final Http _http;

  @override
  void initState() {
    _http = Http();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _RepositoryProviders(
      providers: [
        RepositoryProvider.value(value: Weather(http: _http)),
        RepositoryProvider.value(value: _http),
      ],
      child: widget.child,
    );
  }
}

class _RepositoryProviders extends Nested {
  _RepositoryProviders({
    required List<SingleChildWidget> providers,
    required Widget child,
    TransitionBuilder? builder,
  }) : super(
          children: providers,
          child: builder != null
              ? Builder(builder: (context) => builder(context, child))
              : child,
        );
}

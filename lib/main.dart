import 'package:flutter/material.dart';
import 'package:flutter_application_1/application_initialize.dart';
import 'package:flutter_application_1/cubit/weather/weather_cubit.dart';
import 'package:flutter_application_1/foreground_controller.dart';
import 'package:flutter_application_1/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await ApplicationInitialize.init();
  runApp(const RepositoryProviders(
    child: MaterialApp(
      title: 'Test foreground service application',
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(repository: context.read()),
      child: const _View(),
    );
  }
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  @override
  void initState() {
    context.read<WeatherCubit>().invoke();
    ForegroundController.getInstance().initialize();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Placeholder(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practice_bloc2/pages/pagecontrol.dart';
import './bloc/export.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => MovieBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Pagecontrol(),
        theme: ThemeData.dark(),
      ),
    );
  }
}

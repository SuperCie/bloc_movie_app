import 'package:flutter/material.dart';
import 'package:practice_bloc2/app.dart';
import 'package:practice_bloc2/bloc/export.dart';
import 'package:practice_bloc2/bloc/observer.dart';

void main() {
  Bloc.observer = AppObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MovieBloc(), lazy: false),
        BlocProvider(create: (context) => FavoriteBloc()),
      ],
      child: App(),
    ),
  );
}

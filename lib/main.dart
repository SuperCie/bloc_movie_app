import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc2/app.dart';
import 'package:practice_bloc2/bloc/observer.dart';

void main() {
  Bloc.observer = AppObserver();
  runApp(App());
}

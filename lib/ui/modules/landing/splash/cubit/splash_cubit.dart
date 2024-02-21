import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

abstract class SplashStates {}

class InitialState extends SplashStates {}

class ChangeTimerStatus extends SplashStates {}

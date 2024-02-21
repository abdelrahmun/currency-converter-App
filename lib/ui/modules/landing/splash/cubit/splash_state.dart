part of 'splash_cubit.dart';

class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(InitialState());

  bool isTimerFinished = false;

  void changeTimerStatus({required bool isTimerFinished}) {
    this.isTimerFinished = isTimerFinished;
    emit(ChangeTimerStatus());
  }
}

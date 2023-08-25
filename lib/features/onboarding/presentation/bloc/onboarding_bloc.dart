import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task_manager/features/onboarding/presentation/bloc/onboarding_state.dart';

class OnboardingBloc extends Cubit<OnboardingState> {
  OnboardingBloc() : super(OnboardingState()) {
    initialized();
  }

  void initialized() async {
    await Future.delayed(const Duration(seconds: 3));
    log('init instance');
    emit(state.copyWith(isFinished: true));
  }
}

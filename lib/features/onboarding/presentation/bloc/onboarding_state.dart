import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default(false) bool isFinished,
    String? errorText,
    String? successText,
  }) = _OnboardingState;
}

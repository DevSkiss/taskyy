import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task_manager/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:my_task_manager/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:my_task_manager/generated/assets.gen.dart';
import 'package:my_task_manager/routes/app_router.gr.dart';
import 'package:my_task_manager/shared/shared.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
      if (state.isFinished) {
        context.router.replace(const HomeRouter());
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: ColumnPadding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                Assets.icons.icon.path,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              const DefaultText(
                'Taskyy',
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: AppColors.whiteColor,
              ),
              const SizedBox(height: 12),
              const DefaultText(
                'Tasks that you need to do. Everyday.',
                fontSize: 20,
                textAlign: TextAlign.center,
                maxLines: 5,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      );
    });
  }
}

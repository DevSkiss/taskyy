import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task_manager/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState()) {
    initialized();
  }

  void initialized() async {}
}

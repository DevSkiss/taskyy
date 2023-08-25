import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task_manager/core/dependency_injection.dart';
import 'package:my_task_manager/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_task_manager/features/home/presentation/bloc/home_state.dart';
import 'package:my_task_manager/features/home/presentation/widgets/list_task_widget.dart';
import 'package:my_task_manager/features/task_detail/presentation/screens/task_detail.dart';
import 'package:my_task_manager/generated/assets.gen.dart';
import 'package:my_task_manager/shared/shared.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HomeBloc>(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: SafeArea(
              child: ColumnPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(
                  top: Platform.isIOS ? 0 : 16,
                ),
                children: [
                  Row(
                    children: [
                      Image.asset(
                        Assets.icons.iconOutline.path,
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 11.38),
                      const DefaultText(
                        'Taskyy',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.bodyColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: DefaultTabController(
                        length: 2,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: TabBar(
                                    controller: tabController,
                                    indicatorColor: Colors.black,
                                    tabs: const [
                                      DefaultText(
                                        'INCOMPLETE',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.bodyColor,
                                      ),
                                      DefaultText(
                                        'COMPLETED',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.bodyColor,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                                child: TabBarView(
                              controller: tabController,
                              children: const [
                                ListTaskWidget(),
                                ListTaskWidget(completed: true),
                              ],
                            ))
                          ],
                        )),
                  ),
                ],
              ),
            ),
            floatingActionButton: OpenContainer(
              openElevation: 0,
              closedElevation: 0,
              openColor: Colors.transparent,
              closedColor: Colors.transparent,
              tappable: true,
              closedBuilder: (context, action) => Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: AppColors.bodyColor, shape: BoxShape.circle),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                    size: 32,
                  ),
                ),
              ),
              openBuilder: (context, action) => const TaskDetail(),
            ),
          );
        });
  }
}

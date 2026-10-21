import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/dashboard_bottom_nav.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/quick_actions.dart';
import '../widgets/overview_grid.dart';
import '../widgets/departments_grid.dart';
import '../widgets/todays_tasks_list.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      bottomNavigationBar: const DashboardBottomNav(),
      body: SafeArea(
        child: Column(
          children: [
            const DashboardHeader(),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                  const OverviewSection(),
                  const SizedBox(height: 16),
                  const QuickActionsSection(),
                  const SizedBox(height: 16),
                  const DepartmentsSection(),
                  const SizedBox(height: 16),
                  const TodaysTasksSection(),
                  const SizedBox(height: 16),
                ]),
              ),
            ),
          ],
        ),
      ),
      ],
      ),
    ),
    );
  }
}

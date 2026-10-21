import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../dashboard/presentation/widgets/dashboard_header.dart';
import '../../../dashboard/presentation/widgets/dashboard_bottom_nav.dart';
import '../widgets/tasks_segmented_tabs.dart';
import '../widgets/tasks_metric_banner.dart';
import '../widgets/task_list_card.dart';
import '../../../patients/presentation/widgets/patient_search_bar.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      bottomNavigationBar: const DashboardBottomNav(currentIndex: 2), // 2 is Tasks
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
                  const PatientSearchBar(hintText: 'Search tasks...'),
                  const SizedBox(height: 16),
                  const TasksSegmentedTabs(),
                  const SizedBox(height: 16),
                  const TasksMetricBanner(),
                  const SizedBox(height: 20),
                  const TaskListCard(
                    category: 'Patient Intake',
                    categoryBg: Color(0xFFDBE1FF),
                    categoryColor: Color(0xFF00174B),
                    status: 'Pending',
                    statusBg: Color(0xFFFFDBCC),
                    statusColor: Color(0xFF351000),
                    title: 'Bella',
                    subtitle: 'Cage B-04',
                    description: 'SAWO-CASE-2026-00417',
                    assigneeInitials: 'SS',
                    assigneeName: 'S. Shinde',
                    assigneeRole: 'Caretaker',
                    assigneeBg: Color(0xFFFFDCC6),
                    assigneeColor: Color(0xFF301400),
                    time: '10:30 AM',
                    icon: Icons.schedule,
                    iconColor: AppColors.primary,
                  ),
                  const SizedBox(height: 12),
                  const TaskListCard(
                    category: 'Medicine Schedule',
                    categoryBg: Color(0xFFFFDBCC),
                    categoryColor: Color(0xFF351000),
                    status: 'In Progress',
                    statusBg: Color(0xFFDBE1FF),
                    statusColor: Color(0xFF00174B),
                    title: 'Bella',
                    subtitle: 'Cage B-04',
                    description: 'Anti-inflammatory Oral Suspension',
                    assigneeInitials: 'SS',
                    assigneeName: 'S. Shinde',
                    assigneeRole: 'Caretaker',
                    assigneeBg: Color(0xFFFFDCC6),
                    assigneeColor: Color(0xFF301400),
                    time: '08:00 AM',
                    icon: Icons.schedule,
                    iconColor: AppColors.textMuted,
                  ),
                  const SizedBox(height: 12),
                  const TaskListCard(
                    category: 'Cage Cleaning',
                    categoryBg: Color(0xFFE5E2DD),
                    categoryColor: AppColors.textMuted,
                    status: 'Pending',
                    statusBg: Color(0xFFFFDBCC),
                    statusColor: Color(0xFF351000),
                    title: 'Cage B-04 Sanitation',
                    subtitle: '',
                    description: 'Full Enclosure Disinfection & Fresh Bedding',
                    assigneeInitials: 'RP',
                    assigneeName: 'R. Patil',
                    assigneeRole: 'Housekeeper',
                    assigneeBg: Color(0xFFFFDBCC),
                    assigneeColor: Color(0xFF351000),
                    time: '11:00 AM',
                    icon: Icons.schedule,
                    iconColor: AppColors.primary,
                  ),
                  const SizedBox(height: 12),
                  const TaskListCard(
                    category: 'Doctor Rounds',
                    categoryBg: Color(0xFFFFDCC6),
                    categoryColor: Color(0xFF301400),
                    status: 'Completed',
                    statusBg: Color(0xFFE5E2DD),
                    statusColor: AppColors.textMuted,
                    title: 'Sector B Review',
                    subtitle: 'Kennels 01-10',
                    description: 'Post-operative Observation Verification',
                    assigneeInitials: 'DG',
                    assigneeName: 'Dr. Gandhi',
                    assigneeRole: 'Doctor',
                    assigneeBg: Color(0xFFDBE1FF),
                    assigneeColor: Color(0xFF00174B),
                    time: '09:15 AM',
                    icon: Icons.task_alt,
                    iconColor: AppColors.textMuted,
                  ),
                  const SizedBox(height: 24),
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

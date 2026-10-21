import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../cages/presentation/pages/cages_page.dart';
import '../../../patients/presentation/pages/patients_page.dart';
import '../../../tasks/presentation/pages/tasks_page.dart';

class DepartmentsSection extends StatelessWidget {
  const DepartmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NGO Departments',
                  style: AppTextStyles.headline,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFDDF3EE),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'All Wings',
                style: AppTextStyles.captionPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.6,
          children: [
            _DeptCard(
              title: 'Patients & Rescues',
              icon: Icons.pets,
              iconBg: const Color(0xFFE8EDFC),
              iconColor: const Color(0xFF9333EA),
              badgeText: '28 Live',
              badgeBg: const Color(0xFFF3E8FF),
              badgeColor: const Color(0xFF9333EA),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PatientsPage()),
              ),
            ),
            _DeptCard(
              title: 'Task Manage',
              icon: Icons.assignment_outlined,
              iconBg: const Color(0xFFFEE2D5),
              iconColor: Colors.redAccent,
              badgeText: '5 Urgent',
              badgeBg: const Color(0xFFFFF1F2),
              badgeColor: Colors.redAccent,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TasksPage()),
              ),
            ),
            const _DeptCard(
              title: 'Surgery Wing',
              icon: Icons.monitor_heart_outlined,
              iconBg: Color(0xFFFED7AA),
              iconColor: Color(0xFFC2410C),
              badgeText: '4 Left',
              badgeBg: Color(0xFFFFEDD5),
              badgeColor: Color(0xFFC2410C),
            ),
            _DeptCard(
              title: 'Cage & Boarding',
              icon: Icons.home_outlined,
              iconBg: const Color(0xFFD1FAE5),
              iconColor: const Color(0xFF059669),
              badgeText: '80% Cap',
              badgeBg: const Color(0xFFECFDF5),
              badgeColor: const Color(0xFF059669),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CagesPage()),
              ),
            ),
            const _DeptCard(
              title: 'Inventory & Med',
              icon: Icons.medication_outlined,
              iconBg: Color(0xFFE2EEFF),
              iconColor: Color(0xFF1C73E8),
              badgeText: '3 Low',
              badgeBg: Color(0xFFFFF1F2),
              badgeColor: Colors.redAccent,
            ),
            const _DeptCard(
              title: 'Donations & Fund',
              icon: Icons.payments_outlined,
              iconBg: Color(0xFFEDE9FE),
              iconColor: Color(0xFF7C3AED),
              badgeText: '+\$14.2k',
              badgeBg: Color(0xFFECFDF5),
              badgeColor: Color(0xFF059669),
            ),
          ],
        ),
      ],
    );
  }
}

class _DeptCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String badgeText;
  final Color badgeBg;
  final Color badgeColor;
  final VoidCallback? onTap;

  const _DeptCard({
    required this.title,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.badgeText,
    required this.badgeBg,
    required this.badgeColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border.withOpacity(0.6)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 17),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badgeText,
                  style: AppTextStyles.badge.copyWith(color: badgeColor),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: AppTextStyles.bodySemiBold,
          ),
        ],
      ),
    ),
  );
}
}

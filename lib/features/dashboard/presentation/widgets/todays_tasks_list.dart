import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class TodaysTasksSection extends StatelessWidget {
  const TodaysTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Today's Tasks", style: AppTextStyles.sectionHeader),
            Row(
              children: [
                const Text('View All', style: AppTextStyles.captionPrimary),
                const SizedBox(width: 2),
                const Icon(Icons.arrow_forward, size: 12, color: AppColors.primary),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Column(
          children: [
            _TaskTile(
              title: 'Patient Intake',
              subtitle: 'New patient registration',
              icon: Icons.pets,
              iconBg: Color(0xFFEAF2FF),
              iconColor: Color(0xFF1975E6),
              status: 'Pending',
              statusBg: Color(0xFFFFF2E0),
              statusColor: Color(0xFFD87009),
            ),
            SizedBox(height: 8),
            _TaskTile(
              title: 'Medicine Schedule',
              subtitle: "Check today's medicine tasks",
              icon: Icons.medication,
              iconBg: Color(0xFFE2F7F2),
              iconColor: Color(0xFF169680),
              status: 'In Progress',
              statusBg: Color(0xFFEAF3FF),
              statusColor: Color(0xFF1E77E7),
            ),
            SizedBox(height: 8),
            _TaskTile(
              title: 'Cage Cleaning',
              subtitle: 'Ward B - Cage B-04',
              icon: Icons.cleaning_services,
              iconBg: Color(0xFFFFEFE3),
              iconColor: Color(0xFFCF6517),
              status: 'Pending',
              statusBg: Color(0xFFFFF2E0),
              statusColor: Color(0xFFD87009),
            ),
          ],
        ),
      ],
    );
  }
}

class _TaskTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String status;
  final Color statusBg;
  final Color statusColor;

  const _TaskTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.status,
    required this.statusBg,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: iconColor, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title, 
                        style: AppTextStyles.bodySemiBold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 1),
                      Text(
                        subtitle, 
                        style: AppTextStyles.caption,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: statusBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: AppTextStyles.badge.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right, color: AppColors.textMuted, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}


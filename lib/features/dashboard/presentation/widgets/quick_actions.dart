import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class QuickActionsSection extends StatefulWidget {
  const QuickActionsSection({super.key});

  @override
  State<QuickActionsSection> createState() => _QuickActionsSectionState();
}

class _QuickActionsSectionState extends State<QuickActionsSection> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Quick Actions', style: AppTextStyles.sectionHeader),
            Text(
              'FAST LANE',
              style: AppTextStyles.overline,
            ),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              _ActionPill(
                icon: Icons.add_circle_outline,
                label: 'Intake Rescue',
                isSelected: _selectedIndex == 0,
                unselectedIconColor: AppColors.primary,
                onTap: () => setState(() => _selectedIndex = 0),
              ),
              const SizedBox(width: 8),
              _ActionPill(
                icon: Icons.wifi_tethering,
                label: 'Scan Patient RFID',
                isSelected: _selectedIndex == 1,
                unselectedIconColor: const Color(0xFF7C3AED),
                onTap: () => setState(() => _selectedIndex = 1),
              ),
              const SizedBox(width: 8),
              _ActionPill(
                icon: Icons.badge_outlined,
                label: 'Log Shift',
                isSelected: _selectedIndex == 2,
                unselectedIconColor: const Color(0xFFC2410C),
                onTap: () => setState(() => _selectedIndex = 2),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Color unselectedIconColor;
  final VoidCallback onTap;

  const _ActionPill({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.unselectedIconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : const Color(0xFFEAF0FF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF86EFAC) : unselectedIconColor,
              size: 16,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyles.button.copyWith(
                fontSize: 12,
                color: isSelected ? Colors.white : AppColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


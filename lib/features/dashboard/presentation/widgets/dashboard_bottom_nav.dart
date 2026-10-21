import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../pages/dashboard_page.dart';
import '../../../patients/presentation/pages/patients_page.dart';
import '../../../tasks/presentation/pages/tasks_page.dart';
import '../../../employees/presentation/pages/employees_page.dart';
import '../../../departments/presentation/pages/departments_page.dart';
import '../../../cages/presentation/pages/cages_page.dart';

class DashboardBottomNav extends StatelessWidget {
  final int currentIndex;
  const DashboardBottomNav({super.key, this.currentIndex = 0});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const DashboardPage(),
          transitionDuration: Duration.zero,
        ),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const PatientsPage(),
          transitionDuration: Duration.zero,
        ),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const TasksPage(),
          transitionDuration: Duration.zero,
        ),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const EmployeesPage(),
          transitionDuration: Duration.zero,
        ),
      );
    } else if (index == 4) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const DepartmentsPage(),
          transitionDuration: Duration.zero,
        ),
      );
      } else if (index == 5) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const CagesPage(),
          transitionDuration: Duration.zero,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        border: const Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            _NavItem(
              icon: Icons.grid_view_rounded,
              label: 'Overview',
              isActive: currentIndex == 0,
              onTap: () => _onItemTapped(context, 0),
            ),
            _NavItem(
              icon: Icons.show_chart_rounded,
              label: 'Patients',
              isActive: currentIndex == 1,
              onTap: () => _onItemTapped(context, 1),
            ),
            _NavItem(
              icon: Icons.check_circle_outline,
              label: 'Tasks',
              isActive: currentIndex == 2,
              onTap: () => _onItemTapped(context, 2),
            ),
            _NavItem(
              icon: Icons.badge_outlined,
              label: 'Employees',
              isActive: currentIndex == 3,
              onTap: () => _onItemTapped(context, 3),
            ),
            _NavItem(
              icon: Icons.domain_outlined,
              label: 'Depts',
              isActive: currentIndex == 4,
              onTap: () => _onItemTapped(context, 4),
            ),
            _NavItem(
              icon: Icons.widgets_outlined,
              label: 'Cages',
              isActive: currentIndex == 5,
              onTap: () => _onItemTapped(context, 5),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.primary : AppColors.textMuted;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 3),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

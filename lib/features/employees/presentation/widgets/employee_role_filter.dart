import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class EmployeeRoleFilter extends StatefulWidget {
  const EmployeeRoleFilter({super.key});

  @override
  State<EmployeeRoleFilter> createState() => _EmployeeRoleFilterState();
}

class _EmployeeRoleFilterState extends State<EmployeeRoleFilter> {
  int _selectedIndex = 0;
  
  final List<String> _roles = [
    'All Roles (32)',
    'Doctors (4)',
    'Caretakers (12)',
    'Cooks (3)',
    'Housekeeping (5)',
    'Ambulance (4)',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: _roles.asMap().entries.map((entry) {
          final int idx = entry.key;
          final String role = entry.value;
          final bool isSelected = idx == _selectedIndex;
          
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: GestureDetector(
              onTap: () => setState(() => _selectedIndex = idx),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : const Color(0xFFF6F3EE),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  role,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                    color: isSelected ? Colors.white : AppColors.textMuted,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

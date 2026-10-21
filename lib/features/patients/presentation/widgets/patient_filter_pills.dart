import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class PatientFilterPills extends StatelessWidget {
  const PatientFilterPills({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _FilterPill(label: 'All', isActive: true, dotColor: Colors.white),
          SizedBox(width: 8.w),
          const _FilterPill(label: 'Assessment', dotColor: Color(0xFFD96B27)),
          SizedBox(width: 8.w),
          const _FilterPill(label: 'Treatment', dotColor: Color(0xFF2563EB)),
          SizedBox(width: 8.w),
          const _FilterPill(label: 'Surgery', dotColor: Color(0xFFE11D48)),
          SizedBox(width: 8.w),
          const _FilterPill(label: 'Recovery', dotColor: Color(0xFF059669)),
          SizedBox(width: 8.w),
          const _FilterPill(label: 'Closed', dotColor: AppColors.textMuted),
        ],
      ),
    );
  }
}

class _FilterPill extends StatelessWidget {
  final String label;
  final bool isActive;
  final Color dotColor;

  const _FilterPill({
    required this.label,
    this.isActive = false,
    required this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: isActive ? null : Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isActive) ...[
            Container(
              width: 6.w,
              height: 6.w,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 6.w),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.white : AppColors.textDark,
            ),
          ),
          if (isActive) ...[
            SizedBox(width: 6.w),
            Container(
              width: 6.w,
              height: 6.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

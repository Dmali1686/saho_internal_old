import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_text_styles.dart';

class PatientStatsRow extends StatelessWidget {
  const PatientStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatMicroCard(
            label: 'Total In',
            value: '248',
            subtext: '+4 today',
            icon: Icons.folder_shared_outlined,
            backgroundColor: const Color(0xFFE8EDFC),
            blobColor: const Color(0xFFD9E3F8),
            textColor: const Color(0xFF1E293B),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _StatMicroCard(
            label: 'Active',
            value: '213',
            subtext: '86% cap',
            icon: Icons.healing_outlined,
            backgroundColor: const Color(0xFFFEE2D5),
            blobColor: const Color(0xFFFCDB0D),
            textColor: const Color(0xFF991B1B),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _StatMicroCard(
            label: 'Discharged',
            value: '35',
            subtext: 'This week',
            icon: Icons.task_alt,
            backgroundColor: const Color(0xFF6EE7B7),
            blobColor: const Color(0xFF34D399),
            textColor: const Color(0xFF064E3B),
          ),
        ),
      ],
    );
  }
}

class _StatMicroCard extends StatelessWidget {
  final String label;
  final String value;
  final String subtext;
  final IconData icon;
  final Color backgroundColor;
  final Color blobColor;
  final Color textColor;

  const _StatMicroCard({
    required this.label,
    required this.value,
    required this.subtext,
    required this.icon,
    required this.backgroundColor,
    required this.blobColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Stack(
          children: [
            // Decorative background blob
            Positioned(
              right: -10.w,
              bottom: -10.h,
              child: Container(
                width: 60.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: blobColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
            ),
            // Card Content
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                          color: textColor,
                        ),
                      ),
                      Container(
                        width: 20.w,
                        height: 20.w,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(icon, size: 12.sp, color: textColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: textColor.withOpacity(0.8),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      subtext,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
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

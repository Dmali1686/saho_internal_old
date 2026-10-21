import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeSummaryRow extends StatelessWidget {
  const EmployeeSummaryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _SummaryCard(
              title: 'Total Staff',
              value: '32',
              icon: Icons.group,
              subtitle: '8 depts',
              backgroundColor: const Color(0xFFE8EDFC),
              blobColor: const Color(0xFFD9E3F8),
              textColor: const Color(0xFF1E293B),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: _SummaryCard(
              title: 'On Duty',
              value: '28',
              icon: Icons.check_circle_outline,
              subtitle: '87.5% cover',
              backgroundColor: const Color(0xFF6EE7B7),
              blobColor: const Color(0xFF34D399),
              textColor: const Color(0xFF064E3B),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: _SummaryCard(
              title: 'Pending',
              value: '126',
              icon: Icons.assignment_late,
              subtitle: 'Assigned',
              backgroundColor: const Color(0xFFFEE2D5),
              blobColor: const Color(0xFFFCDB0D),
              textColor: const Color(0xFF991B1B),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String subtitle;
  final Color backgroundColor;
  final Color blobColor;
  final Color textColor;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.subtitle,
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
                      title,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: textColor.withOpacity(0.8),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      subtitle,
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

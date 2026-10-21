import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../pages/medical_department_page.dart';
import '../../../diet/presentation/pages/diet_kitchen_page.dart';
import '../../../housekeeping/presentation/pages/housekeeping_page.dart';
import '../../../ambulance/presentation/pages/ambulance_page.dart';
import '../../../donors/presentation/pages/donors_page.dart';
import '../../../finance/presentation/pages/finance_page.dart';
import '../../../reports/presentation/pages/reports_page.dart';

class DepartmentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String staffCount;
  final IconData staffIcon;
  final String statusText;
  final Color statusColor;
  final Color statusBgColor;

  const DepartmentCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.staffCount,
    required this.staffIcon,
    required this.statusText,
    required this.statusColor,
    required this.statusBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: () {
            if (title.toLowerCase() == 'medical') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MedicalDepartmentPage(departmentId: 'medical'),
                ),
              );
            } else if (title.toLowerCase() == 'diet & kitchen') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DietKitchenPage(),
                ),
              );
            } else if (title.toLowerCase() == 'housekeeping') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HousekeepingPage(),
                ),
              );
            } else if (title.toLowerCase() == 'rescue & transit') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AmbulancePage(),
                ),
              );
            } else if (title.toLowerCase() == 'donors & reporters') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DonorsPage(),
                ),
              );
            } else if (title.toLowerCase() == 'finance') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FinancePage(),
                ),
              );
            } else if (title.toLowerCase() == 'reports') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReportsPage(),
                ),
              );
            }
          },
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 32.w,
                          height: 32.w,
                          decoration: BoxDecoration(
                            color: iconBgColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Icon(icon, color: iconColor, size: 16.sp),
                        ),
                        Icon(Icons.arrow_forward, color: AppColors.border, size: 16.sp),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textMuted,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(staffIcon, size: 12.sp, color: AppColors.textMuted),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            staffCount,
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textMuted,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: statusBgColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        statusText,
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: statusColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

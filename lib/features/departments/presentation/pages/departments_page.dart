import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../dashboard/presentation/widgets/dashboard_header.dart';
import '../../../dashboard/presentation/widgets/dashboard_bottom_nav.dart';
import '../../../patients/presentation/widgets/patient_search_bar.dart';
import '../widgets/department_card.dart';

class DepartmentsPage extends StatelessWidget {
  const DepartmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      bottomNavigationBar: const DashboardBottomNav(currentIndex: 4), // 4 is Depts
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
                  Text(
                    'Departments',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Operational Wings & Staff Allocation',
                        style: TextStyle(
                          fontSize: 10.4.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textMuted,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0EDE9),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 6.w,
                              height: 6.w,
                              decoration: const BoxDecoration(
                                color: Color(0xFF2261E9),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              '32 Staff Active',
                              style: TextStyle(
                                fontSize: 9.6.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  const PatientSearchBar(hintText: 'Filter wings, staff, or duties...'),
                  SizedBox(height: 16.h),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 24),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.05,
                ),
                delegate: SliverChildListDelegate([
                  const DepartmentCard(
                    title: 'Medical',
                    subtitle: 'Diagnosis & OPD Care',
                    icon: Icons.medical_services_outlined,
                    iconBgColor: Color(0xFFDBE1FF),
                    iconColor: Color(0xFF0049C2),
                    staffCount: '8 Staff (4 Docs, 4 Care)',
                    staffIcon: Icons.group,
                    statusText: '14 Live Tasks',
                    statusBgColor: Color(0xFFDBE1FF),
                    statusColor: Color(0xFF00174B),
                  ),
                  const DepartmentCard(
                    title: 'Diet & Kitchen',
                    subtitle: 'Meal Plans & Feeding',
                    icon: Icons.restaurant_outlined,
                    iconBgColor: Color(0xFFFFDBCC),
                    iconColor: Color(0xFF904C27),
                    staffCount: '6 Staff (Cooks & Feed)',
                    staffIcon: Icons.soup_kitchen_outlined,
                    statusText: '8 Meal Batches',
                    statusBgColor: Color(0xFFFFDBCC),
                    statusColor: Color(0xFF351000),
                  ),
                  const DepartmentCard(
                    title: 'Finance',
                    subtitle: 'Sanctuary Treasury',
                    icon: Icons.account_balance_wallet_outlined,
                    iconBgColor: Color(0xFFDDF3EE),
                    iconColor: AppColors.primary,
                    staffCount: '3 Accountants',
                    staffIcon: Icons.calculate_outlined,
                    statusText: 'Buffer Active',
                    statusBgColor: Color(0xFFDDF3EE),
                    statusColor: AppColors.primary,
                  ),
                  const DepartmentCard(
                    title: 'Housekeeping',
                    subtitle: 'Cleaning & Sanitation',
                    icon: Icons.cleaning_services_outlined,
                    iconBgColor: Color(0xFFEBE8E3),
                    iconColor: AppColors.primary,
                    staffCount: '10 Staff (Sanitation)',
                    staffIcon: Icons.cleaning_services,
                    statusText: '12 Cleanings',
                    statusBgColor: Color(0xFFEBE8E3),
                    statusColor: AppColors.textDark,
                  ),
                  const DepartmentCard(
                    title: 'Rescue & Transit',
                    subtitle: 'Transport & Emergency',
                    icon: Icons.airport_shuttle_outlined,
                    iconBgColor: Color(0xFFFFDAD6),
                    iconColor: Color(0xFF93000A),
                    staffCount: '8 Staff (Crew & Drivers)',
                    staffIcon: Icons.local_shipping_outlined,
                    statusText: '4 Active Calls',
                    statusBgColor: Color(0xFFFFDAD6),
                    statusColor: Color(0xFF93000A),
                  ),
                  const DepartmentCard(
                    title: 'Kennel & Cages',
                    subtitle: 'Shelter Boarding & Isolation',
                    icon: Icons.grid_view_outlined,
                    iconBgColor: Color(0xFFDBE1FF),
                    iconColor: Color(0xFF0049C2),
                    staffCount: '7 Ward Keepers',
                    staffIcon: Icons.pets,
                    statusText: '48 Occupied',
                    statusBgColor: Color(0xFFDBE1FF),
                    statusColor: Color(0xFF00174B),
                  ),
                  const DepartmentCard(
                    title: 'Reports',
                    subtitle: 'Operational Metrics',
                    icon: Icons.analytics_outlined,
                    iconBgColor: Color(0xFFDBE1FF),
                    iconColor: Color(0xFF0049C2),
                    staffCount: 'Live Sync',
                    staffIcon: Icons.sync,
                    statusText: '5 Logs',
                    statusBgColor: Color(0xFFDBE1FF),
                    statusColor: Color(0xFF00174B),
                  ),
                  const DepartmentCard(
                    title: 'Adoptions',
                    subtitle: 'Fostering & Outreach',
                    icon: Icons.volunteer_activism_outlined,
                    iconBgColor: Color(0xFFEBE8E3),
                    iconColor: AppColors.primary,
                    staffCount: '4 Coordinators',
                    staffIcon: Icons.handshake_outlined,
                    statusText: '9 Open Inquiries',
                    statusBgColor: Color(0xFFEBE8E3),
                    statusColor: AppColors.textDark,
                  ),
                  const DepartmentCard(
                    title: 'Donors & Reporters',
                    subtitle: 'Sanctuary Registry',
                    icon: Icons.contact_page_outlined,
                    iconBgColor: Color(0xFFFFDCC6),
                    iconColor: Color(0xFF80440F),
                    staffCount: '2 Admins',
                    staffIcon: Icons.admin_panel_settings_outlined,
                    statusText: '142 Active',
                    statusBgColor: Color(0xFFFFDCC6),
                    statusColor: Color(0xFF301400),
                  ),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../dashboard/presentation/widgets/dashboard_header.dart';
import '../../../dashboard/presentation/widgets/dashboard_bottom_nav.dart';
import '../../../patients/presentation/widgets/patient_search_bar.dart';
import '../widgets/employee_summary_row.dart';
import '../widgets/employee_role_filter.dart';
import '../widgets/employee_list_card.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      bottomNavigationBar: const DashboardBottomNav(currentIndex: 3), // 3 is Employees
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
                  Row(
                    children: [
                      const Expanded(
                        child: PatientSearchBar(hintText: 'Search staff or ID...'),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.person_add, color: Colors.white, size: 16.sp),
                            SizedBox(width: 6.w),
                            Text(
                              'Add Staff',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  const EmployeeSummaryRow(),
                  const SizedBox(height: 16),
                  const EmployeeRoleFilter(),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'SANCTUARY PERSONNEL',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textMuted,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        'Sort: Activity',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const EmployeeListCard(
                    name: 'S. Shinde',
                    id: '#EMP-084',
                    role: 'Caretaker',
                    department: 'Ward B (Primates)',
                    status: 'Active',
                    statusColor: Color(0xFF059669),
                    statusBgColor: Color(0xFFECFDF5),
                    doneTasks: '312',
                    pendingTasks: '18',
                    avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCLMC9w9XxPju6WsbNci1FUm6elYkSm9kslH5RVfIqVqLJ0y_cgIOMBiv2lPy1V7BiXD4BXlodiGgtGzD1QlbwzxqVtn7VusrEji2fiLbb5f3BPK3dD-22wjWi23L44-iUhampC40zYEHBiCtL9HVJKUA9l0caBbv1y1mhs7UGTCMIszA2nfyQzrlhBLACiLEi4M9hD6vvNNUxmBxmsEvDNKp-tIhr1vk5ZfNuIGVQ5FOgn0AXcxQhZ',
                  ),
                  const SizedBox(height: 12),
                  const EmployeeListCard(
                    name: 'Dr. Gandhi',
                    id: '#EMP-012',
                    role: 'Lead Doctor',
                    department: 'Medical Wing',
                    status: 'Active',
                    statusColor: Color(0xFF059669),
                    statusBgColor: Color(0xFFECFDF5),
                    doneTasks: '489',
                    pendingTasks: '6',
                    avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB2R39DmPPd4sEeuj7nPkQKcdgtRORWaMCMl6VtiwUkv3OnoiI4Qgyv0hiPK1LXI2CpRR0oNSxB2pXIoT5HR_cb2l2gLMRm46h3RHkNBWS80BKrYx3cq0xjkzGmjqJ-SIWukfNXru0agbgyhd8880rl5eBwZLvCiBNWsjIG5kXifTJxMxYW-gQ7yFKgTXPFQtBbj40kdUsK0bkOQVEpiOsn1wtaKYU-p2AsZxiUxI-cM5fhBo81nuVi',
                  ),
                  const SizedBox(height: 12),
                  const EmployeeListCard(
                    name: 'M. Yadav',
                    id: '#EMP-047',
                    role: 'Ambulance Team',
                    department: 'Transportation',
                    status: 'On Route',
                    statusColor: Color(0xFF2563EB),
                    statusBgColor: Color(0xFFEFF6FF),
                    doneTasks: '180',
                    pendingTasks: '2',
                    avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBSbYfePxSsDayD07KtBynhPftmo0h80m_JsTKP2Ubf6yHCSLDkFlgsmM5Bg4c3gEORuEDlCreWPQOwv3zlHyuBmEJidiEqHhYTiWlgMR1C3VTuPuMi_O5gevmDR2fNjlNzp6X8exmwnosLEya47zOeqJ0PlFnQEl1u_K-BGC9wykxn09TVgV-ro7VGMpKI3JZAmSO6cpK57h9aejYuThHRMQHxP3Lq_nkLEXijI0KinrTyPSi9VGWX',
                  ),
                  const SizedBox(height: 24),
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

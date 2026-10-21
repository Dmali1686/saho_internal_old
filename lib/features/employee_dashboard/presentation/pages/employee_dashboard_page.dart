import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/employee_app_colors.dart';
import 'tabs/tasks_tab.dart';
import 'tabs/task_details_tab.dart';
import 'tabs/patients_tab.dart';
import 'tabs/patient_details_tab.dart';
import 'tabs/profile_tab.dart';

class EmployeeDashboardPage extends StatefulWidget {
  const EmployeeDashboardPage({super.key});

  @override
  State<EmployeeDashboardPage> createState() => _EmployeeDashboardPageState();
}

class _EmployeeDashboardPageState extends State<EmployeeDashboardPage> {
  int _currentIndex = 0;
  bool _showingTaskDetails = false;
  bool _showingPatientDetails = false;

  void _onTaskTap() {
    setState(() {
      _showingTaskDetails = true;
    });
  }

  void _onPatientTap() {
    setState(() {
      _showingPatientDetails = true;
    });
  }

  void _onBackTap() {
    setState(() {
      _showingTaskDetails = false;
      _showingPatientDetails = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String headerTitle = 'Overview';
    if (_currentIndex == 1) headerTitle = 'My Tasks';
    if (_currentIndex == 2) headerTitle = 'Patients';
    if (_currentIndex == 3) headerTitle = 'Profile';
    if (_showingTaskDetails) headerTitle = 'Task Details';
    if (_showingPatientDetails) headerTitle = 'Patient Profile';

    return Scaffold(
      backgroundColor: EmployeeAppColors.canvas,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(headerTitle),
            Expanded(
              child: _buildCurrentTab(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildCurrentTab() {
    if (_showingTaskDetails) {
      return const EmployeeTaskDetailsTab();
    }
    if (_showingPatientDetails) {
      return const EmployeePatientDetailsTab();
    }
    switch (_currentIndex) {
      case 0:
        return _buildOverviewTab();
      case 1:
        return EmployeeTasksTab(onBeginTask: _onTaskTap);
      case 2:
        return EmployeePatientsTab(onPatientTap: _onPatientTap);
      case 3:
        return const EmployeeProfileTab();
      default:
        return Center(child: Text('Coming Soon'));
    }
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreetingCard(),
            SizedBox(height: 24.h),
            _buildMetricsGrid(),
            SizedBox(height: 24.h),
            _buildFeaturedPatient(),
            SizedBox(height: 24.h),
            _buildTasksSection(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String subtitle) {
    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: EmployeeAppColors.canvas.withOpacity(0.85),
        boxShadow: [
          BoxShadow(
            color: EmployeeAppColors.primary.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (_showingTaskDetails || _showingPatientDetails) ...[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, size: 18, color: EmployeeAppColors.textPrimary),
                  onPressed: _onBackTap,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                SizedBox(width: 12.w),
              ],
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: EmployeeAppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.pets, color: EmployeeAppColors.primary, size: 18),
              ),
              SizedBox(width: 12.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SAWO Care',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: EmployeeAppColors.textPrimary,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: EmployeeAppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications_none, color: EmployeeAppColors.textSecondary),
                    onPressed: () {},
                  ),
                  Positioned(
                    top: 14,
                    right: 14,
                    child: Container(
                      width: 6.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: EmployeeAppColors.error,
                        shape: BoxShape.circle,
                        border: Border.all(color: EmployeeAppColors.canvas, width: 1.5.w),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 4.w),
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: EmployeeAppColors.primary.withOpacity(0.2), width: 2.w),
                  image: const DecorationImage(
                    image: NetworkImage('https://ui-avatars.com/api/?name=S+Shinde&background=DBEAFE&color=1E3A8A'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGreetingCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: EmployeeAppColors.card,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -24,
            bottom: -24,
            child: Container(
              width: 96.w,
              height: 96.h,
              decoration: BoxDecoration(
                color: EmployeeAppColors.primaryLight.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'WARD SHIFT ACTIVE',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF059669),
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Container(
                          width: 6.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Good Morning, S. Shinde',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: EmployeeAppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: EmployeeAppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: const Icon(Icons.monitor_heart, color: Color(0xFF80440F)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.w,
      mainAxisSpacing: 12.h,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.4,
      children: [
        _buildMetricCard(
          title: "Today's Tasks",
          value: '8',
          subtitle: 'items',
          icon: Icons.assignment,
          iconColor: const Color(0xFF1E293B),
          bgColor: const Color(0xFFE8EDFC),
        ),
        _buildMetricCard(
          title: "Pending Tasks",
          value: '3',
          subtitle: 'high priority',
          subtitleColor: const Color(0xFF991B1B),
          icon: Icons.priority_high,
          iconColor: const Color(0xFF991B1B),
          bgColor: const Color(0xFFFEE2D5),
        ),
        _buildMetricCard(
          title: 'Assigned Pets',
          value: '6',
          subtitle: 'in ward',
          icon: Icons.pets,
          iconColor: const Color(0xFF7C2D12),
          bgColor: const Color(0xFFFED7AA),
        ),
        _buildMetricCard(
          title: 'Attendance',
          value: 'Checked In',
          subtitle: '08:52 AM',
          icon: Icons.how_to_reg,
          iconColor: const Color(0xFF064E3B),
          bgColor: const Color(0xFF6EE7B7),
          isValueText: true,
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    Color? subtitleColor,
    bool isValueText = false,
  }) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: iconColor.withOpacity(0.8),
                ),
              ),
              Container(
                width: 28.w,
                height: 28.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 16, color: iconColor),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              if (isValueText)
                Row(
                  children: [
                    Container(
                      width: 6.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: iconColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      value,
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: iconColor,
                      ),
                    ),
                  ],
                )
              else
                Text(
                  value,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: iconColor,
                    height: 1.h,
                  ),
                ),
              SizedBox(width: 6.w),
              if (!isValueText)
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: subtitleColor != null ? FontWeight.w600 : FontWeight.w500,
                    color: subtitleColor ?? iconColor.withOpacity(0.8),
                  ),
                ),
            ],
          ),
          if (isValueText)
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: subtitleColor ?? iconColor.withOpacity(0.8),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFeaturedPatient() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: EmployeeAppColors.card,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: EmployeeAppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(16.r),
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1552053831-71594a27632d?auto=format&fit=crop&w=150&q=80'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bella',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: EmployeeAppColors.textPrimary,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: EmployeeAppColors.primaryLight,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        'Post-Op Day 2',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: EmployeeAppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  'NPO after 12:00 PM • Vitals stable • Ward B-04',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: EmployeeAppColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today's Tasks",
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: EmployeeAppColors.textPrimary,
              ),
            ),
            Row(
              children: [
                Text(
                  'View All (8)',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF80440F),
                  ),
                ),
                const Icon(Icons.chevron_right, size: 16, color: Color(0xFF80440F)),
              ],
            ),
          ],
        ),
        SizedBox(height: 12.h),
        _buildTaskCard(
          title: 'Morning Patient Check',
          status: 'PENDING',
          statusColor: EmployeeAppColors.textSecondary,
          statusBg: EmployeeAppColors.surfaceSoft,
          description: 'Bella',
          location: 'Cage B-04',
          time: '09:00 AM',
          icon: Icons.medical_services,
          iconColor: const Color(0xFFC2410C),
          iconBg: const Color(0xFFFED7AA).withOpacity(0.5),
        ),
        SizedBox(height: 12.h),
        _buildTaskCard(
          title: 'Medicine Administration',
          status: 'PENDING',
          statusColor: EmployeeAppColors.textSecondary,
          statusBg: EmployeeAppColors.surfaceSoft,
          description: 'Bruno',
          location: 'Cage B-02',
          time: '10:30 AM',
          icon: Icons.medication,
          iconColor: const Color(0xFF991B1B),
          iconBg: const Color(0xFFFEE2D5).withOpacity(0.5),
        ),
        SizedBox(height: 12.h),
        _buildTaskCard(
          title: 'Cage Cleaning',
          status: 'IN PROGRESS',
          statusColor: Colors.white,
          statusBg: const Color(0xFF059669),
          description: 'Cage B-06 Enclosure',
          location: 'Ward B',
          time: '11:00 AM',
          icon: Icons.cleaning_services,
          iconColor: const Color(0xFF047857),
          iconBg: const Color(0xFFD1FAE5).withOpacity(0.5),
        ),
      ],
    );
  }

  Widget _buildTaskCard({
    required String title,
    required String status,
    required Color statusColor,
    required Color statusBg,
    required String description,
    required String location,
    required String time,
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: EmployeeAppColors.card,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(icon, color: iconColor),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: EmployeeAppColors.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: statusBg,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: EmployeeAppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: EmployeeAppColors.surfaceSoft,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.meeting_room, size: 13, color: Color(0xFF80440F)),
                          SizedBox(width: 4.w),
                          Text(
                            location,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: EmployeeAppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Row(
                      children: [
                        Icon(Icons.schedule, size: 14, color: EmployeeAppColors.textSecondary),
                        SizedBox(width: 4.w),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: EmployeeAppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 4.w),
          Icon(Icons.chevron_right, color: EmployeeAppColors.border),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: EmployeeAppColors.card.withOpacity(0.9),
        boxShadow: [
          BoxShadow(
            color: EmployeeAppColors.primary.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, -8),
          ),
        ],
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.grid_view, 'Overview', 0),
              _buildNavItem(Icons.checklist, 'Tasks', 1, badgeCount: 6),
              _buildNavItem(Icons.pets, 'Patients', 2),
              _buildNavItem(Icons.person, 'Profile', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, {int? badgeCount}) {
    final isSelected = _currentIndex == index;
    final color = isSelected ? EmployeeAppColors.primary : EmployeeAppColors.border.withOpacity(0.8);
    
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = index;
            _showingTaskDetails = false;
          });
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 36,
                height: 24,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Icon(icon, color: color, size: 22),
                    if (badgeCount != null)
                      Positioned(
                        right: 0,
                        top: -2,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xFF2563EB),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            badgeCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

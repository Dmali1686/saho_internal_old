import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/employee_app_colors.dart';
import '../../../../auth/presentation/pages/login_page.dart';

class EmployeeProfileTab extends StatelessWidget {
  const EmployeeProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileHeader(),
          SizedBox(height: 24.h),
          _buildAttendanceSection(),
          SizedBox(height: 24.h),
          _buildPreferencesSection(),
          SizedBox(height: 32.h),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 96.w,
                height: 96.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: EmployeeAppColors.surfaceSoft,
                  border: Border.all(color: EmployeeAppColors.surfaceSoft, width: 4.w),
                  image: const DecorationImage(
                    image: NetworkImage('https://ui-avatars.com/api/?name=S+Shinde&background=ebdcff&color=5525a2&size=200'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 4.w,
                right: 4.w,
                child: Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF059669),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3.w),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'S. Shinde',
            style: TextStyle(
              fontFamily: 'Outfit',
              fontSize: 19.2.sp,
              fontWeight: FontWeight.w700,
              color: EmployeeAppColors.textPrimary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'EMP-084',
            style: TextStyle(
              fontFamily: 'Courier',
              fontSize: 11.2.sp,
              fontWeight: FontWeight.w500,
              color: EmployeeAppColors.textSecondary,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: const Color(0xFFFED7AA).withOpacity(0.5),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.badge, size: 16.sp, color: const Color(0xFFC2410C)),
                SizedBox(width: 6.w),
                Text(
                  'Caretaker • Ward B',
                  style: TextStyle(
                    fontSize: 10.4.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFC2410C),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Animal Care & Kennels',
            style: TextStyle(
              fontSize: 10.4.sp,
              color: EmployeeAppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today's Attendance",
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 14.4.sp,
                fontWeight: FontWeight.w600,
                color: EmployeeAppColors.textPrimary,
              ),
            ),
            Text(
              'Shift 1 of 2',
              style: TextStyle(
                fontSize: 10.4.sp,
                color: EmployeeAppColors.textSecondary,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD1FAE5),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, size: 14.sp, color: const Color(0xFF059669)),
                        SizedBox(width: 4.w),
                        Text(
                          'Checked In',
                          style: TextStyle(
                            fontSize: 9.6.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF059669),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '08:52 AM Today',
                    style: TextStyle(
                      fontSize: 10.4.sp,
                      color: EmployeeAppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: EmployeeAppColors.surfaceSoft,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(Icons.schedule, color: const Color(0xFF80440F), size: 20.sp),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Morning Shift',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: EmployeeAppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            '08:00 AM - 04:00 PM (Ward B)',
                            style: TextStyle(
                              fontSize: 9.6.sp,
                              color: EmployeeAppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEE2D5).withOpacity(0.5),
                    foregroundColor: const Color(0xFF991B1B),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  icon: Icon(Icons.logout, size: 20.sp),
                  label: Text(
                    'Check Out Shift',
                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreferencesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account & Preferences',
          style: TextStyle(
            fontFamily: 'Outfit',
            fontSize: 14.4.sp,
            fontWeight: FontWeight.w600,
            color: EmployeeAppColors.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildPreferenceItem(
                icon: Icons.person,
                title: 'Profile Information',
                showChevron: true,
              ),
              _buildDivider(),
              _buildPreferenceItem(
                icon: Icons.shield,
                title: 'Role & Assigned Ward',
                trailingText: 'Caretaker (Ward B)',
                showChevron: true,
              ),
              _buildDivider(),
              _buildPreferenceItem(
                icon: Icons.notifications,
                title: 'Notification Preferences',
                trailingWidget: Switch(
                  value: true,
                  onChanged: (val) {},
                  activeColor: const Color(0xFF80440F),
                ),
              ),
              _buildDivider(),
              _buildPreferenceItem(
                icon: Icons.menu_book,
                title: 'Emergency SOP & Protocols',
                showChevron: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreferenceItem({
    required IconData icon,
    required String title,
    String? trailingText,
    bool showChevron = false,
    Widget? trailingWidget,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: EmployeeAppColors.surfaceSoft,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 18.sp, color: EmployeeAppColors.textSecondary),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: EmployeeAppColors.textPrimary,
              ),
            ),
          ),
          if (trailingText != null)
            Text(
              trailingText,
              style: TextStyle(
                fontSize: 10.4.sp,
                color: EmployeeAppColors.textSecondary,
              ),
            ),
          if (trailingText != null && showChevron) SizedBox(width: 4.w),
          if (trailingWidget != null) trailingWidget,
          if (showChevron) Icon(Icons.chevron_right, size: 20.sp, color: EmployeeAppColors.border),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1.h,
      thickness: 1,
      color: EmployeeAppColors.border.withOpacity(0.5),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        Center(
          child: TextButton.icon(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: EmployeeAppColors.error,
              backgroundColor: EmployeeAppColors.surfaceSoft,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
            icon: Icon(Icons.power_settings_new, size: 18.sp),
            label: Text(
              'Log Out Staff Account',
              style: TextStyle(
                fontSize: 11.2.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Center(
          child: Text(
            'SAWO Staff v2.4.1 (Build 108) • Animal Welfare Ops',
            style: TextStyle(
              fontSize: 9.6.sp,
              color: EmployeeAppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../dashboard/presentation/widgets/dashboard_header.dart';
import '../../../dashboard/presentation/widgets/dashboard_bottom_nav.dart';

class MedicalDepartmentPage extends StatelessWidget {
  final String departmentId;

  const MedicalDepartmentPage({super.key, required this.departmentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F7),
      bottomNavigationBar: const DashboardBottomNav(currentIndex: 4),
      body: SafeArea(
        child: Column(
          children: [
            const DashboardHeader(),
            // Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildIdentityCard(),
                    SizedBox(height: 12.h),
                    _buildAlertBanner(),
                    SizedBox(height: 20.h),
                    _buildEmployeesSection(),
                    SizedBox(height: 20.h),
                    _buildFacilitiesSection(),
                    SizedBox(height: 20.h),
                    _buildHandoverSection(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIdentityCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFDDE5E1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Medical Wing',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F2933),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Diagnosis, Outpatient & Inpatient Clinical Care',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFEBF5F3),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: const Color(0xFFDDE5E1)),
                ),
                child: Icon(Icons.medical_services, color: const Color(0xFF2E7D6B), size: 18.sp),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F9F7),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFDDE5E1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn('STAFF', '8', 'Active Roster', const Color(0xFF2E7D6B)),
                _buildStatColumn('TASKS', '14', '4 Critical', const Color(0xFF5FAF9B), subtextColor: const Color(0xFFD9534F)),
                _buildStatColumn('CASES', '36', '14 ICU Tiers', const Color(0xFF1F2933)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String value, String subtext, Color valueColor, {Color? subtextColor}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 9.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF6B7280),
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: valueColor,
            height: 1.1,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          subtext,
          style: TextStyle(
            fontSize: 8.sp,
            fontWeight: subtextColor != null ? FontWeight.bold : FontWeight.normal,
            color: subtextColor ?? const Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }

  Widget _buildAlertBanner() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFEECEC),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFFCA5A5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: const Color(0xFFFCA5A5).withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.emergency, color: const Color(0xFFD9534F), size: 16.sp),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Critical Case in OT-1',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF991B1B),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Bengal Slow Loris • Trauma',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xFFB91C1C),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD9534F),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              minimumSize: Size(0, 30.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            child: Text('View', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      'On-Duty Medical Team',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F2933),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF5F3),
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: const Color(0xFFDDE5E1)),
                    ),
                    child: Text(
                      '3 Active',
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: const Color(0xFF2E7D6B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Row(
              children: [
                Text(
                  'Full Roster',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2E7D6B),
                  ),
                ),
                Icon(Icons.chevron_right, size: 14.sp, color: const Color(0xFF2E7D6B)),
              ],
            ),
          ],
        ),
        SizedBox(height: 12.h),
        _buildEmployeeRow(
          'Dr. Gandhi',
          'ICU Lead',
          'Senior Wildlife Vet • Ward A Rounds',
          const Color(0xFFEBF5F3),
          const Color(0xFF2E7D6B),
        ),
        _buildEmployeeRow(
          'Dr. R. Kulkarni',
          'In OT-1',
          'Surgical Lead • Case #SA-409',
          const Color(0xFFFEECEC),
          const Color(0xFFD9534F),
        ),
        _buildEmployeeRow(
          'S. Shinde',
          'Ward B Lead',
          'Post-Op Caretaker • Feed & Meds',
          const Color(0xFFEBF5F3),
          const Color(0xFF2E7D6B),
          dotColor: const Color(0xFF5FAF9B),
        ),
        _buildEmployeeRow(
          'Nurse A. Patil',
          'Triage Lead',
          'Wound Care & Sample Processing',
          const Color(0xFFEBF5F3),
          const Color(0xFF2E7D6B),
          dotColor: const Color(0xFF5FAF9B),
        ),
      ],
    );
  }

  Widget _buildEmployeeRow(
    String name,
    String tag,
    String desc,
    Color tagBgColor,
    Color tagColor, {
    Color? dotColor,
  }) {
    final effectiveDotColor = dotColor ?? tagColor;
    final initials = name.replaceAll('Dr. ', '').replaceAll('Nurse ', '').split(' ').take(2).map((e) => e.isNotEmpty ? e[0] : '').join('').toUpperCase();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFDDE5E1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 20.w,
                backgroundColor: const Color(0xFFF0EDE9),
                child: Text(
                  initials,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    color: effectiveDotColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1F2933),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: tagBgColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: tagColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xFF6B7280),
                    height: 1.3,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: const Color(0xFFEBF5F3),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFDDE5E1)),
            ),
            child: Icon(Icons.call, color: const Color(0xFF2E7D6B), size: 16.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildFacilitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Wing Facilities & Capacity',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1F2933),
              ),
            ),
            Text(
              'Live Sensor Sync',
              style: TextStyle(
                fontSize: 9.sp,
                color: const Color(0xFF6B7280),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        _buildFacilityRow('Ward A (Intensive Care)', '100% Full', 1.0, const Color(0xFFD9534F), const Color(0xFFFEECEC), '14 Cages Occupied • No Vacancy', 'Triage Redirection Active'),
        SizedBox(height: 8.h),
        _buildFacilityRow('Ward B (Post-Surgical)', '75% Cap', 0.75, const Color(0xFF2E7D6B), const Color(0xFFEBF5F3), '12/16 Enclosures In Use', '4 Cages Prepped'),
        SizedBox(height: 8.h),
        _buildFacilityRow('Isolation Wing', '4 Active Cases', 0.5, const Color(0xFF5FAF9B), const Color(0xFFEBF5F3), 'Air Filtration: Nominal • UV Active', 'Negative Pressure Verified'),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(child: _buildOtCard('OT-1', 'In Surgery', 'Dr. Kulkarni (#SA-409)', 'Elapsed: 42m', const Color(0xFFD9534F), Icons.schedule, true)),
            SizedBox(width: 12.w),
            Expanded(child: _buildOtCard('OT-2', 'Sterilized', 'Ready for Emergency', 'Autoclave 15:30', const Color(0xFF2E7D6B), Icons.check_circle, false)),
          ],
        ),
      ],
    );
  }

  Widget _buildFacilityRow(String title, String tag, double progress, Color primaryColor, Color tagBgColor, String descL, String descR) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFDDE5E1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(width: 8.w, height: 8.w, decoration: BoxDecoration(color: primaryColor, shape: BoxShape.circle)),
                  SizedBox(width: 6.w),
                  Text(title, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1F2933))),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: tagBgColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(tag, style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: primaryColor)),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFFEBF5F3),
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              minHeight: 6.h,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(descL, style: TextStyle(fontSize: 9.sp, color: const Color(0xFF6B7280)), maxLines: 1, overflow: TextOverflow.ellipsis)),
              SizedBox(width: 8.w),
              Text(descR, style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: primaryColor)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOtCard(String title, String status, String desc, String time, Color color, IconData icon, bool animatePing) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFDDE5E1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1F2933))),
              Container(width: 6.w, height: 6.w, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
            ],
          ),
          SizedBox(height: 8.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(status, style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: color)),
              SizedBox(height: 2.h),
              Text(desc, style: TextStyle(fontSize: 9.sp, color: const Color(0xFF6B7280), height: 1.3), maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(icon, size: 14.sp, color: const Color(0xFF2E7D6B)),
              SizedBox(width: 4.w),
              Expanded(child: Text(time, style: TextStyle(fontSize: 9.sp, color: const Color(0xFF6B7280)), maxLines: 1, overflow: TextOverflow.ellipsis)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHandoverSection() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: const Color(0xFFFEF3C7),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFFFCD34D)),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB45309),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Icon(Icons.sync_alt, color: Colors.white, size: 16.sp),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('UPCOMING HANDOVER', style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: const Color(0xFFB45309), letterSpacing: 0.5)),
                        SizedBox(height: 2.h),
                        Text('Next rotation at 18:00', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF78350F))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D6B),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  minimumSize: Size(double.infinity, 40.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.verified, size: 16.sp),
                    SizedBox(width: 6.w),
                    Text('Initiate Handover Protocol', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFDDE5E1)),
                  minimumSize: Size(0, 44.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_add, size: 16.sp, color: const Color(0xFF2E7D6B)),
                    SizedBox(width: 6.w),
                    Flexible(child: Text('Assign Staff', style: TextStyle(color: const Color(0xFF1F2933), fontWeight: FontWeight.bold, fontSize: 11.sp), overflow: TextOverflow.ellipsis)),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFDDE5E1)),
                  minimumSize: Size(0, 44.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.summarize, size: 16.sp, color: const Color(0xFF2E7D6B)),
                    SizedBox(width: 6.w),
                    Flexible(child: Text('Dept Report', style: TextStyle(color: const Color(0xFF1F2933), fontWeight: FontWeight.bold, fontSize: 11.sp), overflow: TextOverflow.ellipsis)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

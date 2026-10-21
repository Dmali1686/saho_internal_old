import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/employee_app_colors.dart';

class EmployeePatientDetailsTab extends StatelessWidget {
  const EmployeePatientDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeroCard(),
          SizedBox(height: 24.h),
          _buildAssignmentSection(),
          SizedBox(height: 24.h),
          _buildTreatmentSection(),
          SizedBox(height: 32.h),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildHeroCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
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
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      color: EmployeeAppColors.surfaceSoft,
                      borderRadius: BorderRadius.circular(20.r),
                      image: const DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1543466835-00a7907e9de1?auto=format&fit=crop&w=150&q=80'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Icon(Icons.pets, color: EmployeeAppColors.border, size: 32.sp),
                  ),
                  Positioned(
                    bottom: -4.w,
                    right: -4.w,
                    child: Container(
                      width: 24.w,
                      height: 24.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(Icons.favorite, size: 14.sp, color: const Color(0xFF991B1B)),
                    ),
                  ),
                ],
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
                            fontSize: 19.2.sp,
                            fontWeight: FontWeight.w700,
                            color: EmployeeAppColors.textPrimary,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFED7AA).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            'Treatment',
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFC2410C),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Case #00417',
                      style: TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 11.2.sp.sp,
                        fontWeight: FontWeight.w500,
                        color: EmployeeAppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: EmployeeAppColors.surfaceSoft,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.pets, size: 14.sp, color: const Color(0xFF80440F)),
                          SizedBox(width: 6.w),
                          Text(
                            'Indie Mix • Female',
                            style: TextStyle(
                              fontSize: 9.6.sp.sp,
                              fontWeight: FontWeight.w500,
                              color: EmployeeAppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: EmployeeAppColors.surfaceSoft.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                _buildVitalMetric('Weight', '18', 'kg'),
                _buildVerticalDivider(),
                _buildVitalMetric('Age', '~2.5', 'yrs'),
                _buildVerticalDivider(),
                _buildTemperamentMetric('Temperament', 'Docile', Icons.sentiment_satisfied),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 1.w,
      height: 32.h,
      color: EmployeeAppColors.border.withOpacity(0.5),
      margin: EdgeInsets.symmetric(horizontal: 12.w),
    );
  }

  Widget _buildVitalMetric(String label, String value, String unit) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 9.sp.sp,
              color: EmployeeAppColors.textSecondary,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 14.4.sp.sp,
                  fontWeight: FontWeight.w600,
                  color: EmployeeAppColors.textPrimary,
                ),
              ),
              SizedBox(width: 2.w),
              Text(
                unit,
                style: TextStyle(
                  fontSize: 9.sp.sp,
                  color: EmployeeAppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTemperamentMetric(String label, String value, IconData icon) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 9.sp.sp,
              color: EmployeeAppColors.textSecondary,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 11.2.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF059669),
                ),
              ),
              SizedBox(width: 4.w),
              Icon(icon, size: 14.sp, color: const Color(0xFF059669)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAssignmentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Current Assignment',
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 14.4.sp.sp,
                fontWeight: FontWeight.w600,
                color: EmployeeAppColors.textPrimary,
              ),
            ),
            Text(
              'Ward B Rotation',
              style: TextStyle(
                fontSize: 9.6.sp.sp,
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
              _buildAssignmentRow(
                icon: Icons.meeting_room,
                iconColor: const Color(0xFF80440F),
                iconBg: const Color(0xFFF5E6D3).withOpacity(0.5),
                title: 'Kennel Enclosure',
                subtitle: 'Cage B-04',
                actionWidget: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5E6D3),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    'Isolate',
                    style: TextStyle(
                      fontSize: 9.6.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF80440F),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              _buildAssignmentRow(
                icon: Icons.medical_services,
                iconColor: const Color(0xFF059669),
                iconBg: const Color(0xFFD1FAE5).withOpacity(0.5),
                title: 'Attending Doctor',
                subtitle: 'Dr. Gandhi',
                actionWidget: Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD1FAE5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.call, size: 18.sp, color: const Color(0xFF059669)),
                ),
              ),
              SizedBox(height: 16.h),
              _buildAssignmentRow(
                icon: Icons.volunteer_activism,
                iconColor: const Color(0xFFC2410C),
                iconBg: const Color(0xFFFED7AA).withOpacity(0.5),
                title: 'Assigned Caretaker',
                subtitle: 'S. Shinde',
                actionWidget: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFED7AA),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    'On Duty',
                    style: TextStyle(
                      fontSize: 9.6.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFC2410C),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAssignmentRow({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
    required Widget actionWidget,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Icon(icon, color: iconColor, size: 22.sp),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 10.4.sp.sp,
                  fontWeight: FontWeight.w500,
                  color: EmployeeAppColors.textSecondary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 12.8.sp.sp,
                  fontWeight: FontWeight.w600,
                  color: EmployeeAppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        actionWidget,
      ],
    );
  }

  Widget _buildTreatmentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Treatment & Health',
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 14.4.sp.sp,
                fontWeight: FontWeight.w600,
                color: EmployeeAppColors.textPrimary,
              ),
            ),
            Row(
              children: [
                Icon(Icons.history, size: 14.sp, color: EmployeeAppColors.primary),
                SizedBox(width: 4.w),
                Text(
                  'Day 4',
                  style: TextStyle(
                    fontSize: 9.6.sp.sp,
                    fontWeight: FontWeight.w600,
                    color: EmployeeAppColors.primary,
                  ),
                ),
              ],
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
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: EmployeeAppColors.surfaceSoft,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.healing, size: 16.sp, color: const Color(0xFF991B1B)),
                        SizedBox(width: 6.w),
                        Text(
                          'PRIMARY DIAGNOSIS',
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                            color: const Color(0xFF991B1B),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Injury recovery (Forelimb laceration repair)',
                      style: TextStyle(
                        fontSize: 11.2.sp.sp,
                        fontWeight: FontWeight.w500,
                        color: EmployeeAppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF7EE),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 28.w,
                      height: 28.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B7C3F).withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.check_circle, size: 16.sp, color: const Color(0xFF2E6832)),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Surgical Incision Site',
                                style: TextStyle(
                                  fontSize: 9.6.sp.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF2E6832),
                                ),
                              ),
                              Text(
                                'Checked 8:15 AM',
                                style: TextStyle(
                                  fontSize: 9.sp.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF2E6832),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Healing cleanly, no inflammation or discharge observed. Edges approximated well.',
                            style: TextStyle(
                              fontSize: 10.4.sp.sp,
                              color: const Color(0xFF38533B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5E6D3),
                  foregroundColor: const Color(0xFF80440F),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                icon: Icon(Icons.assignment_turned_in, size: 20.sp),
                label: Text(
                  'Tasks (2)',
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF059669),
                  foregroundColor: Colors.white,
                  elevation: 2,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                icon: Icon(Icons.rate_review, size: 20.sp),
                label: Text(
                  'Log Care Note',
                  style: TextStyle(fontSize: 12.sp.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shield, size: 14.sp, color: EmployeeAppColors.textSecondary),
            SizedBox(width: 4.w),
            Text(
              'Shelter Automated Health System • SAWO',
              style: TextStyle(
                fontSize: 9.6.sp.sp,
                color: EmployeeAppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

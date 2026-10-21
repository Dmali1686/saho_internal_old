import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/employee_app_colors.dart';

class EmployeeTasksTab extends StatefulWidget {
  final VoidCallback? onBeginTask;
  const EmployeeTasksTab({super.key, this.onBeginTask});

  @override
  State<EmployeeTasksTab> createState() => _EmployeeTasksTabState();
}

class _EmployeeTasksTabState extends State<EmployeeTasksTab> {
  String _selectedTab = 'pending';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildShiftHeader(),
            SizedBox(height: 16.h),
            _buildSegmentedTabs(),
            SizedBox(height: 16.h),
            _buildProgressBar(),
            SizedBox(height: 24.h),
            _buildTasksFeed(),
          ],
        ),
      ),
    );
  }

  Widget _buildShiftHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's Shift",
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 17.6.sp,
                fontWeight: FontWeight.w600,
                color: EmployeeAppColors.textPrimary,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'Ward B • Shift Lead Dr. Shinde',
              style: TextStyle(
                fontSize: 9.6.sp,
                color: EmployeeAppColors.textSecondary,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: EmployeeAppColors.surfaceElevated,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF059669),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                'Workflow Engine Synced',
                style: TextStyle(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF059669),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSegmentedTabs() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: EmployeeAppColors.surfaceSoft,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          Expanded(child: _buildSegmentBtn('pending', 'Pending', '3')),
          Expanded(child: _buildSegmentBtn('progress', 'In Progress', '2')),
          Expanded(child: _buildSegmentBtn('completed', 'Done', '42')),
        ],
      ),
    );
  }

  Widget _buildSegmentBtn(String id, String label, String count) {
    final isActive = _selectedTab == id;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = id;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        decoration: BoxDecoration(
          color: isActive ? EmployeeAppColors.textPrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 9.6.sp,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: isActive ? EmployeeAppColors.surfaceSoft : EmployeeAppColors.textSecondary,
              ),
            ),
            SizedBox(width: 6.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: isActive ? Colors.white.withOpacity(0.2) : EmployeeAppColors.border.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                count,
                style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w700,
                  color: isActive ? EmployeeAppColors.surfaceSoft : EmployeeAppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: EmployeeAppColors.card,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: EmployeeAppColors.primary.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: const Color(0xFFD1FAE5),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.verified, color: const Color(0xFF059669), size: 18),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MORNING CLEARANCE',
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: EmployeeAppColors.border, // Or outline color
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  '1 of 4 Critical Tasks Done',
                  style: TextStyle(
                    fontSize: 10.4.sp,
                    fontWeight: FontWeight.w600,
                    color: EmployeeAppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 96.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: EmployeeAppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 24.w, // 25% of 96
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF059669),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksFeed() {
    // Only showing a static list for demo purposes
    return Column(
      children: [
        _buildClinicalObservationTask(),
        SizedBox(height: 14.h),
        _buildMedicationTask(),
        SizedBox(height: 14.h),
        _buildSanitationTask(),
        SizedBox(height: 14.h),
        _buildDietaryTask(),
      ],
    );
  }

  Widget _buildClinicalObservationTask() {
    return _buildComplexTaskCard(
      category: 'Clinical Observation',
      title: 'Morning Patient Check',
      status: 'Pending',
      isPending: true,
      patientName: 'Bella',
      patientDetails: 'Case #00417 • Post-op Day 2',
      patientImgUrl: 'https://images.unsplash.com/photo-1552053831-71594a27632d?auto=format&fit=crop&w=150&q=80',
      location: 'Cage B-04 • Ward B',
      timeText: '09:00 AM (Due in 25m)',
      footerIcon: Icons.badge,
      footerText: 'Assigned to S. Shinde',
      btnLabel: 'Begin',
      btnIcon: Icons.arrow_forward,
      onActionTap: widget.onBeginTask,
    );
  }

  Widget _buildMedicationTask() {
    return _buildComplexTaskCard(
      category: 'Medication',
      title: 'Medicine Administration',
      status: 'Pending',
      isPending: true,
      patientName: 'Bruno',
      patientDetails: 'Case #00421 • Amoxicillin 250mg',
      patientImgUrl: 'https://images.unsplash.com/photo-1537151608804-ea2f1ea290d0?auto=format&fit=crop&w=150&q=80',
      calloutIcon: Icons.medication,
      calloutText: 'Antibiotic tablet mixed thoroughly with wet gastrointestinal food pouch.',
      location: 'Cage B-02 • Ward B',
      timeText: '10:30 AM',
      footerIcon: Icons.inventory_2,
      footerText: 'Batch Rx #772',
      btnLabel: 'Administer',
      btnIcon: Icons.done,
    );
  }

  Widget _buildSanitationTask() {
    return _buildComplexTaskCard(
      category: 'Sanitation & Hygiene',
      title: 'Cage Cleaning',
      status: 'In Progress',
      isPending: false,
      patientName: 'Cage B-06',
      patientDetails: 'Post-Surgery Recovery Ward',
      isLocationOnly: true,
      calloutIcon: Icons.photo_camera,
      calloutText: 'Photo verification required',
      timeText: '11:00 AM',
      footerIcon: Icons.timelapse,
      footerText: 'Started 8 mins ago',
      btnLabel: 'Upload Snap',
      btnIcon: Icons.camera_alt,
      btnColor: EmployeeAppColors.secondary,
    );
  }

  Widget _buildDietaryTask() {
    return _buildComplexTaskCard(
      category: 'Dietary Feeding',
      title: 'Post-Operative Soft Diet',
      status: 'Pending',
      isPending: true,
      patientName: 'Milo',
      patientDetails: 'Case #00409 • 1/2 can Gastro-Intestinal Kitten',
      patientImgUrl: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?auto=format&fit=crop&w=150&q=80',
      location: 'Cage B-01',
      timeText: '01:00 PM',
      footerIcon: Icons.restaurant,
      footerText: 'Dietary Code #D-04',
      btnLabel: 'Log Feeding',
      btnIcon: Icons.check_circle,
      btnColor: EmployeeAppColors.primaryLight,
      btnTextColor: EmployeeAppColors.primary,
    );
  }

  Widget _buildComplexTaskCard({
    required String category,
    required String title,
    required String status,
    required bool isPending,
    required String patientName,
    required String patientDetails,
    String? patientImgUrl,
    bool isLocationOnly = false,
    IconData? calloutIcon,
    String? calloutText,
    String? location,
    required String timeText,
    required IconData footerIcon,
    required String footerText,
    required String btnLabel,
    required IconData btnIcon,
    Color? btnColor,
    Color? btnTextColor,
    VoidCallback? onActionTap,
  }) {
    final accentColor = isPending ? Colors.amber.shade500 : EmployeeAppColors.primary;
    final statusBgColor = isPending ? Colors.amber.shade50 : EmployeeAppColors.primaryLight;
    final statusTextColor = isPending ? Colors.amber.shade800 : EmployeeAppColors.primary;

    return Container(
      decoration: BoxDecoration(
        color: EmployeeAppColors.card,
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: 14.4.sp,
                                fontWeight: FontWeight.w600,
                                color: EmployeeAppColors.textPrimary,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: statusBgColor,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 6.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                    color: accentColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  status,
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w600,
                                    color: statusTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            patientName,
                            style: TextStyle(
                              fontSize: 10.4.sp,
                              fontWeight: FontWeight.w600,
                              color: EmployeeAppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            patientDetails,
                            style: TextStyle(
                              fontSize: 9.6.sp,
                              color: EmployeeAppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      if (calloutText != null)
                        Container(
                          padding: EdgeInsets.all(10.w),
                          margin: EdgeInsets.only(bottom: 12.h),
                          decoration: BoxDecoration(
                            color: isPending ? EmployeeAppColors.surfaceSoft : EmployeeAppColors.primaryLight.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                calloutIcon ?? (isPending ? Icons.medication : Icons.photo_camera),
                                size: 16,
                                color: const Color(0xFFC2410C),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  calloutText,
                                  style: TextStyle(
                                    fontSize: 9.6.sp,
                                    fontWeight: isPending ? FontWeight.w400 : FontWeight.w600,
                                    color: isPending ? EmployeeAppColors.textPrimary : EmployeeAppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (location != null)
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: EmployeeAppColors.surfaceSoft,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.location_on, size: 14, color: const Color(0xFF80440F)),
                                  SizedBox(width: 4.w),
                                  Text(
                                    location,
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w500,
                                      color: EmployeeAppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: isPending ? Colors.amber.shade50 : EmployeeAppColors.surfaceSoft,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.schedule, size: 14, color: isPending ? Colors.amber.shade700 : EmployeeAppColors.textSecondary),
                                SizedBox(width: 4.w),
                                Text(
                                  timeText,
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: isPending ? FontWeight.w600 : FontWeight.w500,
                                    color: isPending ? Colors.amber.shade900 : EmployeeAppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: EmployeeAppColors.surfaceSoft.withOpacity(0.5),
                      ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(footerIcon, size: 16, color: EmployeeAppColors.border), // outline
                                SizedBox(width: 6.w),
                                Text(
                                  footerText,
                                  style: TextStyle(
                                    fontSize: 9.6.sp,
                                    color: EmployeeAppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton.icon(
                              onPressed: onActionTap ?? () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: btnColor ?? const Color(0xFF80440F),
                                foregroundColor: btnTextColor ?? Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 0.h),
                                minimumSize: const Size(0, 32),
                              ),
                              icon: Icon(btnIcon, size: 15),
                              label: Text(
                                btnLabel,
                                style: TextStyle(fontSize: 9.6.sp, fontWeight: FontWeight.w600),
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

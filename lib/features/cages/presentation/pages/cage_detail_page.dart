import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class CageDetailPage extends StatelessWidget {
  final Map<String, dynamic> cageData;
  final String sectorName;

  const CageDetailPage({
    super.key,
    required this.cageData,
    this.sectorName = 'Sector B (Canine ICU)',
  });

  @override
  Widget build(BuildContext context) {
    final id = cageData['id'] as String? ?? 'B-01';
    final status = cageData['status'] as String? ?? 'Available';
    final isOccupied = status == 'Occupied';
    final isLocked = status == 'Locked';

    String headline;
    String caseId;
    String species;
    String doctor;
    String caretaker;
    String cleanStatus;
    String cleanTime;
    Color badgeBgColor;
    Color badgeTextColor;
    IconData statusIcon;

    if (isOccupied) {
      final name = cageData['name'] as String? ?? 'Patient';
      headline = '$name · Canine Recovery';
      caseId = cageData['caseId'] as String? ?? 'SAWO-CASE-2026-00417';
      species = cageData['species'] as String? ?? 'Canis familiaris (14.2 kg)';
      doctor = cageData['doctor'] as String? ?? 'Dr. Gandhi';
      caretaker = cageData['caretaker'] as String? ?? 'S. Shinde';
      cleanStatus = 'Completed';
      cleanTime = cageData['cleanTime'] as String? ?? 'Inspected at 08:30 AM';
      badgeBgColor = const Color(0xFFDDF3EE);
      badgeTextColor = AppColors.primary;
      statusIcon = Icons.pets;
    } else if (status == 'Available') {
      headline = 'Enclosure Vacant · Ready for Intake';
      caseId = 'None Assigned';
      species = 'Compatible: Dogs up to 25kg';
      doctor = 'On Duty Vet';
      caretaker = 'R. Patil';
      cleanStatus = 'Sanitized & Ready';
      cleanTime = cageData['desc'] as String? ?? 'Cleaned';
      badgeBgColor = const Color(0xFFECFDF5);
      badgeTextColor = const Color(0xFF065F46);
      statusIcon = Icons.check_circle_outline;
    } else {
      headline = 'Enclosure Locked · Maintenance Active';
      caseId = 'MAINT-2026-084';
      species = 'Off-limits';
      doctor = 'N/A';
      caretaker = 'Maintenance Crew';
      cleanStatus = 'Deep Sterilization in Progress';
      cleanTime = cageData['desc'] as String? ?? 'Maintenance';
      badgeBgColor = const Color(0xFFF1F5F9);
      badgeTextColor = const Color(0xFF1E293B);
      statusIcon = Icons.lock_outline;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF17211F)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Cage $id Details',
          style: TextStyle(
            color: const Color(0xFF17211F),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Color(0xFF17211F)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF17211F)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Main Info Card
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: 56.w,
                              height: 56.h,
                              decoration: BoxDecoration(
                                color: badgeBgColor,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Icon(
                                statusIcon,
                                color: badgeTextColor,
                                size: 28,
                              ),
                            ),
                            SizedBox(width: 14.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Cage $id',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF17211F),
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w, vertical: 2.h),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF1F5F9),
                                          borderRadius:
                                              BorderRadius.circular(6.r),
                                        ),
                                        child: Text(
                                          sectorName.split(' ').first,
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF66736F),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    headline,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: badgeTextColor,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: badgeBgColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            color: badgeTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  const Divider(height: 1, color: Color(0xFFEBEFEF)),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMiniStat('SECTOR', sectorName.split(' ').first, Icons.grid_view),
                      Container(height: 28.h, width: 1, color: const Color(0xFFEBEFEF)),
                      _buildMiniStat('ENCLOSURE', id, Icons.meeting_room),
                      Container(height: 28.h, width: 1, color: const Color(0xFFEBEFEF)),
                      _buildMiniStat('STATUS', status, Icons.info_outline),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Detailed Specifications Card
            Container(
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ENCLOSURE SPECIFICATIONS',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: const Color(0xFF66736F),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Container(
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F8F7),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Column(
                      children: [
                        _buildDetailRow('Case ID', caseId, isMono: true),
                        SizedBox(height: 10.h),
                        _buildDetailRow('Species & Weight', species),
                        SizedBox(height: 10.h),
                        _buildDetailRowWithIcon(
                            'Assigned Doctor', doctor, Icons.medical_services_outlined),
                        SizedBox(height: 10.h),
                        _buildDetailRowWithIcon(
                            'Assigned Caretaker', caretaker, Icons.support_agent_outlined),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sanitation Status',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF66736F),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      isLocked
                                          ? Icons.engineering
                                          : Icons.verified,
                                      size: 15,
                                      color: badgeTextColor,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      cleanStatus,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: badgeTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  cleanTime,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: const Color(0xFF66736F),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Enclosure Environment Card
            Container(
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ENVIRONMENT & MONITORING',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: const Color(0xFF66736F),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    children: [
                      Expanded(
                        child: _buildEnvParam(
                          'Temperature',
                          '22.4°C',
                          'Target: 22-24°C',
                          Icons.thermostat_outlined,
                          const Color(0xFF059669),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: _buildEnvParam(
                          'Humidity',
                          '48%',
                          'Optimal Comfort',
                          Icons.water_drop_outlined,
                          const Color(0xFF0284C7),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: _buildEnvParam(
                          'Ventilation',
                          'High Flow',
                          'HEPA Active',
                          Icons.air_outlined,
                          const Color(0xFF7C3AED),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Audit History Timeline
            Container(
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
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
                      Text(
                        'AUDIT & ACTIVITY TIMELINE',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          color: const Color(0xFF66736F),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDDF3EE),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          'Shift Day 14',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  _buildAuditStep(
                    'Allocated',
                    '09:30 AM',
                    isOccupied
                        ? 'Patient ${cageData['name']} assigned to enclosure'
                        : 'Enclosure inspected and marked as $status',
                    AppColors.primary,
                  ),
                  _buildAuditStep(
                    'Cleaning & Sanitization',
                    '08:30 AM',
                    'Completed & sanitized by R. Patil',
                    const Color(0xFF10B981),
                  ),
                  _buildAuditStep(
                    'Status Modified',
                    '08:00 AM',
                    'Status updated to $status',
                    const Color(0xFF9E5B26),
                    isLast: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isOccupied
                                ? 'Reallocate dialog opened for Cage $id'
                                : 'Assigning patient to Cage $id...',
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF176B5B),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      minimumSize: const Size(0, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(isOccupied ? Icons.sync_alt : Icons.person_add_alt_1,
                            size: 18),
                        SizedBox(width: 8.w),
                        Text(
                          isOccupied ? 'Reallocate Patient' : 'Assign Patient',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Status options opened for Cage $id'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF17211F),
                    side: const BorderSide(color: Color(0xFFE3E9E7)),
                    minimumSize: const Size(0, 50),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.tune, size: 18),
                      SizedBox(width: 8.w),
                      Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 13, color: const Color(0xFF66736F)),
            SizedBox(width: 4.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF66736F),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF17211F),
          ),
        ),
      ],
    );
  }

  Widget _buildEnvParam(String label, String value, String sub, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F8F7),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: color),
          SizedBox(height: 6.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF17211F),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              color: const Color(0xFF66736F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isMono = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xFF66736F),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF17211F),
            fontFamily: isMono ? 'monospace' : null,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRowWithIcon(String label, String value, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xFF66736F),
          ),
        ),
        Row(
          children: [
            Icon(icon, size: 16, color: const Color(0xFF66736F)),
            SizedBox(width: 6.w),
            Text(
              value,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF17211F),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAuditStep(
      String title, String time, String desc, Color color,
      {bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 24.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                if (!isLast)
                  Container(
                    width: 2.w,
                    color: const Color(0xFFE3E9E7),
                    margin: EdgeInsets.only(top: 12.h),
                  ),
                Container(
                  margin: EdgeInsets.only(top: 4.h),
                  width: 10.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.w),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF17211F),
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xFF66736F),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: const Color(0xFF66736F),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

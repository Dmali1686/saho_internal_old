import re

code = """import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/employee_app_colors.dart';

class EmployeeTaskDetailsTab extends StatefulWidget {
  const EmployeeTaskDetailsTab({super.key});

  @override
  State<EmployeeTaskDetailsTab> createState() => _EmployeeTaskDetailsTabState();
}

class _EmployeeTaskDetailsTabState extends State<EmployeeTaskDetailsTab> {
  String _taskState = 'pending'; // 'pending', 'in_progress', 'completed'
  int _seconds = 0;
  Timer? _timer;
  bool _showNoteArea = false;
  bool _showPhotoArea = false;
  final List<bool> _checklist = [false, false, false];

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _toggleTaskExecution() {
    setState(() {
      if (_taskState == 'pending') {
        _taskState = 'in_progress';
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            _seconds++;
          });
        });
      } else if (_taskState == 'in_progress') {
        _taskState = 'completed';
        _timer?.cancel();
        for (int i = 0; i < _checklist.length; i++) {
          _checklist[i] = true;
        }
      }
    });
  }

  String get _timerText {
    final mins = (_seconds / 60).floor().toString().padLeft(2, '0');
    final secs = (_seconds % 60).toString().padLeft(2, '0');
    return '\$mins:\$secs';
  }

  int get _checkedCount => _checklist.where((c) => c).length;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: EmployeeAppColors.canvas, // Solid light background
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 180.h),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 24.h),
                _buildPatientInfo(),
                SizedBox(height: 20.h),
                _buildMetadataList(),
                SizedBox(height: 32.h),
                _buildTaskInstructions(),
                SizedBox(height: 32.h),
                _buildRequirementsAndEvidence(),
              ],
            ),
          ),
        ),
        Positioned(
          left: 20.w,
          right: 20.w,
          bottom: 16.h,
          child: _buildBottomStickyActionArea(),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Morning Patient Check',
            style: TextStyle(
              fontFamily: 'Outfit',
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: EmployeeAppColors.textPrimary,
              height: 1.2,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: _taskState == 'pending'
                ? const Color(0xFFFEF5E7)
                : (_taskState == 'in_progress' ? EmployeeAppColors.secondaryFixed : const Color(0xFFE8F5E9)),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6.w,
                height: 6.w,
                decoration: BoxDecoration(
                  color: _taskState == 'pending'
                      ? const Color(0xFFF7B731)
                      : (_taskState == 'in_progress' ? EmployeeAppColors.primary : const Color(0xFF2E7D32)),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                _taskState == 'pending'
                    ? 'PENDING'
                    : (_taskState == 'in_progress' ? 'IN PROGRESS' : 'COMPLETED'),
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: _taskState == 'pending'
                      ? const Color(0xFFB4690E)
                      : (_taskState == 'in_progress' ? EmployeeAppColors.onSecondaryFixed : const Color(0xFF2E7D32)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPatientInfo() {
    return Row(
      children: [
        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            color: EmployeeAppColors.primaryLight,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.pets, color: EmployeeAppColors.primary, size: 24.sp),
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
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: EmployeeAppColors.textPrimary,
                    ),
                  ),
                  Text(
                    '#00417',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: EmployeeAppColors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                'Canine • Post-Op Recovery (Day 3)',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: EmployeeAppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMetadataList() {
    return Column(
      children: [
        _buildMetaRow(Icons.meeting_room, 'Location:', 'Cage B-04 • Ward B'),
        SizedBox(height: 12.h),
        _buildMetaRow(Icons.schedule, 'Scheduled:', '09:00 AM • Today'),
        SizedBox(height: 12.h),
        _buildMetaRow(Icons.badge, 'Caretaker:', 'S. Shinde (Staff #409)'),
      ],
    );
  }

  Widget _buildMetaRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18.sp, color: EmployeeAppColors.textSecondary),
        SizedBox(width: 12.w),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: EmployeeAppColors.textSecondary,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: EmployeeAppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTaskInstructions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Task Instructions',
              style: TextStyle(
                fontFamily: 'Outfit',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: EmployeeAppColors.textPrimary,
              ),
            ),
            Text(
              '\$_checkedCount of 3 done',
              style: TextStyle(
                fontSize: 14.sp,
                color: EmployeeAppColors.secondary,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        _buildChecklistItem(0, 'Check wound dressing condition'),
        _buildDivider(),
        _buildChecklistItem(1, 'Measure water bowl replenishment'),
        _buildDivider(),
        _buildChecklistItem(2, 'Record morning body temperature'),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 24.h,
      thickness: 1,
      color: EmployeeAppColors.border.withOpacity(0.3),
    );
  }

  Widget _buildChecklistItem(int index, String title) {
    bool isChecked = _checklist[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          _checklist[index] = !_checklist[index];
        });
      },
      child: Container(
        color: Colors.transparent, // allow tap everywhere
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                color: isChecked ? EmployeeAppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(
                  color: isChecked ? EmployeeAppColors.primary : EmployeeAppColors.border,
                  width: 1.5,
                ),
              ),
              child: isChecked ? Icon(Icons.check, size: 16.sp, color: Colors.white) : null,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: EmployeeAppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequirementsAndEvidence() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Requirements & Evidence',
          style: TextStyle(
            fontFamily: 'Outfit',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: EmployeeAppColors.textPrimary,
          ),
        ),
        SizedBox(height: 16.h),
        _buildEvidenceItem(Icons.edit_note, 'Standard Clinical Notes', true),
        SizedBox(height: 12.h),
        _buildEvidenceItem(Icons.photo_camera, 'Photo Proof', false),
        SizedBox(height: 20.h),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _showNoteArea = !_showNoteArea;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: EmployeeAppColors.surfaceSoft,
                  foregroundColor: EmployeeAppColors.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                ),
                icon: Icon(Icons.note_add, size: 18.sp),
                label: Text('Add Note', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _showPhotoArea = !_showPhotoArea;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: EmployeeAppColors.surfaceSoft,
                  foregroundColor: EmployeeAppColors.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                ),
                icon: Icon(Icons.photo_camera, size: 18.sp),
                label: Text(_showPhotoArea ? 'Change Photo' : 'Upload Photo', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
        if (_showNoteArea) ...[
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: EmployeeAppColors.surfaceSoft,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Record observations...',
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: TextStyle(fontSize: 14.sp, color: EmployeeAppColors.textPrimary),
                ),
                SizedBox(height: 8.h),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showNoteArea = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: EmployeeAppColors.primaryLight,
                    foregroundColor: EmployeeAppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    minimumSize: Size(0, 32.h),
                  ),
                  child: Text('Save', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ],
        if (_showPhotoArea) ...[
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: EmployeeAppColors.surfaceSoft,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: EmployeeAppColors.surfaceElevated,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(Icons.image, color: EmployeeAppColors.primary, size: 20.sp),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'dressing_check.jpg',
                          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: EmployeeAppColors.textPrimary),
                        ),
                        Text(
                          'Attached just now',
                          style: TextStyle(fontSize: 11.sp, color: EmployeeAppColors.textSecondary),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _showPhotoArea = false;
                    });
                  },
                  icon: Icon(Icons.close, size: 18.sp, color: EmployeeAppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildEvidenceItem(IconData icon, String title, bool required) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 20.sp, color: EmployeeAppColors.textSecondary),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: EmployeeAppColors.textPrimary,
            ),
          ),
        ),
        if (required)
          Text(
            '*Required',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: EmployeeAppColors.error,
            ),
          )
        else
          Text(
            'Optional',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: EmployeeAppColors.textSecondary,
            ),
          ),
      ],
    );
  }

  Widget _buildBottomStickyActionArea() {
    Color btnColor = EmployeeAppColors.primary;
    String btnText = 'START TASK';
    IconData btnIcon = Icons.play_arrow;
    String hintText = 'Tap to begin tracking execution time';
    IconData hintIcon = Icons.timer;
    Color hintColor = EmployeeAppColors.textSecondary;

    if (_taskState == 'in_progress') {
      if (_checkedCount == 3) {
        btnColor = EmployeeAppColors.tertiary;
        btnText = 'COMPLETE TASK';
        btnIcon = Icons.check_circle;
      } else {
        btnColor = EmployeeAppColors.secondary;
        btnText = 'COMPLETE TASK';
        btnIcon = Icons.check_circle;
      }
      hintText = 'Task in progress: \$_timerText';
      hintColor = EmployeeAppColors.secondary;
      hintIcon = Icons.timer;
    } else if (_taskState == 'completed') {
      btnColor = const Color(0xFF2E7D32);
      btnText = 'TASK COMPLETED';
      btnIcon = Icons.task_alt;
      hintText = 'All items saved & timestamped';
      hintColor = const Color(0xFF2E7D32);
      hintIcon = Icons.check;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton.icon(
          onPressed: _taskState == 'completed' ? null : _toggleTaskExecution,
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor,
            foregroundColor: Colors.white,
            disabledBackgroundColor: btnColor,
            disabledForegroundColor: Colors.white,
            elevation: 4,
            shadowColor: btnColor.withOpacity(0.4),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
            padding: EdgeInsets.symmetric(vertical: 16.h),
            minimumSize: Size(double.infinity, 56.h),
          ),
          icon: Icon(btnIcon, size: 22.sp),
          label: Text(
            btnText,
            style: TextStyle(
              fontFamily: 'Outfit',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(hintIcon, size: 14.sp, color: hintColor),
            SizedBox(width: 6.w),
            Text(
              hintText,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: hintColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
"""

with open('lib/features/employee_dashboard/presentation/pages/tabs/task_details_tab.dart', 'w') as f:
    f.write(code)


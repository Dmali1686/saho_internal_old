import re

with open('lib/features/employee_dashboard/presentation/pages/tabs/task_details_tab.dart', 'r') as f:
    content = f.read()

# We will replace all the widget builder methods

new_identity = """  Widget _buildTaskIdentityCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CARETAKER ROUTINE CHECKUP',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  color: EmployeeAppColors.primary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Morning Patient Check',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                  color: EmployeeAppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: _taskState == 'pending'
                ? const Color(0xFFFEF5E7)
                : (_taskState == 'in_progress' ? EmployeeAppColors.secondaryFixed : const Color(0xFFE8F5E9)),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8.w,
                height: 8.w,
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
                  fontSize: 11.sp,
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
  }"""

new_patient = """  Widget _buildPatientContextSpotlight() {
    return Row(
      children: [
        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            color: EmployeeAppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.pets, color: EmployeeAppColors.primary, size: 22.sp),
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
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: EmployeeAppColors.primary,
                    ),
                  ),
                ],
              ),
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
  }"""

new_meta = """  Widget _buildMetadataGrid() {
    return Column(
      children: [
        _buildCleanMetaRow(Icons.meeting_room, 'Location', 'Cage B-04 • Ward B'),
        SizedBox(height: 8.h),
        _buildCleanMetaRow(Icons.schedule, 'Scheduled', '09:00 AM • Today'),
        SizedBox(height: 8.h),
        _buildCleanMetaRow(Icons.badge, 'Caretaker', 'S. Shinde (Staff #409)'),
      ],
    );
  }

  Widget _buildCleanMetaRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: EmployeeAppColors.textSecondary),
        SizedBox(width: 12.w),
        Text(
          '$title:',
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
              fontWeight: FontWeight.w600,
              color: EmployeeAppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }"""

new_instructions = """  Widget _buildTaskInstructions() {
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
              '$_checkedCount of 3 done',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: EmployeeAppColors.primary,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        _buildChecklistItem(0, 'Check wound dressing condition'),
        Divider(color: EmployeeAppColors.border.withOpacity(0.3), height: 1.h),
        _buildChecklistItem(1, 'Measure water bowl replenishment'),
        Divider(color: EmployeeAppColors.border.withOpacity(0.3), height: 1.h),
        _buildChecklistItem(2, 'Record morning body temperature'),
      ],
    );
  }

  Widget _buildChecklistItem(int index, String title) {
    bool isChecked = _checklist[index];
    return InkWell(
      onTap: () {
        setState(() {
          _checklist[index] = !_checklist[index];
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
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
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: isChecked ? FontWeight.w600 : FontWeight.w500,
                  color: isChecked ? EmployeeAppColors.border : EmployeeAppColors.textPrimary,
                  decoration: isChecked ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }"""

new_requirements = """  Widget _buildRequirementsAndEvidence() {
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
        _buildEvidenceItem(
          icon: Icons.edit_note,
          title: 'Standard Clinical Notes',
          required: true,
        ),
        SizedBox(height: 12.h),
        _buildEvidenceItem(
          icon: Icons.add_a_photo,
          title: 'Photo Proof',
          required: false,
        ),
        SizedBox(height: 16.h),
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
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                ),
                icon: Icon(Icons.note_add, size: 18.sp),
                label: Text('Add Note', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600)),
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
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                ),
                icon: Icon(Icons.photo_camera, size: 18.sp),
                label: Text(_showPhotoArea ? 'Change Photo' : 'Upload Photo', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600)),
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
                    hintText: 'Record observations, temp, alertness...',
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
                  child: Text('Save Note', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600)),
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

  Widget _buildEvidenceItem({required IconData icon, required String title, required bool required}) {
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
              fontWeight: FontWeight.w500,
              color: EmployeeAppColors.textPrimary,
            ),
          ),
        ),
        if (required)
          Text(
            '*Required',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: EmployeeAppColors.error,
            ),
          )
        else
          Text(
            'Optional',
            style: TextStyle(
              fontSize: 12.sp,
              color: EmployeeAppColors.textSecondary,
            ),
          ),
      ],
    );
  }"""

new_bottom_btn = """  Widget _buildBottomStickyActionArea() {
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
      hintText = 'Task in progress: $_timerText';
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
              fontWeight: FontWeight.w700,
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
"""

content = re.sub(r'  Widget _buildTaskIdentityCard\(\) \{.*?(?=  Widget _buildPatientContextSpotlight\(\) \{)', new_identity + '\n\n', content, flags=re.DOTALL)
content = re.sub(r'  Widget _buildPatientContextSpotlight\(\) \{.*?(?=  Widget _buildMetadataGrid\(\) \{)', new_patient + '\n\n', content, flags=re.DOTALL)
content = re.sub(r'  Widget _buildMetadataGrid\(\) \{.*?(?=  Widget _buildTaskInstructions\(\) \{)', new_meta + '\n\n', content, flags=re.DOTALL)
content = re.sub(r'  Widget _buildTaskInstructions\(\) \{.*?(?=  Widget _buildRequirementsAndEvidence\(\) \{)', new_instructions + '\n\n', content, flags=re.DOTALL)
content = re.sub(r'  Widget _buildRequirementsAndEvidence\(\) \{.*?(?=  Widget _buildBottomStickyActionArea\(\) \{)', new_requirements + '\n\n', content, flags=re.DOTALL)
content = re.sub(r'  Widget _buildBottomStickyActionArea\(\) \{.*?(?=\}$)', new_bottom_btn, content, flags=re.DOTALL)

with open('lib/features/employee_dashboard/presentation/pages/tabs/task_details_tab.dart', 'w') as f:
    f.write(content)

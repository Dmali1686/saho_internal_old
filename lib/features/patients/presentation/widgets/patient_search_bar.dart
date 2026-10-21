import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

class PatientSearchBar extends StatelessWidget {
  final String hintText;
  
  const PatientSearchBar({
    super.key,
    this.hintText = 'Search patient or case ID...',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(color: AppColors.border),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: AppColors.textMuted, size: 18.sp),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isCollapsed: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 13.sp,
                      height: 1.2,
                    ),
                  ),
                ),
                Icon(Icons.mic_none, color: AppColors.textMuted, size: 18.sp),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

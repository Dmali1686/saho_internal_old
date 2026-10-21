import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../notifications/presentation/pages/notifications_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (Navigator.canPop(context)) ...[
                IconButton(
                  icon: Icon(Icons.arrow_back, color: AppColors.textDark, size: 20.sp),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                SizedBox(width: 8.w),
              ],
              Container(
                width: 36.w,
                height: 36.w,
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDECCB8), width: 1.5),
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDxSOyviISzCFdbD0POiwxxJhEQfqumt-SXtMVC4P-FTpnbqNAOUSAIReRkkThnRoxCpExsmV9vreXC_l-3eDVaal6ne6-yHsU20OldBqkpwkMAZsPa0a17htq2iZgIp75hHc1Mn6-AMcIsvH-fcJajAPf0rL67nlmbwJEaPiPlSoEeqK7xa0dy5p8YuyyfXDJarfCtlHhnvo95UDYBWD1Pr0XJFR5pBROdnphPWINs10U4Eqb-aqb-u6PPfsszk9pEPg',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.pets, color: AppColors.primary, size: 18.sp),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: AppTextStyles.bodySemiBold.copyWith(fontSize: 10.4.sp),
                      children: const [
                        TextSpan(text: 'Welcome to '),
                        TextSpan(text: 'SAWO', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w800)),
                        TextSpan(text: ','),
                      ],
                    ),
                  ),
                  Text(
                    'Admin',
                    style: AppTextStyles.title.copyWith(fontSize: 14.4.sp),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsPage(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Icon(Icons.notifications_outlined, color: AppColors.textDark, size: 16.sp),
                    ),
                    Positioned(
                      top: 6.h,
                      right: 6.w,
                      child: Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5.w),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                child: Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFE5E9EE),
                  ),
                  child: Icon(Icons.person, color: const Color(0xFF94A3B8), size: 18.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../dashboard/presentation/widgets/dashboard_header.dart';
import '../../../dashboard/presentation/widgets/dashboard_bottom_nav.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  static const Color _surface = Color(0xFFFCF9F4);
  static const Color _surfaceLow = Color(0xFFF6F3EE);
  static const Color _surfaceLowest = Color(0xFFFFFFFF);
  static const Color _surfaceHigh = Color(0xFFEBE8E3);
  static const Color _surfaceContainer = Color(0xFFF0EDE9);
  
  static const Color _primary = Color(0xFF80440F);
  static const Color _primaryContainer = Color(0xFF9E5B26);
  static const Color _primaryFixed = Color(0xFFFFDCC6);
  static const Color _primaryFixedDim = Color(0xFFFFB784);
  
  static const Color _secondary = Color(0xFF904C27);
  static const Color _secondaryFixed = Color(0xFFFFDBCC);
  
  static const Color _tertiary = Color(0xFF0049C2);
  static const Color _tertiaryFixed = Color(0xFFDBE1FF);
  
  static const Color _textMain = Color(0xFF1C1C19);
  static const Color _textVariant = Color(0xFF53443A);
  static const Color _outline = Color(0xFF867368);
  static const Color _border = Color(0xFFE5E2DD);

  int _selectedPeriod = 2; // 0: Today, 1: This Week, 2: This Month

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _surface,
      body: SafeArea(
        child: Column(
          children: [
            const DashboardHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTopHeader(),
                    _buildOverviewGrid(),
                    _buildContextCard(),
                    _buildDetailedRegisters(),
                    _buildActionButtons(),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const DashboardBottomNav(currentIndex: -1),
    );
  }

  Widget _buildTopHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reports', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: _textMain)),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: _surfaceHigh,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Text(
                      _selectedPeriod == 0 ? 'Today' : _selectedPeriod == 1 ? 'This Week' : 'This Month',
                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textMain),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.expand_more, size: 16, color: _primary),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: _surfaceLow,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                _buildPeriodToggle('Today', 0),
                _buildPeriodToggle('This Week', 1),
                _buildPeriodToggle('This Month', 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodToggle(String text, int index) {
    final isSelected = _selectedPeriod == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedPeriod = index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? _primaryContainer : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: isSelected ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))] : null,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : _textVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('OVERVIEW', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _textVariant, letterSpacing: 1.2)),
              Row(
                children: [
                  Container(width: 6.w, height: 6.h, decoration: BoxDecoration(color: _primary, shape: BoxShape.circle)),
                  SizedBox(width: 4.w),
                  Text('Live', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _primary)),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            childAspectRatio: 1.45,
            children: [
              _buildMetricCard(
                title: 'Patients',
                icon: Icons.pets,
                iconBg: _primaryFixed,
                iconColor: const Color(0xFF301400),
                value: '248',
                footerIcon: Icons.add_circle,
                footerText: '+4 intake',
                footerColor: _secondary,
              ),
              _buildMetricCard(
                title: 'Tasks',
                icon: Icons.task_alt,
                iconBg: _secondaryFixed,
                iconColor: const Color(0xFF351000),
                value: '624',
                footerIcon: Icons.verified,
                footerText: '94.2% schedule',
                footerColor: _tertiary,
              ),
              _buildMetricCard(
                title: 'Avg. Cycle',
                icon: Icons.timelapse,
                iconBg: _surfaceContainer,
                iconColor: _textVariant,
                value: '2.4',
                valueSuffix: 'days',
                footerText: '',
                footerColor: _textVariant,
              ),
              _buildMetricCard(
                title: 'Staff',
                icon: Icons.badge,
                iconBg: _tertiaryFixed,
                iconColor: const Color(0xFF00174B),
                value: '28',
                valueSuffix: '/ 32',
                footerIcon: Icons.groups,
                footerText: '87.5%',
                footerColor: _primary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String value,
    String? valueSuffix,
    IconData? footerIcon,
    required String footerText,
    required Color footerColor,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: _surfaceLowest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: _border),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _textVariant)),
              Container(
                width: 28.w,
                height: 28.h,
                decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
                child: Icon(icon, size: 16, color: iconColor),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(value, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: _textMain)),
                  if (valueSuffix != null) ...[
                    SizedBox(width: 4.w),
                    Text(valueSuffix, style: TextStyle(fontSize: 10.sp, color: _textVariant)),
                  ],
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  if (footerIcon != null) ...[
                    Icon(footerIcon, size: 14, color: footerColor),
                    SizedBox(width: 4.w),
                  ],
                  if (footerText.isNotEmpty)
                    Expanded(
                      child: Text(
                        footerText,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: footerIcon != null ? footerColor : _textVariant,
                          fontWeight: footerIcon != null ? FontWeight.bold : FontWeight.normal,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContextCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: _surfaceLowest,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: _border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                color: _surfaceHigh,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.pets, color: _outline, size: 28),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.medical_information, size: 14, color: _primary),
                      SizedBox(width: 4.w),
                      Text('HEALTH INDEX', style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: _primary)),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text('98.1% Stability', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailedRegisters() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('REGISTERS', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _textVariant, letterSpacing: 1.2)),
              Text('5 Logs', style: TextStyle(fontSize: 11.sp, color: _textVariant)),
            ],
          ),
          SizedBox(height: 12.h),
          _buildPatientReportCard(),
          SizedBox(height: 12.h),
          _buildReportCard(
            title: 'Task Report',
            subtitle: '',
            icon: Icons.checklist,
            iconBg: _secondaryFixed,
            iconColor: const Color(0xFF351000),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(color: _surfaceLow, borderRadius: BorderRadius.circular(12.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatusDot('624 completed', _primary),
                  Text('•', style: TextStyle(color: _textVariant)),
                  _buildStatusDot('18 pending', _secondary),
                  Text('•', style: TextStyle(color: _textVariant)),
                  _buildStatusDot('7 in progress', _tertiary),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
          _buildReportCard(
            title: 'Employee Report',
            subtitle: '',
            icon: Icons.group_work,
            iconBg: _tertiaryFixed,
            iconColor: const Color(0xFF00174B),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(color: _surfaceLow, borderRadius: BorderRadius.circular(12.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('32 registered', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textMain)),
                  Text('•', style: TextStyle(color: _textVariant)),
                  Text('28 on duty', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _primary)),
                  Text('•', style: TextStyle(color: _textVariant)),
                  Text('96.4% attendance', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textVariant)),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
          _buildSimpleReportCard(
            title: 'Attendance Report',
            subtitle: '',
            icon: Icons.fingerprint,
            iconBg: _surfaceHigh,
            iconColor: _textVariant,
            footerIcon: Icons.check_circle,
            footerIconColor: _tertiary,
            footerText: 'Morning Shift Handover Complete',
            footerTextColor: _textVariant,
          ),
          SizedBox(height: 12.h),
          _buildSimpleReportCard(
            title: 'Finance Report',
            subtitle: '',
            icon: Icons.receipt_long,
            iconBg: _primaryFixedDim,
            iconColor: const Color(0xFF703702),
            footerIcon: Icons.pie_chart,
            footerIconColor: _secondary,
            footerText: '92.4% Budget Burn Adherence',
            footerTextColor: _secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusDot(String text, Color color) {
    return Row(
      children: [
        Container(width: 8.w, height: 8.h, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        SizedBox(width: 6.w),
        Text(text, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textMain)),
      ],
    );
  }

  Widget _buildPatientReportCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: _surfaceLowest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: _border),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(color: _primaryFixed, borderRadius: BorderRadius.circular(12.r)),
                child: Icon(Icons.monitor_heart, size: 20, color: Color(0xFF301400)),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Patient Report', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('248 Total', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _textMain)),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            height: 10.h,
            decoration: BoxDecoration(color: _surfaceHigh, borderRadius: BorderRadius.circular(5.r)),
            child: Row(
              children: [
                Expanded(flex: 145, child: Container(decoration: BoxDecoration(color: Color(0xFFD96B27), borderRadius: BorderRadius.horizontal(left: Radius.circular(5.r))))),
                Expanded(flex: 379, child: Container(color: Color(0xFF2563EB))),
                Expanded(flex: 44, child: Container(color: Color(0xFFE11D48))),
                Expanded(flex: 290, child: Container(color: Color(0xFF059669))),
                Expanded(flex: 141, child: Container(decoration: BoxDecoration(color: Color(0xFF78716C), borderRadius: BorderRadius.horizontal(right: Radius.circular(5.r))))),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildPatientStatusPill('Assess: 36 (14.5%)', const Color(0xFFFFF4ED), const Color(0xFFD96B27)),
              _buildPatientStatusPill('Treat: 94 (37.9%)', const Color(0xFFEFF6FF), const Color(0xFF2563EB)),
              _buildPatientStatusPill('Surg: 11 (4.4%)', const Color(0xFFFFF1F2), const Color(0xFFE11D48)),
              _buildPatientStatusPill('Recov: 72 (29.0%)', const Color(0xFFECFDF5), const Color(0xFF059669)),
              _buildPatientStatusPill('Closed: 35 (14.1%)', const Color(0xFFF5F5F4), const Color(0xFF78716C)),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('View Report', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _primary)),
              SizedBox(width: 4.w),
              Icon(Icons.arrow_forward, size: 18, color: _primary),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPatientStatusPill(String text, Color bg, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 6.w, height: 6.h, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          SizedBox(width: 4.w),
          Text(text, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _buildReportCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required Widget child,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: _surfaceLowest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: _border),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(12.r)),
                child: Icon(icon, size: 20, color: iconColor),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain)),
                    if (subtitle.isNotEmpty) Text(subtitle, style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          child,
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('View Report', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _primary)),
              SizedBox(width: 4.w),
              Icon(Icons.arrow_forward, size: 18, color: _primary),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleReportCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required IconData footerIcon,
    required Color footerIconColor,
    required String footerText,
    required Color footerTextColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: _surfaceLowest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: _border),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(12.r)),
                child: Icon(icon, size: 20, color: iconColor),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain)),
                    if (subtitle.isNotEmpty) Text(subtitle, style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(footerIcon, size: 16, color: footerIconColor),
                  SizedBox(width: 4.w),
                  Text(footerText, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: footerTextColor)),
                ],
              ),
              Row(
                children: [
                  Text('View Report', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _primary)),
                  SizedBox(width: 4.w),
                  Icon(Icons.arrow_forward, size: 18, color: _primary),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: _primaryContainer,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
              minimumSize: const Size(double.infinity, 56),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.picture_as_pdf, size: 22),
                SizedBox(width: 8.w),
                Text('Export Executive Summary (PDF)', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: _surfaceHigh,
              foregroundColor: _textMain,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
              minimumSize: const Size(double.infinity, 48),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.schedule_send, size: 20, color: _primary),
                SizedBox(width: 8.w),
                Text('Schedule Automated Weekly Digest', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
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
  static const Color _secondaryContainer = Color(0xFFFFA67A);
  static const Color _secondaryFixed = Color(0xFFFFDBCC);
  
  static const Color _tertiary = Color(0xFF0049C2);
  static const Color _tertiaryFixed = Color(0xFFDBE1FF);
  
  static const Color _error = Color(0xFFBA1A1A);
  static const Color _errorContainer = Color(0xFFFFDAD6);
  
  static const Color _textMain = Color(0xFF1C1C19);
  static const Color _textVariant = Color(0xFF53443A);
  static const Color _outline = Color(0xFF867368);
  static const Color _border = Color(0xFFE5E2DD);

  int _selectedFilter = 0; // 0: All, 1: Unread
  bool _allRead = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _surface,
      appBar: AppBar(
        backgroundColor: _surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: _textMain),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Notifications', style: TextStyle(color: _textMain, fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: _primary,
              child: const Icon(Icons.person, size: 20, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBanner(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    if (!_allRead || _selectedFilter == 0) ...[
                _buildPriorityCard(),
                _buildActivityStreamHeader(),
                _buildNotificationItem(
                  icon: Icons.pets,
                  iconBg: _tertiaryFixed,
                  iconColor: const Color(0xFF00174B),
                  title: 'New Patient: Bella',
                  time: '10 min ago',
                  isUnread: !_allRead,
                  description: 'Intake finalized. Baseline triage ready.',
                  footerIcon: Icons.emergency,
                  footerText: 'Field Intake',
                  footerActionText: 'View Record',
                  footerActionIcon: Icons.arrow_forward,
                ),
                _buildNotificationItem(
                  icon: Icons.medication,
                  iconBg: _secondaryFixed,
                  iconColor: const Color(0xFF351000),
                  title: 'Medicine Plan: Bella',
                  time: '25 min ago',
                  isUnread: !_allRead,
                  description: 'Antibiotic regime submitted for Cage B-04.',
                  footerText: '',
                  footerBadge: 'Action Required',
                  footerActionText: 'Review & Sign-Off',
                  footerActionIcon: Icons.draw,
                  isActionPrimary: true,
                ),
                _buildVisualContextCard(),
                _buildNotificationItem(
                  icon: Icons.grid_view,
                  iconBg: _surfaceHigh,
                  iconColor: _primaryContainer,
                  title: 'Cage B-04 Allocated',
                  time: '1 hour ago',
                  isUnread: false,
                  description: 'Sanitation verified. Ready for occupancy.',
                  footerIcon: Icons.check_circle,
                  footerText: 'Sanitation Complete',
                  footerActionText: 'Inspect',
                  footerActionIcon: Icons.visibility,
                ),
                _buildNotificationItem(
                  icon: Icons.cleaning_services,
                  iconBg: _primaryFixed,
                  iconColor: const Color(0xFF703702),
                  title: 'Housekeeping Verification',
                  time: '2 hours ago',
                  isUnread: false,
                  description: 'Before/After proof submitted for Cage B-04.',
                  footerAvatar: 'RP',
                  footerText: 'R. Patil',
                  footerActionText: 'View Proof',
                  footerActionIcon: Icons.image,
                ),
                _buildNotificationItem(
                  icon: Icons.emergency,
                  iconBg: _errorContainer,
                  iconColor: const Color(0xFF93000A),
                  title: 'Ambulance En Route',
                  time: '3 hours ago',
                  isUnread: false,
                  description: 'ETA 7 minutes to sanctuary Gate 1.',
                  footerIcon: Icons.near_me,
                  footerText: 'Speed: 38 km/h',
                  footerActionText: 'Telemetry',
                  footerActionIcon: Icons.navigation,
                ),
              ] else ...[
                _buildEmptyState(),
              ],
              const SizedBox(height: 32),
              const Text('SAWO Automated Dispatch • Encrypted Protocol', style: TextStyle(fontSize: 11, color: _outline)),
              const SizedBox(height: 32),
              const SizedBox(height: 32),
            ],
          ),
        ),
        ),
        ],
        ),
      ),
    );
  }

  Widget _buildTopBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Notifications', style: TextStyle(fontSize: 19.2.sp, fontWeight: FontWeight.bold, color: _textMain)),
                    Text('Real-Time System & Workflow Alerts', style: TextStyle(fontSize: 10.4.sp, color: _textVariant)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _allRead = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: _surfaceHigh,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.done_all, size: 14.sp, color: _primary),
                      SizedBox(width: 4.w),
                      Text('Mark All as Read', style: TextStyle(fontSize: 10.4.sp, fontWeight: FontWeight.bold, color: _primary)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: _surfaceHigh,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Row(
              children: [
                _buildFilterTab('All', 0, 18),
                _buildFilterTab('Unread', 1, _allRead ? 0 : 5),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String text, int index, int count) {
    final isSelected = _selectedFilter == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedFilter = index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          decoration: BoxDecoration(
            color: isSelected ? _surfaceLowest : Colors.transparent,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: isSelected ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))] : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 11.2.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? _primary : _textVariant,
                ),
              ),
              SizedBox(width: 6.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: isSelected ? _surfaceContainer : _secondaryContainer,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? _textVariant : const Color(0xFF783916),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriorityCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: _surfaceLowest,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: _border),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(width: 6.w, height: 6.w, decoration: const BoxDecoration(color: _primary, shape: BoxShape.circle)),
                      SizedBox(width: 6.w),
                      Expanded(child: Text('PRIORITY SIGN-OFF REQUIRED', style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: _primary, letterSpacing: 1.0), maxLines: 1, overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(color: _secondaryContainer, borderRadius: BorderRadius.circular(12.r)),
                  child: Text('Pending Approval', style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: const Color(0xFF783916))),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: BoxDecoration(
                    color: _primaryFixed,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(Icons.pets, color: _primary, size: 18.sp),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Bella', style: TextStyle(fontSize: 14.4.sp, fontWeight: FontWeight.bold, color: _textMain)),
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                            decoration: BoxDecoration(color: _surfaceHigh, borderRadius: BorderRadius.circular(4.r)),
                            child: Text('Canine', style: TextStyle(fontSize: 9.6.sp, color: _textVariant)),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(Icons.person, size: 12.sp, color: _primary),
                          SizedBox(width: 4.w),
                          Text('Dr. Gandhi', style: TextStyle(fontSize: 10.4.sp, color: _textVariant)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(color: _surfaceLow, borderRadius: BorderRadius.circular(12.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.medication_liquid, size: 14.sp, color: _primary),
                      SizedBox(width: 6.w),
                      Text('Amoxicillin Plan', style: TextStyle(fontSize: 11.2.sp, fontWeight: FontWeight.bold, color: _textMain)),
                    ],
                  ),
                  Text('Cage B-04', style: TextStyle(fontSize: 10.4.sp, fontWeight: FontWeight.w600, color: _textVariant)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.verified, size: 14.sp),
                        SizedBox(width: 6.w),
                        Text('Review Plan Now', style: TextStyle(fontSize: 11.2.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: BoxDecoration(color: _surfaceContainer, borderRadius: BorderRadius.circular(10.r)),
                  child: Icon(Icons.more_vert, color: _textVariant, size: 18.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityStreamHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('ACTIVITY STREAM', style: TextStyle(fontSize: 9.6.sp, fontWeight: FontWeight.bold, color: _textVariant, letterSpacing: 1.2)),
          Text('Updated just now', style: TextStyle(fontSize: 9.6.sp, color: _outline)),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String time,
    required bool isUnread,
    required String description,
    IconData? footerIcon,
    String? footerAvatar,
    required String footerText,
    String? footerBadge,
    required String footerActionText,
    required IconData footerActionIcon,
    bool isActionPrimary = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isUnread ? _surfaceLowest : _surfaceLow,
          borderRadius: BorderRadius.circular(16.r),
          border: isUnread ? Border.all(color: _border) : null,
          boxShadow: isUnread ? [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))] : null,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(10.r)),
                  child: Icon(icon, size: 16.sp, color: iconColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(title, style: TextStyle(fontSize: 12.8.sp, fontWeight: FontWeight.bold, color: _textMain), maxLines: 1, overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(width: 8.w),
                          Row(
                            children: [
                              if (isUnread) ...[
                                Container(width: 6.w, height: 6.w, decoration: const BoxDecoration(color: _secondary, shape: BoxShape.circle)),
                                SizedBox(width: 4.w),
                              ],
                              Text(time, style: TextStyle(fontSize: 9.6.sp, color: _outline)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(description, style: TextStyle(fontSize: 11.2.sp, color: _textVariant)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (footerBadge != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(color: _secondaryContainer, borderRadius: BorderRadius.circular(12.r)),
                    child: Text(footerBadge, style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: const Color(0xFF783916))),
                  )
                else if (footerIcon != null)
                  Expanded(
                    child: Row(
                      children: [
                        Icon(footerIcon, size: 14.sp, color: _tertiary),
                        SizedBox(width: 4.w),
                        Expanded(child: Text(footerText, style: TextStyle(fontSize: 9.6.sp, fontWeight: FontWeight.bold, color: _textVariant), maxLines: 1, overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  )
                else if (footerAvatar != null)
                  Expanded(
                    child: Row(
                      children: [
                        CircleAvatar(radius: 8.r, backgroundColor: const Color(0xFFE5E2DD), child: Text(footerAvatar, style: TextStyle(fontSize: 8.sp, color: _textVariant, fontWeight: FontWeight.bold))),
                        SizedBox(width: 4.w),
                        Expanded(child: Text(footerText, style: TextStyle(fontSize: 9.6.sp, fontWeight: FontWeight.bold, color: _textVariant), maxLines: 1, overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  )
                else
                  const SizedBox(),
                
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: isActionPrimary ? _primary : _surfaceContainer,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isActionPrimary) ...[
                        Icon(footerActionIcon, size: 14.sp, color: Colors.white),
                        SizedBox(width: 4.w),
                      ],
                      Text(footerActionText, style: TextStyle(fontSize: 9.6.sp, fontWeight: FontWeight.bold, color: isActionPrimary ? Colors.white : _primary)),
                      if (!isActionPrimary) ...[
                        SizedBox(width: 4.w),
                        Icon(footerActionIcon, size: 14.sp, color: _primary),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisualContextCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _surfaceLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _border),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.satellite_alt, size: 16.sp, color: _primary),
                      SizedBox(width: 8.w),
                      Expanded(child: Text('Field Camera & Telemetry Digest', style: TextStyle(fontSize: 11.2.sp, fontWeight: FontWeight.bold, color: _textMain), maxLines: 1, overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Text('Sector North', style: TextStyle(fontSize: 9.6.sp, color: _outline)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCY76JJh5w_is_yPhbIbNP8mDJvhtre6KG71Dlht-sf9jUkcplIkzpqS4rdK-rPcwftOBSyav9-7pB0_-uuYSC_9frdzolC3DbPGYvZDQCMPv4extKXugXgA57ht3Bfrv1EhugrOx8i90mlB7iGQxrYJeG1sc5GhBAMjlC551_eaWXQy4q5eiQdW6ev3j4e9goWYeWs6lwBQPh5iIuqo6XFJ8TpgI39JU7IoelU3n60DzqUqhN5O6Yu'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(4)),
                            child: const Text('Gate 1 Arrival', style: TextStyle(fontSize: 10, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBysZU0tDZIZ6ZVZPN4oTyLj9J6yhimfr1H78w2qusNAUxXP2KeUJWBQsKr-Dvfl1lI1aMA3aEvIiTJVhLY-D_PFoFdZff7-CWPTBSqX657oldSl4ZdpoCk7OtLiRUeG6P9IVCQr2VvMRmwsPFP0hCBtry4-JV1DxPUggdUcDTnSg2gTLzKf18oFz5K-pq41CCSAvQePTP-jKT1SGo_IM7iKOaf_lxgM1D87eZNetPR1Aq3mbsLkCOP'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(4)),
                            child: const Text('Cage B-04 Prep', style: TextStyle(fontSize: 10, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: _surfaceHigh, shape: BoxShape.circle),
            child: const Icon(Icons.task_alt, size: 26, color: _primary),
          ),
          const SizedBox(height: 16),
          const Text("You're All Caught Up", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _textMain)),
          const SizedBox(height: 8),
          const Text(
            'No pending super admin verifications or critical animal welfare escalations.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: _textVariant),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../dashboard/presentation/widgets/dashboard_header.dart';
import '../../../dashboard/presentation/widgets/dashboard_bottom_nav.dart';
import '../../../patients/presentation/widgets/patient_search_bar.dart';

class DietKitchenPage extends StatefulWidget {
  const DietKitchenPage({super.key});

  @override
  State<DietKitchenPage> createState() => _DietKitchenPageState();
}

class _DietKitchenPageState extends State<DietKitchenPage> {
  bool _isSearchVisible = false;
  int _selectedTab = 0;
  bool _isApproved = false;

  bool _isBellaExpanded = true;
  bool _isBrunoExpanded = false;
  bool _isMiloExpanded = false;

  final List<String> _tabs = [
    'All (68)',
    'Pending Approval (8)',
    'Medicine (42)',
    'Diet Plans (26)'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F7),
      bottomNavigationBar: const DashboardBottomNav(currentIndex: 4),
      body: SafeArea(
        child: Column(
          children: [
            const DashboardHeader(),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        _buildSubHeader(),
                        if (_isSearchVisible) ...[
                          SizedBox(height: 12.h),
                          const PatientSearchBar(hintText: 'Search patient, cage, drug...'),
                        ],
                        SizedBox(height: 16.h),
                        _buildSummaryRow(),
                        SizedBox(height: 16.h),
                        _buildFilterTabs(),
                        SizedBox(height: 16.h),
                        _buildBellaCard(),
                        SizedBox(height: 12.h),
                        _buildBrunoCard(),
                        SizedBox(height: 12.h),
                        _buildMiloCard(),
                        SizedBox(height: 32.h),
                      ]),
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

  Widget _buildSubHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Medicine & Diet',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF17211F),
                ),
              ),
              Text(
                'Clinical Prescriptions & Feeding Regimes',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: const Color(0xFF66736F),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isSearchVisible = !_isSearchVisible;
                });
              },
              child: Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0EDE9),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(Icons.search, size: 16.sp, color: const Color(0xFF66736F)),
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF0EDE9),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(Icons.tune, size: 16.sp, color: const Color(0xFF66736F)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryRow() {
    return Row(
      children: [
        Expanded(
          child: _buildMetricCard(
            title: 'PENDING',
            count: '8',
            bgColor: const Color(0xFFFEE2D5), // Matches Dashboard "Pending Tasks"
            blobColor: const Color(0xFFFCDB0D),
            textColor: const Color(0xFF991B1B),
            hasPulse: true,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildMetricCard(
            title: 'APPROVED',
            count: '24',
            bgColor: const Color(0xFF6EE7B7), // Matches Dashboard "Completed"
            blobColor: const Color(0xFF34D399),
            textColor: const Color(0xFF064E3B),
            iconRight: Icons.verified,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildMetricCard(
            title: 'ACTIVE',
            count: '36',
            bgColor: const Color(0xFFE8EDFC), // Matches Dashboard "Total Tasks"
            blobColor: const Color(0xFFD9E3F8),
            textColor: const Color(0xFF1E293B),
            iconRight: Icons.timer,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String count,
    required Color bgColor,
    required Color blobColor,
    required Color textColor,
    bool hasPulse = false,
    IconData? iconRight,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: Stack(
          children: [
            // Decorative background blob
            Positioned(
              right: -16.w,
              bottom: -20.h,
              child: Container(
                width: 70.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: blobColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
            ),
            // Card Content
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title.toUpperCase(), style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: textColor, letterSpacing: 0.5)),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(count, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: textColor, height: 1)),
                      SizedBox(width: 4.w),
                      if (hasPulse)
                        Container(width: 6.w, height: 6.w, decoration: BoxDecoration(color: textColor, shape: BoxShape.circle))
                      else if (iconRight != null)
                        Icon(iconRight, size: 12.sp, color: textColor),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          final isSelected = _selectedTab == index;
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF9E5B26) : const Color(0xFFF0EDE9),
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: isSelected ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))] : null,
                ),
                child: Row(
                  children: [
                    if (isSelected && index == 1) ...[
                      Container(width: 4.w, height: 4.w, decoration: const BoxDecoration(color: Color(0xFFFFB784), shape: BoxShape.circle)),
                      SizedBox(width: 4.w),
                    ],
                    Text(
                      _tabs[index],
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                        color: isSelected ? Colors.white : const Color(0xFF53443A),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBellaCard() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isBellaExpanded = !_isBellaExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 36.w,
                        height: 36.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDDF3EE).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Icon(Icons.pets, color: AppColors.primary, size: 18.sp),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    'Bella',
                                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF17211F)),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                  decoration: BoxDecoration(color: const Color(0xFFDDF3EE), borderRadius: BorderRadius.circular(10.r)),
                                  child: Text('Cage B-04', style: TextStyle(fontSize: 8.sp, color: AppColors.primary)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(color: const Color(0xFFFFF4ED), borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        children: [
                          Container(width: 4.w, height: 4.w, decoration: const BoxDecoration(color: Color(0xFFD96B27), shape: BoxShape.circle)),
                          SizedBox(width: 4.w),
                          Text('Pending Approval', style: TextStyle(fontSize: 8.sp, color: const Color(0xFFD96B27))),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      width: 24.w,
                      height: 24.w,
                      decoration: const BoxDecoration(color: Color(0xFFF6F8F7), shape: BoxShape.circle),
                      child: Icon(_isBellaExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 14.sp, color: const Color(0xFF66736F)),
                    ),
                  ],
                ),
              ],
            ),
            if (_isBellaExpanded) ...[
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(color: const Color(0xFFF6F8F7), borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.medication, size: 14.sp, color: AppColors.primary),
                        SizedBox(width: 4.w),
                        Icon(Icons.restaurant, size: 14.sp, color: const Color(0xFF904C27)),
                        SizedBox(width: 6.w),
                        Text('Med & Diet Plan', style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: const Color(0xFF17211F))),
                      ],
                    ),
                    Flexible(
                      child: Text(
                        'Dr. Gandhi (Senior Vet)',
                        style: TextStyle(fontSize: 9.sp, color: const Color(0xFF66736F)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(color: const Color(0xFFF6F8F7).withOpacity(0.6), borderRadius: BorderRadius.circular(12.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Icons.assignment, size: 12.sp, color: AppColors.primary),
                              SizedBox(width: 4.w),
                              Flexible(
                                child: Text(
                                  '#MED-2026-89',
                                  style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: const Color(0xFF17211F)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  ' · Canis familiaris (14.2 kg)',
                                  style: TextStyle(fontSize: 9.sp, color: const Color(0xFF66736F)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text('04 Oct, 07:30 AM', style: TextStyle(fontSize: 8.sp, color: const Color(0xFF66736F))),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Icon(Icons.vaccines, size: 12.sp, color: AppColors.primary),
                        SizedBox(width: 4.w),
                        Text('MEDICINE SCHEDULE', style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold, color: AppColors.primary, letterSpacing: 0.5)),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    _buildMedItem('Anti-inflammatory Oral Suspension', '08:00 AM'),
                    SizedBox(height: 6.h),
                    _buildMedItem('Broad Spectrum Antibiotic (Cephalexin)', '02:00 PM'),
                    
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Icon(Icons.restaurant_menu, size: 12.sp, color: const Color(0xFF904C27)),
                        SizedBox(width: 4.w),
                        Text('DIETARY REGIME', style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold, color: const Color(0xFF904C27), letterSpacing: 0.5)),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 1))]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text('Soft High-Protein Recovery Mash', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: const Color(0xFF17211F))),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                            decoration: BoxDecoration(color: const Color(0xFFF6F8F7), borderRadius: BorderRadius.circular(6.r)),
                            child: Row(
                              children: [
                                Icon(Icons.schedule, size: 10.sp, color: const Color(0xFF904C27)),
                                SizedBox(width: 4.w),
                                Text('08:00 AM & 06:00 PM', style: TextStyle(fontSize: 8.sp, color: const Color(0xFF17211F))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Text('WORKFLOW VERIFICATION CHAIN', style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold, color: const Color(0xFF66736F), letterSpacing: 0.5)),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildWorkflowStep('Plan Created', true, isCurrent: false),
                  _buildWorkflowStep('Vet Submitted', true, isCurrent: false),
                  _buildWorkflowStep('Super Admin', false, isCurrent: true),
                  _buildWorkflowStep('Dispatch', false, isCurrent: false, isPending: true),
                ],
              ),
              SizedBox(height: 12.h),
              if (!_isApproved) ...[
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isApproved = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9E5B26),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        minimumSize: Size(double.infinity, 40.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle, size: 16.sp),
                          SizedBox(width: 6.w),
                          Text('Approve & Notify Staff', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFFFDAD6),
                        foregroundColor: const Color(0xFF93000A),
                        minimumSize: Size(double.infinity, 36.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.rule, size: 14.sp),
                          SizedBox(width: 6.w),
                          Text('Reject / Request Revision', style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                )
              ] else ...[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(color: const Color(0xFFECFDF5), borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    children: [
                      Icon(Icons.task_alt, size: 28.sp, color: const Color(0xFF059669)),
                      SizedBox(height: 6.h),
                      Text('Plan #MED-2026-89 Approved!', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: const Color(0xFF065F46))),
                    ],
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMedItem(String title, String time) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 1))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(title, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: const Color(0xFF17211F))),
          ),
          SizedBox(width: 8.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
            decoration: BoxDecoration(color: const Color(0xFFF6F8F7), borderRadius: BorderRadius.circular(6.r)),
            child: Row(
              children: [
                Icon(Icons.alarm, size: 10.sp, color: AppColors.primary),
                SizedBox(width: 4.w),
                Text(time, style: TextStyle(fontSize: 8.sp, color: const Color(0xFF17211F))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkflowStep(String title, bool isDone, {bool isCurrent = false, bool isPending = false}) {
    Color iconBgColor = const Color(0xFFECFDF5);
    Color iconColor = const Color(0xFF059669);
    IconData icon = Icons.done;

    if (isCurrent) {
      iconBgColor = AppColors.primary;
      iconColor = Colors.white;
      icon = Icons.verified_user;
    } else if (isPending) {
      iconBgColor = const Color(0xFFE5E2DD);
      iconColor = const Color(0xFF66736F);
      icon = Icons.send;
    }

    return Opacity(
      opacity: isPending ? 0.4 : 1.0,
      child: Column(
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            margin: EdgeInsets.only(bottom: 4.h),
            decoration: BoxDecoration(color: iconBgColor, shape: BoxShape.circle),
            child: Icon(icon, size: 12.sp, color: iconColor),
          ),
          Text(title, style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold, color: isCurrent ? AppColors.primary : const Color(0xFF17211F))),
        ],
      ),
    );
  }

  Widget _buildBrunoCard() {
    return _buildCompactCard(
      name: 'Bruno',
      location: 'OT-1',
      descIcon: Icons.medication,
      descText: 'Post-Op Antibiotics Protocol',
      icon: Icons.healing,
      iconColor: const Color(0xFF2E7D32),
      iconBgColor: const Color(0xFFE8F5E9),
      badgeText: 'Approved',
      badgeIcon: Icons.done,
      badgeColor: const Color(0xFF059669),
      badgeBgColor: const Color(0xFFECFDF5),
      isExpanded: _isBrunoExpanded,
      onTap: () { setState(() => _isBrunoExpanded = !_isBrunoExpanded); },
      expandedContent: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(Icons.vaccines, size: 12.sp, color: AppColors.primary),
              SizedBox(width: 4.w),
              Text('MEDICINE SCHEDULE', style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold, color: AppColors.primary, letterSpacing: 0.5)),
            ],
          ),
          SizedBox(height: 6.h),
          _buildMedItem('Amoxicillin (500mg)', '09:00 AM'),
          SizedBox(height: 6.h),
          _buildMedItem('Pain Relief (Meloxicam)', '09:00 PM'),
          SizedBox(height: 12.h),
          Text('WORKFLOW VERIFICATION CHAIN', style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold, color: const Color(0xFF66736F), letterSpacing: 0.5)),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildWorkflowStep('Plan Created', true, isCurrent: false),
              _buildWorkflowStep('Vet Submitted', true, isCurrent: false),
              _buildWorkflowStep('Super Admin', true, isCurrent: false),
              _buildWorkflowStep('Dispatch', false, isCurrent: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiloCard() {
    return _buildCompactCard(
      name: 'Milo',
      location: 'Cage B-02',
      descIcon: Icons.restaurant_menu,
      descText: 'Renal Care Recovery Mash',
      icon: Icons.set_meal,
      iconColor: const Color(0xFF0049C2),
      iconBgColor: const Color(0xFFDBE1FF).withOpacity(0.5),
      badgeText: 'Active',
      badgeDot: true,
      badgeColor: const Color(0xFF2563EB),
      badgeBgColor: const Color(0xFFEFF6FF),
      isExpanded: _isMiloExpanded,
      onTap: () { setState(() => _isMiloExpanded = !_isMiloExpanded); },
      expandedContent: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(Icons.restaurant_menu, size: 12.sp, color: const Color(0xFF904C27)),
              SizedBox(width: 4.w),
              Text('DIETARY REGIME', style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold, color: const Color(0xFF904C27), letterSpacing: 0.5)),
            ],
          ),
          SizedBox(height: 6.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 1))]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text('Renal Care Recovery Mash', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: const Color(0xFF17211F))),
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                  decoration: BoxDecoration(color: const Color(0xFFF6F8F7), borderRadius: BorderRadius.circular(6.r)),
                  child: Row(
                    children: [
                      Icon(Icons.schedule, size: 10.sp, color: const Color(0xFF904C27)),
                      SizedBox(width: 4.w),
                      Text('07:00 AM & 05:00 PM', style: TextStyle(fontSize: 8.sp, color: const Color(0xFF17211F))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Text('WORKFLOW VERIFICATION CHAIN', style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold, color: const Color(0xFF66736F), letterSpacing: 0.5)),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildWorkflowStep('Plan Created', true, isCurrent: false),
              _buildWorkflowStep('Vet Submitted', true, isCurrent: false),
              _buildWorkflowStep('Super Admin', true, isCurrent: false),
              _buildWorkflowStep('Dispatch', true, isCurrent: false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompactCard({
    required String name,
    required String location,
    required IconData descIcon,
    required String descText,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String badgeText,
    IconData? badgeIcon,
    bool badgeDot = false,
    required Color badgeColor,
    required Color badgeBgColor,
    bool isExpanded = false,
    VoidCallback? onTap,
    Widget? expandedContent,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 36.w,
                        height: 36.w,
                        decoration: BoxDecoration(color: iconBgColor, borderRadius: BorderRadius.circular(10.r)),
                        child: Icon(icon, color: iconColor, size: 18.sp),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Flexible(child: Text(name, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF17211F)), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                SizedBox(width: 6.w),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                  decoration: BoxDecoration(color: const Color(0xFFF6F8F7), borderRadius: BorderRadius.circular(10.r)),
                                  child: Text(location, style: TextStyle(fontSize: 8.sp, color: const Color(0xFF66736F))),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                Icon(descIcon, size: 12.sp, color: AppColors.primary),
                                SizedBox(width: 4.w),
                                Expanded(child: Text(descText, style: TextStyle(fontSize: 10.sp, color: const Color(0xFF17211F)), maxLines: 1, overflow: TextOverflow.ellipsis)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(color: badgeBgColor, borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        children: [
                          if (badgeIcon != null) ...[
                            Icon(badgeIcon, size: 10.sp, color: badgeColor),
                            SizedBox(width: 4.w),
                          ] else if (badgeDot) ...[
                            Container(width: 4.w, height: 4.w, decoration: BoxDecoration(color: badgeColor, shape: BoxShape.circle)),
                            SizedBox(width: 4.w),
                          ],
                          Text(badgeText, style: TextStyle(fontSize: 8.sp, color: badgeColor)),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      width: 24.w,
                      height: 24.w,
                      decoration: const BoxDecoration(color: Color(0xFFF6F8F7), shape: BoxShape.circle),
                      child: Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 14.sp, color: const Color(0xFF66736F)),
                    ),
                  ],
                ),
              ],
            ),
            if (isExpanded && expandedContent != null) ...[
              SizedBox(height: 12.h),
              expandedContent,
            ],
          ],
        ),
      ),
    );
  }
}

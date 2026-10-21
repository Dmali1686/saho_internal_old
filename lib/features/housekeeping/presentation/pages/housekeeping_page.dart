import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../dashboard/presentation/widgets/dashboard_bottom_nav.dart';
import '../../../dashboard/presentation/widgets/dashboard_header.dart';

class HousekeepingPage extends StatefulWidget {
  const HousekeepingPage({Key? key}) : super(key: key);

  @override
  State<HousekeepingPage> createState() => _HousekeepingPageState();
}

class _HousekeepingPageState extends State<HousekeepingPage> {
  int _selectedTab = 0;
  String? _expandedTaskId = 'B-04';
  bool _isVerified = false;

  static const Color _primary = Color(0xFF176B5B);
  static const Color _bg = Color(0xFFF6F8F7);
  static const Color _textMain = Color(0xFF17211F);
  static const Color _textVariant = Color(0xFF66736F);
  static const Color _primaryLight = Color(0xFFDDF3EE);
  static const Color _border = Color(0xFFE3E9E7);

  final List<String> _tabs = [
    'All (13)',
    'Verification (4)',
    'In Progress (3)',
    'Pending (6)'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DashboardHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(),
                    _buildMetricsCards(),
                    _buildTabs(),
                    _buildSectionTitle(),
                    _buildTaskList(),
                    SizedBox(height: 100.h), // padding for bottom nav
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const DashboardBottomNav(currentIndex: 3),
      floatingActionButton: _isVerified ? _buildToast() : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }



  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                        color: Color(0xFF904C27), shape: BoxShape.circle),
                  ),
                  SizedBox(width: 6.w),
                  Text('Housekeeping',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: _textMain)),
                ],
              ),
              SizedBox(height: 2.h),
              Text('Enclosure Sanitation & Audit',
                  style: TextStyle(fontSize: 12.sp, color: _textVariant)),
            ],
          ),
          Row(
            children: [
              _buildIconButton(Icons.search),
              SizedBox(width: 8.w),
              _buildIconButton(Icons.tune),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: Colors.white, shape: BoxShape.circle),
      child: Icon(icon, size: 20, color: _textVariant),
    );
  }

  Widget _buildMetricsCards() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
              child: _buildMetricCard(
                  'PENDING', '6', 'wards', const Color(0xFFFFA67A))),
          SizedBox(width: 8.w),
          Expanded(
              child: _buildMetricCard(
                  'IN PROG.', '3', 'active', const Color(0xFF0049C2),
                  titleColor: const Color(0xFF0049C2))),
          SizedBox(width: 8.w),
          Expanded(child: _buildReviewMetricCard()),
        ],
      ),
    );
  }

  Widget _buildMetricCard(
      String title, String count, String subtitle, Color dotColor,
      {Color? titleColor}) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: _border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: titleColor ?? _textVariant)),
              Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                      color: dotColor, shape: BoxShape.circle)),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(count,
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: _textMain)),
              SizedBox(width: 4.w),
              Text(subtitle,
                  style: TextStyle(fontSize: 12.sp, color: _textVariant)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReviewMetricCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: _primaryLight,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: _primaryLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('REVIEW',
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: _primary)),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      width: 10.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                          color: _primary.withOpacity(0.4),
                          shape: BoxShape.circle)),
                  Container(
                      width: 6.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          color: _primary, shape: BoxShape.circle)),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('4',
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: _primary)),
              SizedBox(width: 4.w),
              Text('need sign',
                  style: TextStyle(fontSize: 11.sp, color: _primary)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _tabs.asMap().entries.map((entry) {
            final idx = entry.key;
            final label = entry.value;
            final isSelected = idx == _selectedTab;
            return GestureDetector(
              onTap: () => setState(() => _selectedTab = idx),
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isSelected ? _primary : Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: isSelected ? null : Border.all(color: _border),
                ),
                child: Row(
                  children: [
                    Text(
                      label.split(' ')[0],
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : _textVariant,
                      ),
                    ),
                    if (isSelected && idx == 1) ...[
                      SizedBox(width: 6.w),
                      Container(
                        width: 16.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                            child: Text('4',
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: _primary))),
                      ),
                    ] else ...[
                      SizedBox(width: 4.w),
                      Text(
                        label.split(' ')[1],
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: isSelected ? Colors.white : _textVariant,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSectionTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('ENCLOSURE TASK QUEUE',
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: _textVariant)),
          Text('3 of 13 showing',
              style: TextStyle(fontSize: 11.sp, color: _textVariant)),
        ],
      ),
    );
  }

  Widget _buildTaskList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          _buildTaskCard(
              'B-04',
              'Cage B-04',
              'Canine Ward',
              'Patient: Bella (SAWO-2026-00417)',
              'Awaiting Verification',
              'Uploaded 10:42 AM',
              Icons.sanitizer,
              const Color(0xFF351000),
              const Color(0xFFFFDBCC),
              _buildDossier(
                  cageName: 'Cage B-04',
                  housekeeperName: 'R. Patil',
                  shift: 'Morning Shift',
                  protocols: ['Bio-Wash', 'Antiseptic Spray', 'Fresh Sterile Bedding', 'Water Refilled'],
                  beforeImage: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBpcP3EbAnzFU6OCLV59eXfwbwttVTKAaeXg9STnbblliZwqChl0uilZ3b8lWMqIOSlQAW-CKCpQeMmAnwNyhH3WrwgJyy6-IsLayc4Ko9KiT8QobX7pVAlh6LxHQwxnytyH9fWKvS58HqPvOiFWOdDH8eDMqcSJ6hR6giJiFYuYOfLNRLKl9ft6vEPQLZ7JapiRC5bORslGfGgXfsJryr5x7SUoWfRkzfqC_7qe8zpV0R6BLHSO71E',
                  afterImage: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAYaZTtooSFIJ-HbGVgf-4oAhW31GOBEeyYMafaHldNHlee29jWLtNxOqMyyCRMFz2sR68NtgGS2H8-iFVf7uoEN3brsBeFed-xWVcUd9gfqHTMRDtS9kZ1tXIYyLey4euZlWYJsmCxqpwJwSy-SBFQfDTpB64nrb_dIFpKKawB4BOe-GeDwMmYczB6y-o7DOFz6mXBrePGfWdbWhql-rsiafOM4-W0Pop9cGYPKZxzYh2gVzK6R_ca',
                  geotag: 'Sector B Kennel 04',
                  device: 'Terminal-04',
                  showVerification: true)),
          SizedBox(height: 10.h),
          _buildTaskCard(
              'B-07',
              'Cage B-07',
              'Feline Observation',
              'Patient: Luna · Tech: S. Kumar',
              'In Progress',
              'Started 10:15 AM (UV sweep active)',
              Icons.cleaning_services,
              const Color(0xFF0049C2),
              const Color(0xFFDBE1FF),
              _buildDossier(
                  cageName: 'Cage B-07',
                  housekeeperName: 'S. Kumar',
                  shift: 'Morning Shift',
                  protocols: ['UV Sweep', 'Deep Disinfect'],
                  beforeImage: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBpcP3EbAnzFU6OCLV59eXfwbwttVTKAaeXg9STnbblliZwqChl0uilZ3b8lWMqIOSlQAW-CKCpQeMmAnwNyhH3WrwgJyy6-IsLayc4Ko9KiT8QobX7pVAlh6LxHQwxnytyH9fWKvS58HqPvOiFWOdDH8eDMqcSJ6hR6giJiFYuYOfLNRLKl9ft6vEPQLZ7JapiRC5bORslGfGgXfsJryr5x7SUoWfRkzfqC_7qe8zpV0R6BLHSO71E',
                  afterImage: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAYaZTtooSFIJ-HbGVgf-4oAhW31GOBEeyYMafaHldNHlee29jWLtNxOqMyyCRMFz2sR68NtgGS2H8-iFVf7uoEN3brsBeFed-xWVcUd9gfqHTMRDtS9kZ1tXIYyLey4euZlWYJsmCxqpwJwSy-SBFQfDTpB64nrb_dIFpKKawB4BOe-GeDwMmYczB6y-o7DOFz6mXBrePGfWdbWhql-rsiafOM4-W0Pop9cGYPKZxzYh2gVzK6R_ca',
                  geotag: 'Feline Observation',
                  device: 'Terminal-07',
                  showVerification: false)),
          SizedBox(height: 10.h),
          _buildTaskCard(
              'Sector-A',
              'Sector A Triage',
              'Corridor',
              'Attendant: R. Patil',
              'Pending',
              'Scheduled for 11:30 AM',
              Icons.cleaning_services,
              _textVariant,
              const Color(0xFFEBE8E3),
              _buildDossier(
                  cageName: 'Sector A Triage',
                  housekeeperName: 'R. Patil',
                  shift: 'Morning Shift',
                  protocols: ['Floor Buffing', 'Waste Removal'],
                  beforeImage: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBpcP3EbAnzFU6OCLV59eXfwbwttVTKAaeXg9STnbblliZwqChl0uilZ3b8lWMqIOSlQAW-CKCpQeMmAnwNyhH3WrwgJyy6-IsLayc4Ko9KiT8QobX7pVAlh6LxHQwxnytyH9fWKvS58HqPvOiFWOdDH8eDMqcSJ6hR6giJiFYuYOfLNRLKl9ft6vEPQLZ7JapiRC5bORslGfGgXfsJryr5x7SUoWfRkzfqC_7qe8zpV0R6BLHSO71E',
                  afterImage: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAYaZTtooSFIJ-HbGVgf-4oAhW31GOBEeyYMafaHldNHlee29jWLtNxOqMyyCRMFz2sR68NtgGS2H8-iFVf7uoEN3brsBeFed-xWVcUd9gfqHTMRDtS9kZ1tXIYyLey4euZlWYJsmCxqpwJwSy-SBFQfDTpB64nrb_dIFpKKawB4BOe-GeDwMmYczB6y-o7DOFz6mXBrePGfWdbWhql-rsiafOM4-W0Pop9cGYPKZxzYh2gVzK6R_ca',
                  geotag: 'Sector A',
                  device: 'Terminal-12',
                  showVerification: false)),
        ],
      ),
    );
  }

  Widget _buildTaskCard(String id, String title, String subtitle, String desc,
      String badgeTxt, String timeTxt, IconData icon, Color badgeColor, Color badgeBgColor, Widget dossier) {
    bool isExpanded = _expandedTaskId == id;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (isExpanded) {
                _expandedTaskId = null;
              } else {
                _expandedTaskId = id;
              }
            });
          },
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: isExpanded ? Colors.white : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: isExpanded ? [
                BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2))
              ] : null,
              border: Border.all(color: _border),
            ),
            child: Column(
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
                              color: isExpanded ? _primaryLight : badgeBgColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Icon(icon, color: isExpanded ? _primary : badgeColor, size: 18.sp),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(title,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                              color: _textMain),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    SizedBox(width: 4.w),
                                    Flexible(
                                      child: Text('· $subtitle',
                                          style: TextStyle(
                                              fontSize: 11.sp, color: _textVariant),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                Text(desc,
                                    style: TextStyle(
                                        fontSize: 11.sp, color: _textVariant),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: badgeBgColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(badgeTxt,
                          style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                              color: badgeColor)),
                    ),
                  ],
                ),
                if (isExpanded) ...[
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: _border),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.badge, size: 18, color: _primary),
                            SizedBox(width: 6.w),
                            Text('Assigned: ',
                                style: TextStyle(fontSize: 12.sp, color: _textMain)),
                            Text(desc.contains('Attendant') ? 'R. Patil' : desc.contains('Tech') ? 'S. Kumar' : 'R. Patil',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: _textMain)),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.schedule, size: 14, color: _textVariant),
                            SizedBox(width: 4.w),
                            Text(timeTxt,
                                style: TextStyle(fontSize: 11.sp, color: _textVariant)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.visibility, size: 16, color: _primary),
                          SizedBox(width: 6.w),
                          Text('Inspecting Proof Below',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: _primary)),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_up, size: 18, color: _primary),
                    ],
                  ),
                ] else ...[
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.only(left: 52.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(timeTxt,
                            style: TextStyle(fontSize: 11.sp, color: _textVariant)),
                        const Icon(Icons.chevron_right, size: 16, color: _textVariant),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        if (isExpanded) dossier,
      ],
    );
  }

  Widget _buildDossier({
    required String cageName,
    required String housekeeperName,
    required String shift,
    required List<String> protocols,
    required String beforeImage,
    required String afterImage,
    required String geotag,
    required String device,
    required bool showVerification,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: _border),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dossier Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('VERIFICATION DOSSIER',
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: _primary,
                            letterSpacing: 0.5)),
                    SizedBox(height: 6.h),
                    Text('$cageName Sanitation Proof',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: _textMain)),
                    SizedBox(height: 4.h),
                    Text.rich(
                      TextSpan(
                        text: 'Housekeeper: ',
                        style: TextStyle(fontSize: 12.sp, color: _textVariant),
                        children: [
                          TextSpan(
                              text: housekeeperName,
                              style: TextStyle(
                                  color: _textMain,
                                  fontWeight: FontWeight.w500)),
                          TextSpan(text: ' · $shift'),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                      color: _primaryLight, shape: BoxShape.circle),
                  child: const Icon(Icons.verified, color: _primary, size: 16),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // Protocol Summary Pill Box
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: _border)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('APPLIED PROTOCOL',
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: _textVariant)),
                  SizedBox(height: 12.h),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: protocols.map((p) => _buildProtocolPill(p)).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            // Visual Comparison Proof
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Visual Comparison Proof',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: _textMain)),
                Text('Tap image to enlarge',
                    style: TextStyle(fontSize: 11.sp, color: _textVariant)),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  child: _buildPhotoCard(
                      'PRE-WASH',
                      '10:12 AM',
                      beforeImage,
                      const Color(0xFF31302D),
                      Colors.white),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: _buildPhotoCard(
                      'DISINFECTED',
                      '10:42 AM',
                      afterImage,
                      const Color(0xFF904C27),
                      Colors.white,
                      isAfter: true),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            // Telemetry
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                  color: _bg, borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.pin_drop, size: 14, color: Color(0xFF904C27)),
                      SizedBox(width: 6.w),
                      Text(geotag,
                          style: TextStyle(fontSize: 11.sp, color: _textVariant)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.sensors, size: 14, color: _textVariant),
                      SizedBox(width: 6.w),
                      Text(device,
                          style: TextStyle(fontSize: 11.sp, color: _textVariant)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            // Verification Actions
            if (showVerification && !_isVerified) ...[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isVerified = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primary,
                  foregroundColor: Colors.white,
                  elevation: 2,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.task_alt, size: 20),
                    SizedBox(width: 8.w),
                    Text('Verify & Log Sanitation',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFFFDAD6).withOpacity(0.4),
                  foregroundColor: const Color(0xFF93000A),
                  minimumSize: const Size(double.infinity, 44),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.replay, size: 18),
                    SizedBox(width: 8.w),
                    Text('Reject / Request Re-cleaning',
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
            SizedBox(height: 20.h),
            // History Audit Timeline
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: _border)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SANITATION AUDIT TRAIL',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: _textVariant)),
                      Text('Live Sync',
                          style: TextStyle(fontSize: 11.sp, color: _primary)),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  _buildTimelineStep('Task Assigned (Auto Rule)', 'Daily routine triggered', '08:30 AM', true),
                  _buildTimelineStep('Work Started', 'Chemical barrier deployed', '10:15 AM', true),
                  _buildTimelineStep('Photos Uploaded', 'By R. Patil (2 attachments)', '10:42 AM', true),
                  _buildTimelineStep(
                      'Super Admin Verification',
                      _isVerified ? 'Approved by Super Admin' : 'Awaiting final sign-off',
                      _isVerified ? '13:12 PM' : 'Pending',
                      _isVerified,
                      isLast: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProtocolPill(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
          color: _bg, borderRadius: BorderRadius.circular(6.r)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, size: 14, color: Color(0xFF904C27)),
          SizedBox(width: 4.w),
          Text(text, style: TextStyle(fontSize: 11.sp, color: _textMain)),
        ],
      ),
    );
  }

  Widget _buildPhotoCard(String badgeTxt, String timeTxt, String imageUrl,
      Color badgeBg, Color badgeFg,
      {bool isAfter = false}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: _border)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.network(imageUrl, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
                    return Container(color: _border);
                  }),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                      color: badgeBg.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Text(badgeTxt,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: badgeFg)),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(isAfter ? 'AFTER' : 'BEFORE',
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: isAfter ? _primary : _textMain)),
                Text(timeTxt,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: isAfter ? _primary : _textVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineStep(
      String title, String subtitle, String time, bool isDone,
      {bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 24.w,
            child: Column(
              children: [
                Container(
                  width: 14.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: isDone ? const Color(0xFF904C27) : const Color(0xFFFFA67A),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                      isDone ? Icons.check : Icons.circle,
                      size: isDone ? 10 : 6,
                      color: isDone ? Colors.white : const Color(0xFF783916)),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2.w,
                      color: _border,
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                    ),
                  )
                else
                  SizedBox(height: 24.h),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight:
                                  isLast ? FontWeight.bold : FontWeight.w500,
                              color: isLast ? _primary : _textMain)),
                      SizedBox(height: 2.h),
                      Text(subtitle,
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: isLast && !isDone ? FontWeight.w500 : FontWeight.normal,
                              color: isLast && !isDone ? const Color(0xFF904C27) : _textVariant)),
                    ],
                  ),
                  Text(time,
                      style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: isLast && !isDone ? FontWeight.bold : FontWeight.normal,
                          color: isLast && !isDone ? const Color(0xFF904C27) : _textVariant)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToast() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFF31302D),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Color(0xFFDDF3EE), size: 22),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              'Sanitation verified and cage marked as Cleaned.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../dashboard/presentation/widgets/dashboard_bottom_nav.dart';
import '../../../dashboard/presentation/widgets/dashboard_header.dart';

class DonorsPage extends StatefulWidget {
  const DonorsPage({Key? key}) : super(key: key);

  @override
  State<DonorsPage> createState() => _DonorsPageState();
}

class _DonorsPageState extends State<DonorsPage> {
  // Define colors to match DESIGN.md (falling back to constants if exact match isn't available)
  static const Color _surface = Color(0xFFFCF9F4);
  static const Color _surfaceLow = Color(0xFFF6F3EE);
  static const Color _surfaceHigh = Color(0xFFEBE8E3);
  static const Color _surfaceLowest = Color(0xFFFFFFFF);
  static const Color _primary = Color(0xFF80440F);
  static const Color _primaryContainer = Color(0xFF9E5B26);
  static const Color _onPrimaryContainer = Color(0xFFFFEADE);
  static const Color _secondary = Color(0xFF904C27);
  static const Color _tertiary = Color(0xFF0049C2);
  static const Color _textMain = Color(0xFF1C1C19);
  static const Color _textVariant = Color(0xFF53443A);
  static const Color _outline = Color(0xFF867368);
  static const Color _border = Color(0xFFE5E2DD);

  bool _isDonorsTab = true;
  bool _isSearchExpanded = false;

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
                child: Column(
                  children: [
                    _buildTopBanner(),
                    _buildTabs(),
                    _isDonorsTab ? _buildDonorsView() : _buildReportersView(),
                    _buildFooterBarometer(),
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

  Widget _buildTopBanner() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: _surfaceLow,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SANCTUARY REGISTRY', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _secondary, letterSpacing: 0.5)),
                    SizedBox(height: 4.h),
                    Text('Donors & Reporters', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: _textMain)),
                    SizedBox(height: 2.h),
                    Text('Community Patrons & Rescue Informants', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSearchExpanded = !_isSearchExpanded;
                    });
                  },
                  child: Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: _surfaceHigh,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.search, color: _primaryContainer),
                  ),
                ),
              ],
            ),
            if (_isSearchExpanded) ...[
              SizedBox(height: 12.h),
              Container(
                decoration: BoxDecoration(
                  color: _surfaceLowest,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                    )
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search by name, +91 phone, or #CASE-ID...',
                    hintStyle: TextStyle(fontSize: 12.sp, color: _outline),
                    prefixIcon: Icon(Icons.person_search, color: _outline, size: 20),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: _surfaceHigh,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _isDonorsTab = true),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    color: _isDonorsTab ? _primaryContainer : Colors.transparent,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.volunteer_activism, size: 16, color: _isDonorsTab ? Colors.white : _textVariant),
                      SizedBox(width: 6.w),
                      Text('Donors', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _isDonorsTab ? Colors.white : _textVariant)),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(color: _isDonorsTab ? Colors.white.withOpacity(0.2) : _surfaceLow, borderRadius: BorderRadius.circular(12.r)),
                        child: Text('142', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _isDonorsTab ? Colors.white : _textVariant)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _isDonorsTab = false),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    color: !_isDonorsTab ? _primaryContainer : Colors.transparent,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.campaign, size: 16, color: !_isDonorsTab ? Colors.white : _textVariant),
                      SizedBox(width: 6.w),
                      Text('Reporters', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: !_isDonorsTab ? Colors.white : _textVariant)),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(color: !_isDonorsTab ? Colors.white.withOpacity(0.2) : _surfaceLow, borderRadius: BorderRadius.circular(12.r)),
                        child: Text('89', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: !_isDonorsTab ? Colors.white : _textVariant)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonorsView() {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Active Sanctuary Patrons', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain)),
              Text('Verified KYC / 80G', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _secondary)),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        _buildFeaturedDonorCard(),
        SizedBox(height: 12.h),
        _buildStandardDonorCard('RD', 'Rohan Deshmukh', 'Monthly', '18 Contributions', '₹36,000', 'Stray Feeding Program'),
        SizedBox(height: 12.h),
        _buildStandardDonorCard('SR', 'Dr. Sunita Rao', 'Medical', '9 Contributions', '₹22,500', 'Avian Ward Oxygen', isErrorTheme: true),
        SizedBox(height: 16.h),
        _buildDonorDossier(),
      ],
    );
  }

  Widget _buildFeaturedDonorCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: _surfaceLowest,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: _border),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 1))],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.h,
                              decoration: BoxDecoration(color: Color(0xFFFFDBCC), shape: BoxShape.circle),
                              child: Center(child: Text('AK', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Color(0xFF351000)))),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text('Asha Kulkarni', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: _textMain), overflow: TextOverflow.ellipsis),
                                      ),
                                      SizedBox(width: 8.w),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                                        decoration: BoxDecoration(color: const Color(0xFFFFDCC6), borderRadius: BorderRadius.circular(12.r)),
                                        child: Text('Patron Donor', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: Color(0xFF301400))),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Text('Since Nov 2019', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward, color: _primaryContainer),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(color: _surfaceLow, borderRadius: BorderRadius.circular(8.r)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Total', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _outline)),
                                    SizedBox(height: 4.h),
                                    Text('₹86,400', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: _primary)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(color: _surfaceLow, borderRadius: BorderRadius.circular(8.r)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Contributions', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _outline)),
                                    SizedBox(height: 4.h),
                                    Text('42', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: _textMain)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            Icon(Icons.emergency, size: 16, color: _secondary),
                            SizedBox(width: 8.w),
                            Text('Bella Surgery', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                          ],
                        ),
                      ],
                    ),
                  ),
        ),
      ),
    );
  }

  Widget _buildStandardDonorCard(String initials, String name, String tag, String subtext, String amount, String cause, {bool isErrorTheme = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: _surfaceLowest,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: _border),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 1))],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(color: isErrorTheme ? const Color(0xFFFFB693) : _surfaceHigh, shape: BoxShape.circle),
                  child: Center(child: Text(initials, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: isErrorTheme ? const Color(0xFF733512) : _textVariant))),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(name, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain), overflow: TextOverflow.ellipsis)),
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                            decoration: BoxDecoration(color: isErrorTheme ? const Color(0xFFFFDAD6) : _border, borderRadius: BorderRadius.circular(12.r)),
                            child: Text(tag, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: isErrorTheme ? const Color(0xFF93000A) : _textVariant)),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(subtext, style: TextStyle(fontSize: 12.sp, color: _outline)),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(amount, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _primary)),
                    Text('Total', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _outline)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(color: _surfaceLow, borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(cause, style: TextStyle(fontSize: 12.sp, color: _textVariant), overflow: TextOverflow.ellipsis)),
                  Icon(Icons.chevron_right, size: 18, color: _outline),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonorDossier() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(color: _surfaceLow, borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('PATRON DOSSIER', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _secondary)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(color: _border, borderRadius: BorderRadius.circular(12.r)),
                  child: Row(
                    children: [
                      Container(width: 6.w, height: 6.h, decoration: BoxDecoration(color: Color(0xFFFFA67A), shape: BoxShape.circle)),
                      SizedBox(width: 6.w),
                      Text('ID: #SAWO-DON-408', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _textMain)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text('Asha Kulkarni', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: _textMain)),
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(Icons.call, size: 16, color: _outline),
                SizedBox(width: 8.w),
                Text('+91 98201 •••••', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.mail, size: 16, color: _outline),
                SizedBox(width: 8.w),
                Text('asha.k@gmail.com', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: _outline),
                SizedBox(width: 8.w),
                Text('Pune, Maharashtra', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(color: _surfaceLowest, borderRadius: BorderRadius.circular(12.r)),
              child: Row(
                children: [
                  Icon(Icons.verified, size: 24, color: _secondary),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('80G Certificate', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textMain)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                    decoration: BoxDecoration(color: _surfaceHigh, borderRadius: BorderRadius.circular(8.r)),
                    child: Row(
                      children: [
                        Icon(Icons.download, size: 16, color: _primary),
                        SizedBox(width: 4.w),
                        Text('PDF', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _primary)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(color: _surfaceLowest, borderRadius: BorderRadius.circular(12.r)),
              child: Row(
                children: [
                  Icon(Icons.military_tech, size: 24, color: _primary),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sponsor Badge', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textMain)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(color: const Color(0xFFFFDCC6), borderRadius: BorderRadius.circular(12.r)),
                    child: Text('Active', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: Color(0xFF301400))),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('RECENT CONTRIBUTIONS', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textMain)),
                Text('3 of 42 Shown', style: TextStyle(fontSize: 11.sp, color: _outline)),
              ],
            ),
            SizedBox(height: 12.h),
            _buildLedgerItem('28 Sep 2026', '#REC-9821', 'Bella Surgery', 'UPI', '₹6,400'),
            SizedBox(height: 8.h),
            _buildLedgerItem('14 Sep 2026', '#REC-9740', 'Kennel Sustenance', 'HDFC Auto-Debit', '₹2,500'),
            SizedBox(height: 8.h),
            _buildLedgerItem('02 Sep 2026', '#REC-9602', 'Diet Kitchen', 'NEFT', '₹4,800'),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: _primaryContainer,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.receipt_long, size: 18),
                  SizedBox(width: 8.w),
                  Text('View Complete Ledger (42 Records)', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: _border,
                foregroundColor: _textMain,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.send, size: 18),
                  SizedBox(width: 8.w),
                  Text('Send Gratitude / Case Update', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLedgerItem(String date, String id, String title, String subtitle, String amount) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(color: _surfaceLowest, borderRadius: BorderRadius.circular(8.r), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 1))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(date, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _secondary)),
                    SizedBox(width: 8.w),
                    Text(id, style: TextStyle(fontSize: 11.sp, color: _outline)),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(title, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textMain), overflow: TextOverflow.ellipsis),
                SizedBox(height: 2.h),
                Text(subtitle, style: TextStyle(fontSize: 12.sp, color: _textVariant)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _primary)),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text('View PDF', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _secondary)),
                  SizedBox(width: 2.w),
                  Icon(Icons.arrow_outward, size: 12, color: _secondary),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReportersView() {
    return Column(
      children: [
        SizedBox(height: 16.h),
        _buildReporterDossier(),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text('Recent Field Informants (City Inflow)', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain)),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        _buildReporterItem('MS', 'Meera Sharma', '+91 97632 ••••• · Reported: Barn Owl trapped', 'Resolved', _border, _textMain),
        SizedBox(height: 12.h),
        _buildReporterItem('VK', 'Vikram Kelkar', '+91 91580 ••••• · Reported: Bonnet Macaque', 'In Triage', const Color(0xFFFFDAD6), const Color(0xFF93000A)),
        SizedBox(height: 12.h),
        _buildReporterItem('SN', 'Sameer Naik', '+91 88882 ••••• · Reported: Stray calf', 'Field Responding', const Color(0xFFFFDBCC), const Color(0xFF351000)),
      ],
    );
  }

  Widget _buildReporterDossier() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: _surfaceLowest,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: _border),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 1))],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(color: const Color(0xFFFFDBCC), borderRadius: BorderRadius.circular(12.r)),
                  child: Text('Active Informant', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: Color(0xFF351000))),
                ),
                Text('Verified', style: TextStyle(fontSize: 11.sp, color: _outline)),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(color: Color(0xFFFFA67A), shape: BoxShape.circle),
                  child: Center(child: Text('AP', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Color(0xFF783916)))),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('A. Patil', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: _textMain)),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(Icons.phone_iphone, size: 16, color: _outline),
                        SizedBox(width: 4.w),
                        Text('+91 •••• ••• 042', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(color: _surfaceLow, borderRadius: BorderRadius.circular(12.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LINKED RESCUE', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _secondary)),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Case #00417', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain)),
                            SizedBox(height: 2.h),
                            Text("'Bella' (Injured Dog)", style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(color: const Color(0xFFDBE1FF), borderRadius: BorderRadius.circular(12.r)),
                        child: Row(
                          children: [
                            Container(width: 6.w, height: 6.h, decoration: BoxDecoration(color: _tertiary, shape: BoxShape.circle)),
                            SizedBox(width: 4.w),
                            Text('Treatment: B-04', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: Color(0xFF00174B))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(color: _surfaceHigh, borderRadius: BorderRadius.circular(12.r)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.mark_chat_read, size: 20, color: _primary),
                  SizedBox(width: 12.w),
                  Expanded(child: Text('SMS updates active for this case.', style: TextStyle(fontSize: 12.sp, color: _textVariant))),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primaryContainer,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sms, size: 16),
                        SizedBox(width: 8.w),
                        Text('Send Direct SMS', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: _surfaceHigh,
                    foregroundColor: _textMain,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.folder_open, size: 16),
                      SizedBox(width: 8.w),
                      Text('Case File', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
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

  Widget _buildReporterItem(String initials, String name, String subtitle, String status, Color statusBg, Color statusText) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: _surfaceLowest,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: _border),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 1))],
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(color: _surfaceHigh, shape: BoxShape.circle),
              child: Center(child: Text(initials, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textVariant))),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain)),
                  SizedBox(height: 2.h),
                  Text(subtitle, style: TextStyle(fontSize: 12.sp, color: _outline), overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(color: statusBg, borderRadius: BorderRadius.circular(12.r)),
              child: Text(status, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: statusText)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterBarometer() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0.h),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: _surfaceLow,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(color: Color(0xFFFFDCC6), shape: BoxShape.circle),
              child: Icon(Icons.hub, color: Color(0xFF301400), size: 20),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Community Engagement Index', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textMain)),
                  SizedBox(height: 2.h),
                  Text('94% Informant satisfaction & instant donor receipting active for Q3.', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

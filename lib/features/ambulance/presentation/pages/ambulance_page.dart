import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../dashboard/presentation/widgets/dashboard_bottom_nav.dart';
import '../../../dashboard/presentation/widgets/dashboard_header.dart';

class AmbulancePage extends StatefulWidget {
  const AmbulancePage({Key? key}) : super(key: key);

  @override
  State<AmbulancePage> createState() => _AmbulancePageState();
}

class _AmbulancePageState extends State<AmbulancePage> {
  int _selectedTab = 1;
  bool _isSyncing = false;

  static const Color _primary = Color(0xFF80440F);
  static const Color _primaryLight = Color(0xFFFFDCC6);
  static const Color _secondary = Color(0xFF904C27);
  static const Color _secondaryLight = Color(0xFFFFDBCC);
  static const Color _tertiary = Color(0xFF0049C2);
  
  static const Color _bg = Color(0xFFFCF9F4);
  static const Color _surface = Colors.white;
  static const Color _surfaceHigh = Color(0xFFEBE8E3);
  static const Color _surfaceLow = Color(0xFFF6F3EE);
  
  static const Color _textMain = Color(0xFF1C1C19);
  static const Color _textVariant = Color(0xFF53443A);
  static const Color _border = Color(0xFFE5E2DD);

  final List<String> _tabs = ['All (13)', 'Active (2)', 'Pending (3)', 'Completed (8)'];

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
                    _buildSubHeader(),
                    _buildMetricsCards(),
                    _buildTabs(),
                    _buildSectionTitle(),
                    _buildQueueList(),
                    _buildTelemetryTracker(),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const DashboardBottomNav(currentIndex: 4),
      floatingActionButton: _buildTriageBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildSubHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ambulance Fleet',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: _textMain)),
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
        color: _surfaceHigh,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(icon, color: _textVariant, size: 20),
    );
  }

  Widget _buildMetricsCards() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(child: _buildMetricCard('Active', '2', 'rides', _tertiary, true)),
          SizedBox(width: 8.w),
          Expanded(child: _buildMetricCard('Pending', '3', 'cases', const Color(0xFFFFA67A), false)),
          SizedBox(width: 8.w),
          Expanded(child: _buildMetricCard('Done', '8', 'today', _textVariant, false, isDone: true)),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String count, String suffix, Color color, bool ping, {bool isDone = false}) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: _border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 11.sp, color: _textVariant, fontWeight: FontWeight.bold)),
              if (isDone)
                Icon(Icons.check_circle, size: 14, color: Color(0xFF867368))
              else
                Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(count, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: isDone ? _textMain : color)),
              SizedBox(width: 4.w),
              Text(suffix, style: TextStyle(fontSize: 10.sp, color: isDone ? _textVariant : color)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isSelected ? _primary : _surfaceHigh,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    if (isSelected && idx == 1) ...[
                      Container(
                        width: 6.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: _bg,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 6.w),
                    ],
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : _textVariant,
                      ),
                    ),
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
      padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('LIVE DISPATCH QUEUE',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: _textVariant)),
          Row(
            children: [
              Icon(Icons.autorenew, size: 16, color: _primary),
              SizedBox(width: 4.w),
              Text('Auto-sync',
                  style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: _primary)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQueueList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Column(
        children: [
          // Active Card (Bella)
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: _surface,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: _primary, width: 2.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: 'CASE #2026-00417 ', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500, color: _primary)),
                            TextSpan(text: ' •  Sector 4', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500, color: _textVariant)),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(color: _primaryLight, borderRadius: BorderRadius.circular(12.r)),
                      child: Row(
                        children: [
                          Container(width: 6.w, height: 6.h, decoration: BoxDecoration(color: _primary, shape: BoxShape.circle)),
                          SizedBox(width: 6.w),
                          Text('En Route', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: Color(0xFF301400))),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text('Bella · Canine Rescue',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: _textMain)),
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: _surfaceLow,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 36.w,
                            height: 36.h,
                            decoration: BoxDecoration(color: const Color(0xFFE5E2DD), borderRadius: BorderRadius.circular(10.r)),
                            child: Icon(Icons.local_shipping, color: _primary, size: 20),
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Van-02', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: _textMain)),
                              Text('M. Yadav', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('ETA 7 min', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: _primary)),
                          Text('2.4 km', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.near_me, size: 18, color: _tertiary),
                        SizedBox(width: 6.w),
                        Text('Live Telemetry', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: _textVariant)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Details', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: _primary)),
                        SizedBox(width: 4.w),
                        Icon(Icons.arrow_forward, size: 16, color: _primary),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          // Pending Card (Bruno)
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: _surface,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: _border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: 'CASE #2026-00418 ', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500, color: _textVariant)),
                            TextSpan(text: ' •  High Priority', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500, color: _secondary)),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(color: _secondaryLight, borderRadius: BorderRadius.circular(12.r)),
                      child: Text('Pending Van', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: Color(0xFF351000))),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text('Bruno · Spinal Trauma',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: _textMain)),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: _secondary),
                        SizedBox(width: 6.w),
                        Text('Sector 9 Market', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                      ],
                    ),
                    Text('12m ago', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                  ],
                ),
                SizedBox(height: 16.h),
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
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_task, size: 18),
                            SizedBox(width: 8.w),
                            Text('Assign Ambulance', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(color: _surfaceHigh, borderRadius: BorderRadius.circular(12.r)),
                      child: Icon(Icons.info, color: _textMain, size: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          // Completed Card
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: _surface,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: _border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text('CASE #2026-00415',
                          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500, color: _textVariant),
                          overflow: TextOverflow.ellipsis),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(color: const Color(0xFFE5E2DD), borderRadius: BorderRadius.circular(12.r)),
                      child: Text('Completed', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: _textMain)),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text('Stray Pup Litter',
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: _textMain)),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.verified, size: 16, color: _textVariant),
                        SizedBox(width: 6.w),
                        Text('Van-01', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                      ],
                    ),
                    Text('09:15 AM', style: TextStyle(fontSize: 12.sp, color: Color(0xFF867368))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTelemetryTracker() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: _surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: _border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(width: 8.w, height: 8.h, decoration: BoxDecoration(color: _primary, shape: BoxShape.circle)),
                    SizedBox(width: 8.w),
                    Text('Live Transit Tracking', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: _textMain)),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(color: _surfaceHigh, borderRadius: BorderRadius.circular(6.r)),
                  child: Text('#2026-00417', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: _textVariant)),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // Reporter & Driver
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    decoration: BoxDecoration(color: _surfaceLow, borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Reporter', style: TextStyle(fontSize: 11.sp, color: _textVariant)),
                        SizedBox(height: 2.h),
                        Text('A. Patil', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: _textMain)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    decoration: BoxDecoration(color: _surfaceLow, borderRadius: BorderRadius.circular(12.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Driver', style: TextStyle(fontSize: 11.sp, color: _textVariant)),
                            SizedBox(height: 2.h),
                            Text('M. Yadav', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: _textMain)),
                          ],
                        ),
                        Container(
                          width: 28.w,
                          height: 28.h,
                          decoration: BoxDecoration(color: _secondaryLight, shape: BoxShape.circle),
                          child: Icon(Icons.call, color: Color(0xFF351000), size: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            // Map Area
            Container(
              height: 140.h,
              decoration: BoxDecoration(
                color: _surfaceHigh,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: _border),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11.r),
                child: Stack(
                  children: [
                    FlutterMap(
                      options: const MapOptions(
                        initialCenter: LatLng(19.0760, 72.8777), // Placeholder coords
                        initialZoom: 13.5,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.sawo_app',
                        ),
                        PolylineLayer(
                          polylines: [
                            Polyline(
                              points: const [
                                LatLng(19.0760, 72.8777),
                                LatLng(19.0700, 72.8850),
                                LatLng(19.0620, 72.8900),
                              ],
                              color: _primary,
                              strokeWidth: 4.0,
                            ),
                          ],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: const LatLng(19.0760, 72.8777),
                              width: 24.w,
                              height: 24.h,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _primary,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 2.w),
                                ),
                              ),
                            ),
                            Marker(
                              point: const LatLng(19.0620, 72.8900),
                              width: 24.w,
                              height: 24.h,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _tertiary,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 2.w),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(color: _surface.withOpacity(0.9), borderRadius: BorderRadius.circular(8.r)),
                      child: Row(
                        children: [
                          Container(width: 6.w, height: 6.h, decoration: BoxDecoration(color: _primary, shape: BoxShape.circle)),
                          SizedBox(width: 6.w),
                          Text('Sector 4', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600, color: _textMain)),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(color: _surface.withOpacity(0.9), borderRadius: BorderRadius.circular(8.r)),
                      child: Row(
                        children: [
                          Container(width: 6.w, height: 6.h, decoration: BoxDecoration(color: _tertiary, shape: BoxShape.circle)),
                          SizedBox(width: 6.w),
                          Text('ICU Ward B', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600, color: _textMain)),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(color: const Color(0xFF31302D).withOpacity(0.85), borderRadius: BorderRadius.circular(16.r)),
                      child: Row(
                        children: [
                          Icon(Icons.speed, size: 12, color: _secondaryLight),
                          SizedBox(width: 4.w),
                          Text('38 km/h', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500, color: Color(0xFFF3F0EB))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
            // Stepper
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: _surfaceLow,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Transit Milestones', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: _textMain)),
                      Text('In Progress', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _primary)),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  _buildStep('Reported & Triaged', '08:45 AM', true),
                  _buildStep('Van Dispatched', '08:50 AM', true),
                  _buildStep('Patient Secured', '09:02 AM', true),
                  _buildStep('In Transit', 'ETA 7m', false, isCurrent: true),
                  _buildStep('Handover', 'Pending', false, isLast: true),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            // Action Buttons
            ElevatedButton(
              onPressed: () {
                setState(() => _isSyncing = true);
                Future.delayed(const Duration(seconds: 2), () {
                  if (mounted) setState(() => _isSyncing = false);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                minimumSize: const Size(double.infinity, 44),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_isSyncing ? Icons.refresh : Icons.satellite_alt, size: 16),
                  SizedBox(width: 8.w),
                  Text(_isSyncing ? 'Broadcasting...' : 'View Telemetry', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String title, String timeText, bool isCompleted, {bool isCurrent = false, bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 14.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: isCompleted ? _primary : (isCurrent ? const Color(0xFFFFB784) : const Color(0xFFE5E2DD)),
                  shape: BoxShape.circle,
                  border: isCurrent ? Border.all(color: _primary, width: 2.w) : null,
                ),
                child: isCompleted
                    ? Icon(Icons.check, size: 10, color: Colors.white)
                    : (isCurrent ? Center(child: Container(width: 6.w, height: 6.h, decoration: BoxDecoration(color: _primary, shape: BoxShape.circle))) : null),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2.w,
                    color: _surfaceHigh,
                  ),
                ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 12.0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(title, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, color: isCurrent ? _primary : (isCompleted ? _textMain : _textVariant))),
                  ),
                  Text(timeText, style: TextStyle(fontSize: 12.sp, fontWeight: isCurrent ? FontWeight.w600 : FontWeight.w500, color: isCurrent ? _primary : const Color(0xFF867368))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTriageBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: _surfaceLow,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 32.w,
                  height: 32.h,
                  decoration: BoxDecoration(color: const Color(0xFFFFA67A), borderRadius: BorderRadius.circular(8.r)),
                  child: Icon(Icons.emergency_share, color: Color(0xFF783916), size: 18),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Emergency Dispatch', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: _textMain)),
                    Text('3 vans on standby', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              decoration: BoxDecoration(color: const Color(0xFFE5E2DD), borderRadius: BorderRadius.circular(8.r)),
              child: Text('Deploy', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textMain)),
            ),
          ],
        ),
      ),
    );
  }
}

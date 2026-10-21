import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../dashboard/presentation/widgets/dashboard_header.dart';
import '../../../dashboard/presentation/widgets/dashboard_bottom_nav.dart';
import 'cage_detail_page.dart';

class CagesPage extends StatefulWidget {
  const CagesPage({super.key});

  @override
  State<CagesPage> createState() => _CagesPageState();
}

class _CagesPageState extends State<CagesPage> {
  String selectedSector = 'Sector B (Canine ICU)';

  final List<Map<String, dynamic>> _cagesData = [
    {'id': 'B-01', 'status': 'Available', 'desc': 'Cleaned'},
    {
      'id': 'B-02',
      'status': 'Occupied',
      'name': 'Milo',
      'desc': 'Post-Surgical',
      'species': 'Canis lupus familiaris',
      'caseId': 'SAWO-CASE-2026-00392',
      'doctor': 'Dr. Gandhi',
      'caretaker': 'A. Rao',
      'cleanTime': 'Done at 07:15 AM'
    },
    {'id': 'B-03', 'status': 'Available', 'desc': 'Sterilized'},
    {
      'id': 'B-04',
      'status': 'Occupied',
      'name': 'Bella',
      'desc': 'Canine Ward',
      'species': 'Canis familiaris (14.2 kg)',
      'caseId': 'SAWO-CASE-2026-00417',
      'doctor': 'Dr. Gandhi',
      'caretaker': 'S. Shinde',
      'cleanTime': 'Inspected at 08:30 AM'
    },
    {'id': 'B-05', 'status': 'Available', 'desc': 'Ready'},
    {'id': 'B-06', 'status': 'Locked', 'desc': 'Maintenance'},
    {
      'id': 'B-07',
      'status': 'Occupied',
      'name': 'Luna',
      'desc': 'Observation',
      'species': 'Canis lupus familiaris',
      'caseId': 'SAWO-CASE-2026-00405',
      'doctor': 'Dr. Gandhi',
      'caretaker': 'S. Shinde',
      'cleanTime': 'Done at 06:45 AM'
    },
    {'id': 'B-08', 'status': 'Available', 'desc': 'Cleaned'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F7),
      bottomNavigationBar: const DashboardBottomNav(currentIndex: 5),
      body: SafeArea(
        child: Column(
          children: [
            const DashboardHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Text(
                        'Cage Management',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF17211F),
                        ),
                      ),
                    ),
                    _buildSectorActions(),
                    SizedBox(height: 12.h),
                    _buildStatusSummary(),
                    SizedBox(height: 16.h),
                    _buildSectorGridHeader(),
                    SizedBox(height: 12.h),
                    _buildCageGrid(),
                    SizedBox(height: 16.h),
                    _buildSanitationLog(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectorActions() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: _showSectorSelection,
            child: Container(
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.meeting_room,
                      color: AppColors.primary, size: 20),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Selected Enclosure',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: const Color(0xFF66736F))),
                        Text(selectedSector,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF17211F))),
                      ],
                    ),
                  ),
                  const Icon(Icons.expand_more,
                      color: Color(0xFF66736F), size: 20),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          width: 48.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: const Icon(Icons.tune, color: Color(0xFF17211F), size: 20),
        ),
      ],
    );
  }

  void _showSectorSelection() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Sector',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF17211F),
                ),
              ),
              SizedBox(height: 16.h),
              _buildSectorOption('Sector A (Avian Recovery)', '12 Cages'),
              SizedBox(height: 8.h),
              _buildSectorOption('Sector B (Canine ICU)', '8 Cages'),
              SizedBox(height: 8.h),
              _buildSectorOption('Sector C (Feline Ward)', '10 Cages'),
              SizedBox(height: 24.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectorOption(String name, String cageCount) {
    final isSelected = selectedSector == name;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSector = name;
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFDDF3EE) : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: isSelected
              ? null
              : Border.all(color: const Color(0xFFE3E9E7)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AppColors.primary : const Color(0xFF17211F),
              ),
            ),
            Text(
              cageCount,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AppColors.primary : const Color(0xFF66736F),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusSummary() {
    return Row(
      children: [
        Expanded(
          child: _buildSummaryCard(
            'Occupied',
            '8',
            const Color(0xFFFFDCC6),
            const Color(0xFF80440F),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _buildSummaryCard(
            'Available',
            '6',
            const Color(0xFFE8F5E9),
            const Color(0xFF2E7D32),
            dotColor: const Color(0xFF4CAF50),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _buildSummaryCard(
            'Locked',
            '2',
            const Color(0xFFF1F5F9),
            const Color(0xFF475569),
            dotColor: const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(
      String title, String count, Color bgColor, Color textColor,
      {Color? dotColor}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: textColor,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                count,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  height: 1.h,
                ),
              ),
              SizedBox(width: 6.w),
              Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: dotColor ?? textColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectorGridHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'SECTOR GRID (TOUCH TO INSPECT)',
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            color: const Color(0xFF66736F),
          ),
        ),
        Row(
          children: [
            Container(
              width: 8.w,
              height: 8.h,
              decoration: const BoxDecoration(
                color: Color(0xFF9E5B26),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              'Live Sync',
              style: TextStyle(fontSize: 11.sp, color: const Color(0xFF66736F)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCageGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 2.2,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _cagesData.length,
      itemBuilder: (context, index) {
        final cage = _cagesData[index];
        final id = cage['id'] as String;
        final status = cage['status'] as String;
        final desc = cage['desc'] as String;

        Widget card;
        if (status == 'Available') {
          card = _buildAvailableCage(id, desc);
        } else if (status == 'Locked') {
          card = _buildLockedCage(id, desc);
        } else {
          card = _buildOccupiedCage(id, cage['name'] as String, desc);
        }

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CageDetailPage(
                  cageData: cage,
                  sectorName: selectedSector,
                ),
              ),
            );
          },
          child: card,
        );
      },
    );
  }

  Widget _buildAvailableCage(String id, String desc) {
    return _buildBaseCageCard(
      id: id,
      title: 'Available',
      desc: desc,
      bgColor: const Color(0xFFE8F5E9),
      mainColor: const Color(0xFF2E7D32),
      icon: Icons.check_circle,
      dotColor: const Color(0xFF4CAF50),
    );
  }

  Widget _buildLockedCage(String id, String desc) {
    return _buildBaseCageCard(
      id: id,
      title: 'Locked',
      desc: desc,
      bgColor: const Color(0xFFF1F5F9),
      mainColor: const Color(0xFF475569),
      icon: Icons.lock,
      dotColor: const Color(0xFF64748B),
    );
  }

  Widget _buildOccupiedCage(String id, String name, String desc) {
    return _buildBaseCageCard(
      id: id,
      title: 'Occupied: $name',
      desc: desc,
      bgColor: const Color(0xFFFFDCC6).withOpacity(0.5),
      mainColor: const Color(0xFF80440F),
      icon: Icons.pets,
    );
  }

  Widget _buildBaseCageCard({
    required String id,
    required String title,
    required String desc,
    required Color bgColor,
    required Color mainColor,
    required IconData icon,
    Color? dotColor,
  }) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    id,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: dotColor ?? mainColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              Icon(icon, size: 18, color: mainColor),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildSanitationLog() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  color: Color(0xFFDDF3EE),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.cleaning_services,
                    color: AppColors.primary, size: 20),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sanitation Protocol',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF17211F),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Next ward round: 12:00 PM',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: const Color(0xFF66736F),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: const Color(0xFFECFDF5),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              'Ward On Schedule',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF065F46),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

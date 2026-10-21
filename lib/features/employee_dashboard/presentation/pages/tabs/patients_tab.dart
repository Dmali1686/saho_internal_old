import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/employee_app_colors.dart';

class EmployeePatientsTab extends StatefulWidget {
  final VoidCallback onPatientTap;

  const EmployeePatientsTab({super.key, required this.onPatientTap});

  @override
  State<EmployeePatientsTab> createState() => _EmployeePatientsTabState();
}

class _EmployeePatientsTabState extends State<EmployeePatientsTab> {
  String _currentFilter = 'All';
  final List<String> _filters = ['All', 'In-Ward', 'Surgery', 'Critical', 'Recovery'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchBar(),
          SizedBox(height: 16.h),
          _buildFilterPills(),
          SizedBox(height: 24.h),
          _buildStatusHeading(),
          SizedBox(height: 16.h),
          _buildPatientList(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search patients by name, ID, or cage',
          hintStyle: TextStyle(
            fontSize: 11.2.sp,
            color: EmployeeAppColors.textSecondary,
          ),
          prefixIcon: Icon(Icons.search, size: 18, color: const Color(0xFF80440F)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        ),
      ),
    );
  }

  Widget _buildFilterPills() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      child: Row(
        children: _filters.map((filter) {
          bool isSelected = _currentFilter == filter;
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _currentFilter = filter;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF1F2937) : Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: isSelected ? const Color(0xFF1F2937) : EmployeeAppColors.border,
                  ),
                ),
                child: Text(
                  filter,
                  style: TextStyle(
                    fontSize: 10.4.sp,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? Colors.white : EmployeeAppColors.textSecondary,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStatusHeading() {
    return Text(
      '4 Patients Displayed • Ward B',
      style: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 12.8.sp,
        fontWeight: FontWeight.w600,
        color: EmployeeAppColors.textPrimary,
      ),
    );
  }

  Widget _buildPatientList() {
    return Column(
      children: [
        _buildPatientCard(
          name: 'Rocky',
          id: '#00428',
          statusText: 'Treatment',
          statusBg: const Color(0xFFFED7AA).withOpacity(0.5),
          statusColor: const Color(0xFFC2410C),
          details: 'Indie • 16 kg • Male',
          location: 'Cage B-07',
          locationIcon: Icons.grid_view,
          locationBg: const Color(0xFFFEE2D5).withOpacity(0.5),
          locationColor: const Color(0xFF80440F),
          imageUrl: 'https://images.unsplash.com/photo-1543466835-00a7907e9de1?auto=format&fit=crop&w=150&q=80',
          dotColor: const Color(0xFFC2410C),
        ),
        SizedBox(height: 12.h),
        _buildPatientCard(
          name: 'Luna',
          id: '#00431',
          statusText: 'Surgery',
          statusBg: const Color(0xFFFEE2E2),
          statusColor: const Color(0xFF991B1B),
          details: 'Kitten • 2.1 kg • Female',
          location: 'OT Prep',
          locationIcon: Icons.grid_view,
          locationBg: const Color(0xFFFEE2D5).withOpacity(0.5),
          locationColor: const Color(0xFF80440F),
          imageUrl: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?auto=format&fit=crop&w=150&q=80',
          dotColor: const Color(0xFFEF4444),
        ),
        SizedBox(height: 12.h),
        _buildPatientCard(
          name: 'Daisy',
          id: '#00435',
          statusText: 'Recovery',
          statusBg: const Color(0xFFD1FAE5),
          statusColor: const Color(0xFF064E3B),
          details: 'Indie Pup • 7.4 kg • Female',
          location: 'Cage A-01',
          locationIcon: Icons.grid_view,
          locationBg: const Color(0xFFFEE2D5).withOpacity(0.5),
          locationColor: const Color(0xFF80440F),
          imageUrl: 'https://images.unsplash.com/photo-1537151608804-ea2f1ea290d0?auto=format&fit=crop&w=150&q=80',
          dotColor: const Color(0xFF10B981),
        ),
      ],
    );
  }

  Widget _buildPatientCard({
    required String name,
    required String id,
    required String statusText,
    required Color statusBg,
    required Color statusColor,
    required String details,
    required String location,
    required IconData locationIcon,
    required Color locationBg,
    required Color locationColor,
    required String imageUrl,
    required Color dotColor,
  }) {
    return GestureDetector(
      onTap: widget.onPatientTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 52.w,
                height: 52.w,
                decoration: BoxDecoration(
                  color: EmployeeAppColors.surfaceSoft,
                  borderRadius: BorderRadius.circular(16.r),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Icon(Icons.pets, color: EmployeeAppColors.border, size: 24.sp),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.w),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 14.4.sp,
                            fontWeight: FontWeight.w600,
                            color: EmployeeAppColors.textPrimary,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          id,
                          style: TextStyle(
                            fontFamily: 'Courier',
                            fontSize: 9.6.sp,
                            color: EmployeeAppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: statusBg,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        statusText,
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  details,
                  style: TextStyle(
                    fontSize: 10.4.sp,
                    color: EmployeeAppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: locationBg,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(locationIcon, size: 12.sp, color: locationColor),
                      SizedBox(width: 6.w),
                      Flexible(
                        child: Text(
                          location,
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                            color: locationColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Icon(Icons.chevron_right, color: EmployeeAppColors.border, size: 24.sp),
        ],
      ),
    ),
    );
  }
}

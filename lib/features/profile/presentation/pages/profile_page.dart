import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../features/auth/presentation/pages/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const Color _surface = Color(0xFFFCF9F4);
  static const Color _surfaceLowest = Color(0xFFFFFFFF);
  static const Color _surfaceHigh = Color(0xFFEBE8E3);
  static const Color _surfaceContainer = Color(0xFFF0EDE9);
  static const Color _primary = Color(0xFF80440F);
  static const Color _primaryFixed = Color(0xFFFFDCC6);
  static const Color _secondary = Color(0xFF904C27);
  static const Color _textMain = Color(0xFF1C1C19);
  static const Color _textVariant = Color(0xFF53443A);
  static const Color _border = Color(0xFFE5E2DD);
  static const Color _error = Color(0xFFBA1A1A);
  static const Color _errorContainer = Color(0xFFFFDAD6);

  bool _pushNotifications = true;
  bool _taskAutoDispatch = true;
  bool _clinicalApproval = true;
  bool _emergencyAlerts = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _surface,
      appBar: AppBar(
        backgroundColor: _surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: _textMain),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Settings', style: TextStyle(color: _textMain, fontSize: 18.sp, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSubHeader(),
            SizedBox(height: 16.h),
            _buildProfileCard(),
            SizedBox(height: 24.h),
            _buildVisualBackdrop(),
            SizedBox(height: 24.h),
            _buildNavigationStack(),
            SizedBox(height: 24.h),
            _buildRolePermissionsSection(),
            SizedBox(height: 24.h),
            _buildNotificationPreferences(),
            SizedBox(height: 24.h),
            _buildSystemConfig(),
            SizedBox(height: 24.h),
            _buildDangerZone(),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSubHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SYSTEM GOVERNANCE', style: TextStyle(fontSize: 11.sp, color: _primary, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        SizedBox(height: 4.h),
        Text('Administrator Controls', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: _textMain)),
        Text('Global policies, authority scopes & telemetry bindings', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
      ],
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: _surfaceLowest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: _border),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: _primaryFixed,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(Icons.shield, color: _primary, size: 28),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text('Super Admin', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: _textMain), maxLines: 1, overflow: TextOverflow.ellipsis),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                          decoration: BoxDecoration(color: const Color(0xFFECFDF5), borderRadius: BorderRadius.circular(12.r)),
                          child: Text('Active', style: TextStyle(color: Color(0xFF059669), fontSize: 11.sp, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text('SAWO Executive Director', style: TextStyle(fontSize: 12.sp, color: _secondary, fontWeight: FontWeight.w600)),
                    Text('admin@sawo-wildlife.org', style: TextStyle(fontSize: 12.sp, color: _textVariant)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(color: _surfaceContainer, borderRadius: BorderRadius.circular(12.r)),
                child: Row(
                  children: [
                    Icon(Icons.edit, size: 14, color: _primary),
                    SizedBox(width: 4.w),
                    Text('Edit', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _primary)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              _buildMetaMetric('Tier 0', 'Auth Level'),
              _buildMetaMetric('6 / 6', 'Roles Governed', isHighlighted: true),
              _buildMetaMetric('2FA', 'Hardware Key'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetaMetric(String value, String label, {bool isHighlighted = false}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(color: _surface, borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: isHighlighted ? _primary : _textMain)),
            SizedBox(height: 2.h),
            Text(label, style: TextStyle(fontSize: 11.sp, color: _textVariant)),
          ],
        ),
      ),
    );
  }

  Widget _buildVisualBackdrop() {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuD4vWS_iUsjFZG0TU54nI_jJCPd_wHVVmqC03FTlmOv7lJlIAUDJNZpr2rulcvZPofDa0TiOrIPVcGKkGxZdVwzU96jiV4ZSvG4V2R6bafs3FBtoxs2KsjgCS_CBlGWjaN1rVHqi9Brf8aiJEKp9f6ZChIQ8jy4prf5EcBegIiU0QW6xgKxAyX0YqvWxU6CAXLgIB7v-mcoyXf1duvPv2AZZ5IwTSTbWr0BeJPSytovUL279gsn5PfO'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.8), Colors.transparent],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SANCTUARY GRID STATUS', style: TextStyle(fontSize: 10.sp, color: _primaryFixed, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                    Text('HQ Biome Reserve Alpha', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(12.r)),
                  child: Text('Sync Online', style: TextStyle(fontSize: 11.sp, color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationStack() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Text('DIRECTORIES', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _textVariant, letterSpacing: 1.2)),
        ),
        Container(
          decoration: BoxDecoration(
            color: _surfaceLowest,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: _border),
          ),
          child: Column(
            children: [
              _buildNavRow(Icons.account_circle, 'Profile & Credentials', 'Admin credentials & 2FA'),
              _buildDivider(),
              _buildNavRow(Icons.admin_panel_settings, 'Role & Permissions', 'Hierarchy & access rights'),
              _buildDivider(),
              _buildNavRow(Icons.notifications_active, 'Notification Preferences', 'Triggers & high-risk alerts'),
              _buildDivider(),
              _buildNavRow(Icons.tune, 'System Configuration', 'Intake forms & telemetry'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavRow(IconData icon, String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(color: _surfaceContainer, borderRadius: BorderRadius.circular(12.r)),
            child: Icon(icon, color: _primary, size: 20),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: _textMain)),
                Text(subtitle, style: TextStyle(fontSize: 11.sp, color: _textVariant)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 14, color: _textVariant),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1.h, thickness: 1, color: _border, indent: 72.w);
  }

  Widget _buildRolePermissionsSection() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: _surfaceLowest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: _border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.verified_user, color: _primary, size: 20),
                  SizedBox(width: 8.w),
                  Text('Role Capabilities', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain)),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(color: const Color(0xFFFFF4ED), borderRadius: BorderRadius.circular(12.r)),
                child: Text('Super Admin Scope', style: TextStyle(color: Color(0xFFD96B27), fontSize: 11.sp, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(color: _surfaceContainer, borderRadius: BorderRadius.circular(12.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Full System Control', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain)),
                Text('Unrestricted Root', style: TextStyle(fontSize: 12.sp, color: _primary, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Text('Enabled Master Permissions', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _textVariant, letterSpacing: 1.2)),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildPermissionTag('View All Records'),
              _buildPermissionTag('Add & Register'),
              _buildPermissionTag('Update Status'),
              _buildPermissionTag('Approve Medicine'),
              _buildPermissionTag('Complete Tasks'),
            ],
          ),
          SizedBox(height: 24.h),
          Text('Governed Roles', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _textVariant, letterSpacing: 1.2)),
          SizedBox(height: 8.h),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 3.5,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: [
              _buildRoleGridItem(Icons.medical_services, 'Doctor / Vet Lead'),
              _buildRoleGridItem(Icons.pets, 'Caretaker'),
              _buildRoleGridItem(Icons.restaurant, 'Nutritionist'),
              _buildRoleGridItem(Icons.cleaning_services, 'Housekeeper'),
              _buildRoleGridItem(Icons.emergency, 'Ambulance Unit'),
              _buildRoleGridItem(Icons.account_balance, 'Finance User'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoleGridItem(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(color: _surfaceContainer, borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          Icon(icon, size: 16, color: _secondary),
          SizedBox(width: 8.w),
          Expanded(child: Text(label, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600, color: _textMain), overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }

  Widget _buildPermissionTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: _surfaceContainer,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check, size: 14, color: _primary),
          SizedBox(width: 4.w),
          Text(label, style: TextStyle(fontSize: 12.sp, color: _textMain, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildNotificationPreferences() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: _surfaceLowest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: _border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.notifications, color: _primary, size: 20),
              SizedBox(width: 8.w),
              Text('Notification Preferences', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain)),
            ],
          ),
          SizedBox(height: 16.h),
          _buildToggleRow('Push Notifications', 'Event broadcasts & triage', _pushNotifications, (val) => setState(() => _pushNotifications = val)),
          _buildToggleRow('Task Auto-Dispatches', 'Direct routing alerts', _taskAutoDispatch, (val) => setState(() => _taskAutoDispatch = val)),
          _buildToggleRow('Clinical Approvals', 'Surgery & drug signatures', _clinicalApproval, (val) => setState(() => _clinicalApproval = val)),
          _buildToggleRow('Emergency Alerts', 'Critical breaches', _emergencyAlerts, (val) => setState(() => _emergencyAlerts = val)),
        ],
      ),
    );
  }

  Widget _buildToggleRow(String title, String subtitle, bool value, Function(bool) onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(color: _surfaceContainer, borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: _textMain)),
                Text(subtitle, style: TextStyle(fontSize: 11.sp, color: _textVariant)),
              ],
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.white,
              activeTrackColor: _primary,
              inactiveTrackColor: _surfaceHigh,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSystemConfig() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: _surfaceLowest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: _border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.construction, color: _primary, size: 20),
                  SizedBox(width: 8.w),
                  Text('System Configuration', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain)),
                ],
              ),
              Text('Core Schema v2.4', style: TextStyle(fontSize: 11.sp, color: _secondary, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 16.h),
          _buildConfigAction(Icons.dynamic_form, 'Patient Forms & Triage', 'Configure'),
          SizedBox(height: 8.h),
          _buildConfigAction(Icons.schema, 'Workflow & Rule Engine', 'Manage'),
        ],
      ),
    );
  }

  Widget _buildConfigAction(IconData icon, String title, String actionLabel) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(color: _surfaceContainer, borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: _primary),
              SizedBox(width: 12.w),
              Text(title, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: _textMain)),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(color: _surfaceHigh, borderRadius: BorderRadius.circular(8.r)),
            child: Row(
              children: [
                Text(actionLabel, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textMain)),
                SizedBox(width: 4.w),
                Icon(Icons.chevron_right, size: 14, color: _textMain),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDangerZone() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: _errorContainer,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber, color: _error, size: 20),
              SizedBox(width: 8.w),
              Text('System Access', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _error)),
            ],
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _error,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout, size: 18),
                SizedBox(width: 8.w),
                Text('Sign Out (HQ Console)', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

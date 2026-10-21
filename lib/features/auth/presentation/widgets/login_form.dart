import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

import '../../../dashboard/presentation/pages/dashboard_page.dart';
import '../../../../features/employee_dashboard/presentation/pages/employee_dashboard_page.dart';

class LoginForm extends StatefulWidget {
  final String selectedRole;

  const LoginForm({super.key, required this.selectedRole});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  bool _hasError = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _hasError = false;
      });

      // Simulate API Call
      await Future.delayed(const Duration(milliseconds: 800));

      if (mounted) {
        if (widget.selectedRole == 'admin') {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const DashboardPage()),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const EmployeeDashboardPage()),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSuperAdmin = widget.selectedRole == 'admin';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isSuperAdmin ? 'Super Admin Login' : 'Staff Login',
              style: AppTextStyles.title,
            ),
            const SizedBox(height: 2),
            Text(
              isSuperAdmin
                  ? 'Administrator access to system management and monitoring.'
                  : 'Your access is based on your assigned department role.',
              style: AppTextStyles.caption,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Divider(color: AppColors.border, height: 1),
            ),
            if (_hasError)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.errorBg,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.errorBorder),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline, color: AppColors.errorText, size: 14),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Invalid credentials. Please verify your SAWO credentials.',
                        style: AppTextStyles.caption.copyWith(color: Colors.red.shade700),
                      ),
                    ),
                  ],
                ),
              ),
            Text(
              isSuperAdmin ? 'Username or Admin Email' : 'Staff ID or Work Email',
              style: AppTextStyles.captionSemiBold.copyWith(color: AppColors.textDark),
            ),
            const SizedBox(height: 6),
            TextFormField(
              style: AppTextStyles.body,
              decoration: InputDecoration(
                hintText: isSuperAdmin ? 'admin@sawo.org' : 'e.g. EMP-084 or vet@sawo.org',
                prefixIcon: const Icon(Icons.person_outline, size: 18, color: AppColors.textMuted),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your identifier';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            Text(
              'Password',
              style: AppTextStyles.captionSemiBold.copyWith(color: AppColors.textDark),
            ),
            const SizedBox(height: 6),
            TextFormField(
              style: AppTextStyles.body,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: '••••••••••••',
                prefixIcon: const Icon(Icons.lock_outline, size: 18, color: AppColors.textMuted),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    size: 18,
                    color: AppColors.textMuted,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text('2FA Protected', style: AppTextStyles.caption),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?', style: AppTextStyles.captionPrimary),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _submit,
                child: _isLoading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(
                        isSuperAdmin ? 'Login to Dashboard' : 'Login as Staff',
                        style: AppTextStyles.button.copyWith(color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

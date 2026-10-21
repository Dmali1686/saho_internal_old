import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/login_form.dart';
import '../widgets/role_selector.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _selectedRole = 'admin'; // 'admin' or 'staff'

  void _onRoleChanged(String role) {
    setState(() {
      _selectedRole = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const _HeaderSection(),
                      const SizedBox(height: 24),
                      RoleSelector(
                        selectedRole: _selectedRole,
                        onRoleChanged: _onRoleChanged,
                      ),
                      const SizedBox(height: 20),
                      LoginForm(selectedRole: _selectedRole),
                      const SizedBox(height: 32),
                      const _FooterSection(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 4,
              )
            ],
          ),
          child: ClipOval(
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDxSOyviISzCFdbD0POiwxxJhEQfqumt-SXtMVC4P-FTpnbqNAOUSAIReRkkThnRoxCpExsmV9vreXC_l-3eDVaal6ne6-yHsU20OldBqkpwkMAZsPa0a17htq2iZgIp75hHc1Mn6-AMcIsvH-fcJajAPf0rL67nlmbwJEaPiPlSoEeqK7xa0dy5p8YuyyfXDJarfCtlHhnvo95UDYBWD1Pr0XJFR5pBROdnphPWINs10U4Eqb-aqb-u6PPfsszk9pEPg',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.pets, color: AppColors.primary, size: 36),
            ),
          ),
        ),
        const SizedBox(height: 16),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
              fontFamily: 'Plus Jakarta Sans',
              letterSpacing: -0.5,
            ),
            children: [
              TextSpan(text: 'Welcome to '),
              TextSpan(text: 'SAWO', style: TextStyle(color: AppColors.primary)),
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Internal Animal Welfare Management System',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textMuted,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.badgeBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border.withOpacity(0.6)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.lock_outline, size: 12, color: AppColors.primary),
              const SizedBox(width: 6),
              const Text(
                'Authorized internal users only',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Sanctuary Habitat OS v2.4.0 • Zero-Trust Node HQ',
          style: TextStyle(
            fontSize: 10,
            color: AppColors.textSub,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

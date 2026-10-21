import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../dashboard/presentation/widgets/dashboard_header.dart';
import '../../../dashboard/presentation/widgets/dashboard_bottom_nav.dart';
import '../widgets/patient_search_bar.dart';
import '../widgets/patient_filter_pills.dart';
import '../widgets/patient_stats_row.dart';
import '../widgets/patient_list_card.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      bottomNavigationBar: const DashboardBottomNav(currentIndex: 1), // Assuming we update BottomNav
      body: SafeArea(
        child: Column(
          children: [
            const DashboardHeader(),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                  const PatientSearchBar(),
                  const SizedBox(height: 16),
                  const PatientFilterPills(),
                  const SizedBox(height: 24),
                  const PatientStatsRow(),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Live Registry',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0EDE9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              '213 active',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Register'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                          minimumSize: const Size(0, 32),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const PatientListCard(
                    name: 'Bella',
                    patientId: 'SAWO-CASE-2026-00417',
                    details: 'Canis familiaris · 14.2 kg',
                    status: 'Assessment',
                    statusColor: Color(0xFFD96B27),
                    statusBg: Color(0xFFFFF4ED),
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAgLbs1q0jN0jw2Wva-s9ExT8KmAuHdhmZHt2aEZ8tc5DxQtJg-mQrO-DAl5y5YsG4DkdssmZAs5jdUaaaQH0iDye_X6kDjUHjKiOfiRKk4bPxmYmVU1H_frptSTPNFQF0BfL7aaWTJD-MxyZS-jtMlG_9SnMIfsBned2yKoBUIojarXVlPC8UywRUggPBliOgzoBtYO51nNCfKJIc5ZN9Yf54brfX7MQOI6UB7-elhPzIouhmTeYfE',
                    cage: 'Cage B-04',
                    vet: 'Dr. Gandhi',
                    caretaker: 'S. Shinde',
                  ),
                  const SizedBox(height: 12),
                  const PatientListCard(
                    name: 'Milo',
                    patientId: 'SAWO-CASE-2026-00412',
                    details: 'Felis catus · 4.1 kg',
                    status: 'Treatment',
                    statusColor: Color(0xFF2563EB),
                    statusBg: Color(0xFFEFF6FF),
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCqpK7nNSr2VmaEhvC7a9Q6X-dlMIW38nMiBjz0AaPazTRFeorWsFxngSWkOGtMRW-mqno_q0anToZkvpKHWNgNJt3oEJ_IixRGhN8JdsI_tm37g4LR_ETp1eKjoJkeFEftKvmpNRCd8WGFaFRifla6UWSCxg1wZRFkW9Pz75b9g_SucXlYhbvRHl6BNK5Z-EilIdKvesU68HpA0LEzR5NUiYSqJu3Jh8gmbYNGCZ1xMvJGG2aZLd_o',
                    cage: 'Cage B-02',
                    vet: 'Dr. Gandhi',
                    caretaker: 'S. Shinde',
                  ),
                  const SizedBox(height: 12),
                  const PatientListCard(
                    name: 'Bruno',
                    patientId: 'SAWO-CASE-2026-00398',
                    details: 'Canis familiaris · 8.6 kg',
                    status: 'Surgery',
                    statusColor: Color(0xFFE11D48),
                    statusBg: Color(0xFFFFF1F2),
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAT8y8qPwquOGD6mna6ewV4zVA5ef8WhO1FIWzSnYmgLkx4QRnmhO35xKQQGHgREuDhvfNIDcFCUkihoeHoVQx5v-nnGppTb3gex0dn-SWMcacsqTFRQbZcvd99XQTycvfPimH9bcvQuTy4kHxfN23nhhy00PS6MB5aa-OVXf3_P0Mv5hziXWGoH_FncRUkInjbuosiZU6ztsB9xQwR0Q0MMqfgjZE4m5PjT6BbEUHea93Td4sCWVWq',
                    cage: 'Cage OT-1',
                    vet: 'Dr. Gandhi',
                    caretaker: 'R. Patil',
                  ),
                  const SizedBox(height: 12),
                  const PatientListCard(
                    name: 'Luna',
                    patientId: 'SAWO-CASE-2026-00385',
                    details: 'Felis catus · 3.8 kg',
                    status: 'Recovery',
                    statusColor: Color(0xFF059669),
                    statusBg: Color(0xFFECFDF5),
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDxv6QsbYdzHAmQORxk34Oj9m31fItMYHhx6EQWu0SoODAmT5vVNziU_mhNTjiKWAmyvLlGVC9Op8CSLmPOJ8YYln973FRdvDUVsHJzgFpbgIPBCPsgaF_8yND2_kU9D1sOBEIS6fenaQX9ZIx-oY6LCqDP1KQbhwElJ0NUDiBQ4IUP9nbHGAXBHOmJDq7llsjRVR9bhl1Aeku67C6HdIPtHYCBvOPweJuW-lCh5WINtyrmWt4r7haW',
                    cage: 'Cage B-07',
                    vet: 'Dr. Gandhi',
                    caretaker: 'S. Shinde',
                  ),
                  const SizedBox(height: 24),
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
}

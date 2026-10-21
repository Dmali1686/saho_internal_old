import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class OverviewSection extends StatefulWidget {
  const OverviewSection({super.key});

  @override
  State<OverviewSection> createState() => _OverviewSectionState();
}

class _OverviewSectionState extends State<OverviewSection> {
  DateTime _selectedDate = DateTime.now();

  String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${date.day.toString().padLeft(2, '0')} ${months[date.month - 1]} ${date.year}';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Overview',
              style: AppTextStyles.headline,
            ),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 14, color: AppColors.textMuted),
                    const SizedBox(width: 6),
                    Text(
                      _formatDate(_selectedDate),
                      style: AppTextStyles.captionSemiBold,
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.keyboard_arrow_down, size: 16, color: AppColors.textMuted),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.4,
          children: const [
            _StatCard(
              title: 'Total Tasks',
              value: '84',
              subtitle: 'Active roster',
              backgroundColor: Color(0xFFE8EDFC),
              blobColor: Color(0xFFD9E3F8),
              textColor: Color(0xFF1E293B),
            ),
            _StatCard(
              title: 'Pending Tasks',
              value: '18',
              subtitle: 'Need Action',
              backgroundColor: Color(0xFFFEE2D5),
              blobColor: Color(0xFFFCDB0D), // Softened red blob
              textColor: Color(0xFF991B1B),
              isAlert: true,
            ),
            _StatCard(
              title: 'Approvals',
              value: '07',
              subtitle: 'Supervisor Review',
              backgroundColor: Color(0xFFFED7AA),
              blobColor: Color(0xFFFDBA74),
              textColor: Color(0xFF7C2D12),
              isReview: true,
            ),
            _StatCard(
              title: 'Completed',
              value: '59',
              subtitle: '92% on time',
              backgroundColor: Color(0xFF6EE7B7),
              blobColor: Color(0xFF34D399),
              textColor: Color(0xFF064E3B),
              isSuccess: true,
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color backgroundColor;
  final Color blobColor;
  final Color textColor;
  final bool isAlert;
  final bool isReview;
  final bool isSuccess;

  const _StatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.backgroundColor,
    required this.blobColor,
    required this.textColor,
    this.isAlert = false,
    this.isReview = false,
    this.isSuccess = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Stack(
          children: [
            // Decorative background blob
            Positioned(
              right: -16,
              bottom: -20,
              child: Container(
                width: 110,
                height: 80,
                decoration: BoxDecoration(
                  color: blobColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            // Card Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value,
                        style: AppTextStyles.statMedium.copyWith(color: textColor),
                      ),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.more_horiz, size: 16, color: textColor),
                      ),
                    ],
                  ),
                  Text(
                    title,
                    style: AppTextStyles.caption.copyWith(
                      fontWeight: FontWeight.w600,
                      color: textColor.withOpacity(0.8),
                    ),
                  ),
                  const Spacer(),
                  if (isAlert || isReview || isSuccess)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isAlert)
                            const Text('! ', style: TextStyle(color: Color(0xFFB91C1C), fontWeight: FontWeight.w900, fontSize: 12)),
                          if (isReview)
                            const Icon(Icons.edit_document, size: 12, color: Color(0xFFEA580C)),
                          if (isSuccess)
                            const Icon(Icons.trending_up, size: 12, color: Color(0xFF059669)),
                          const SizedBox(width: 4),
                          Text(
                            subtitle,
                            style: AppTextStyles.badge.copyWith(
                              color: isAlert
                                  ? const Color(0xFFB91C1C)
                                  : isReview
                                      ? const Color(0xFFC2410C)
                                      : const Color(0xFF047857),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: textColor.withOpacity(0.7),
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

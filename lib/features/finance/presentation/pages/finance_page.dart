import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../dashboard/presentation/widgets/dashboard_header.dart';
import '../../../dashboard/presentation/widgets/dashboard_bottom_nav.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  static const Color _surface = Color(0xFFFCF9F4);
  static const Color _surfaceLow = Color(0xFFF6F3EE);
  static const Color _surfaceLowest = Color(0xFFFFFFFF);
  static const Color _surfaceHigh = Color(0xFFEBE8E3);
  static const Color _surfaceContainer = Color(0xFFF0EDE9);
  
  static const Color _primary = Color(0xFF80440F);
  static const Color _primaryContainer = Color(0xFF9E5B26);
  static const Color _onPrimaryContainer = Color(0xFFFFEADE);
  static const Color _primaryFixed = Color(0xFFFFDCC6);
  static const Color _primaryFixedDim = Color(0xFFFFB784);
  
  static const Color _secondary = Color(0xFF904C27);
  static const Color _secondaryContainer = Color(0xFFFFA67A);
  static const Color _secondaryFixed = Color(0xFFFFDBCC);
  
  static const Color _tertiary = Color(0xFF0049C2);
  static const Color _tertiaryFixed = Color(0xFFDBE1FF);
  
  static const Color _textMain = Color(0xFF1C1C19);
  static const Color _textVariant = Color(0xFF53443A);
  static const Color _outline = Color(0xFF867368);
  static const Color _border = Color(0xFFE5E2DD);
  
  static const Color _error = Color(0xFFBA1A1A);
  static const Color _errorContainer = Color(0xFFFFDAD6);
  static const Color _onErrorContainer = Color(0xFF93000A);

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
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTopHeader(),
                    _buildMetricsGrid(),
                    _buildPeriodPerformance(),
                    _buildRecentTransactions(),
                    _buildTransactionDossier(),
                    _buildActionButtons(),
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

  Widget _buildTopHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EXECUTIVE AUDIT',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: _primary,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Row(
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: const BoxDecoration(
                  color: _surfaceHigh,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.search, size: 16.sp, color: _textVariant),
              ),
              SizedBox(width: 8.w),
              Container(
                height: 32.w,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: _surfaceHigh,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Text('October 2026', style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: _textMain)),
                    SizedBox(width: 4.w),
                    Icon(Icons.expand_more, size: 14.sp, color: _primary),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 1.4,
        children: [
          _buildMetricCard(
            title: 'INCOME',
            icon: Icons.trending_up,
            iconBg: _surfaceLow,
            iconColor: _tertiary,
            amount: '₹3,18,000',
            subtitle: '+8.4% vs Sep',
            subtitleColor: const Color(0xFF003EA8),
            dotColor: _tertiary,
          ),
          _buildMetricCard(
            title: 'EXPENSE',
            icon: Icons.payments,
            iconBg: _secondaryFixed,
            iconColor: _secondary,
            amount: '₹1,64,300',
            subtitle: 'Vets & Clinical Care',
            subtitleColor: _secondary,
            dotColor: _secondary,
          ),
          _buildMetricCard(
            title: 'PAYROLL',
            icon: Icons.groups,
            iconBg: _surfaceHigh,
            iconColor: _textVariant,
            amount: '₹1,12,000',
            subtitle: 'Operational Field Staff',
            subtitleColor: _textVariant,
            dotColor: Colors.transparent,
          ),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: _primaryContainer,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TOTAL FUNDS', style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: _primaryFixed)),
                    Container(
                      width: 24.w,
                      height: 24.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.account_balance, size: 14.sp, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('₹4,82,300', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(Icons.shield_outlined, size: 12.sp, color: _onPrimaryContainer),
                        SizedBox(width: 4.w),
                        Text('Net Reserve Ready', style: TextStyle(fontSize: 9.sp, color: _onPrimaryContainer)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String amount,
    required String subtitle,
    required Color subtitleColor,
    required Color dotColor,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: _surfaceLowest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: _border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: _textVariant)),
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  color: iconBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 14.sp, color: iconColor),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(amount, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: _textMain)),
              SizedBox(height: 4.h),
              Row(
                children: [
                  if (dotColor != Colors.transparent) ...[
                    Container(width: 4.w, height: 4.w, decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle)),
                    SizedBox(width: 4.w),
                  ],
                  Expanded(child: Text(subtitle, style: TextStyle(fontSize: 9.sp, color: subtitleColor), maxLines: 1, overflow: TextOverflow.ellipsis)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodPerformance() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: _surfaceLowest,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: _border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.query_stats, size: 18.sp, color: _primary),
                      SizedBox(width: 6.w),
                      Flexible(
                        child: Text(
                          'Period Performance',
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(color: _surfaceHigh, borderRadius: BorderRadius.circular(12.r)),
                  child: Row(
                    children: [
                      Icon(Icons.verified_user, size: 12.sp, color: _tertiary),
                      SizedBox(width: 4.w),
                      Text('Buffer Active', style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: _textMain)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              height: 10.h,
              decoration: BoxDecoration(
                color: _surfaceContainer,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Row(
                children: [
                  Expanded(flex: 53, child: Container(decoration: BoxDecoration(color: _tertiary, borderRadius: BorderRadius.horizontal(left: Radius.circular(6.r))))),
                  Expanded(flex: 28, child: Container(color: _secondaryContainer)),
                  Expanded(flex: 19, child: Container(decoration: BoxDecoration(color: _primaryFixedDim, borderRadius: BorderRadius.horizontal(right: Radius.circular(6.r))))),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            _buildPerformanceRow(_tertiary, 'Total Income', '₹3,18,000'),
            SizedBox(height: 8.h),
            _buildPerformanceRow(_secondaryContainer, 'Expense', '₹1,64,300'),
            SizedBox(height: 8.h),
            _buildPerformanceRow(_primaryFixedDim, 'Payroll', '₹1,12,000'),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(color: _surfaceLow, borderRadius: BorderRadius.circular(12.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_circle, size: 16.sp, color: _primary),
                      SizedBox(width: 6.w),
                      Text('Net Reserve', style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: _textMain)),
                    ],
                  ),
                  Text('+4.2%', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textMain)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceRow(Color dotColor, String title, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(width: 8.w, height: 8.w, decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle)),
            SizedBox(width: 6.w),
            Text(title, style: TextStyle(fontSize: 12.sp, color: _textVariant)),
          ],
        ),
        Text(amount, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textMain)),
      ],
    );
  }

  Widget _buildRecentTransactions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('Recent Transactions', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain)),
                  SizedBox(width: 8.w),
                  Text('3 recent', style: TextStyle(fontSize: 9.sp, color: _textVariant)),
                ],
              ),
              Text('Sort by Date', style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: _primary)),
            ],
          ),
          SizedBox(height: 12.h),
          _buildTransactionItem(
            icon: Icons.medical_services,
            iconBg: _errorContainer,
            iconColor: _onErrorContainer,
            title: 'Bella Surgery',
            date: '28 Sep 2026 • Case #00417',
            amount: '-₹6,400',
            amountColor: _error,
            type: 'Expense',
            typeBg: _errorContainer,
            typeColor: _onErrorContainer,
            footerIcon: Icons.medical_information,
            footerText: 'Dr. Gandhi',
            isSelectable: true,
          ),
          SizedBox(height: 12.h),
          _buildTransactionItem(
            icon: Icons.volunteer_activism,
            iconBg: _surfaceHigh,
            iconColor: _tertiary,
            title: 'Donor Contribution',
            date: '14 Sep 2026 • Asha Kulkarni',
            amount: '+₹2,500',
            amountColor: _tertiary,
            type: 'Income',
            typeBg: _tertiaryFixed,
            typeColor: const Color(0xFF00174B),
            footerIcon: Icons.card_giftcard,
            footerText: 'Sanctuary Patronage',
          ),
          SizedBox(height: 12.h),
          _buildTransactionItem(
            icon: Icons.restaurant,
            iconBg: _secondaryFixed,
            iconColor: _secondary,
            title: 'Diet Kitchen Supply',
            date: '02 Sep 2026 • Ward B Supply',
            amount: '-₹4,800',
            amountColor: _secondary,
            type: 'Expense',
            typeBg: _secondaryFixed,
            typeColor: const Color(0xFF351000),
            footerIcon: Icons.local_dining,
            footerText: 'Dietary Store',
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String date,
    required String amount,
    required Color amountColor,
    required String type,
    required Color typeBg,
    required Color typeColor,
    required IconData footerIcon,
    required String footerText,
    bool isSelectable = false,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: _surfaceLowest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: isSelectable ? _primaryFixedDim : _border, width: isSelectable ? 1.5 : 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(10.r)),
                      child: Icon(icon, size: 18.sp, color: iconColor),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textMain), overflow: TextOverflow.ellipsis),
                          SizedBox(height: 2.h),
                          Text(date, style: TextStyle(fontSize: 10.sp, color: _textVariant), overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(amount, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: amountColor)),
                  SizedBox(height: 4.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(color: typeBg, borderRadius: BorderRadius.circular(10.r)),
                    child: Text(type, style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: typeColor)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(footerIcon, size: 12.sp, color: isSelectable ? _primary : _textVariant),
                  SizedBox(width: 4.w),
                  Text(footerText, style: TextStyle(fontSize: 9.sp, color: _textVariant)),
                ],
              ),
              if (isSelectable)
                Row(
                  children: [
                    Text('View Dossier', style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: _primary)),
                    Icon(Icons.chevron_right, size: 14.sp, color: _primary),
                  ],
                )
              else
                Icon(Icons.chevron_right, size: 14.sp, color: _textVariant),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionDossier() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: _surfaceLowest,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: _border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 28.w,
                      height: 28.w,
                      decoration: const BoxDecoration(color: _primaryFixed, shape: BoxShape.circle),
                      child: Icon(Icons.receipt_long, size: 14.sp, color: const Color(0xFF301400)),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Audit Dossier', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: _textMain)),
                        Text('TXN #09821', style: TextStyle(fontSize: 9.sp, color: _textVariant)),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(color: _errorContainer, borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 6.sp, color: _error),
                      SizedBox(width: 4.w),
                      Text('Expense', style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold, color: _onErrorContainer)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(color: _surfaceLow, borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: _surfaceHigh,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(Icons.pets, color: _outline, size: 20.sp),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bella', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: _textMain)),
                        Text('Fracture Surgery', style: TextStyle(fontSize: 10.sp, color: _textVariant)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            _buildDossierRow('Amount', '₹6,400', isAmount: true),
            SizedBox(height: 8.h),
            _buildDossierRow('Category', 'Surgery', isBold: true),
            SizedBox(height: 8.h),
            _buildDossierRow('Date', '28 Sep 2026'),
            SizedBox(height: 8.h),
            _buildDossierRow('Case File', '#00417', isHighlighted: true),
            SizedBox(height: 8.h),
            _buildDossierRow('Surgeon', 'Dr. Gandhi'),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(color: _surfaceContainer, borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.verified, size: 16.sp, color: _primary),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Authorized', style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: _textMain)),
                          Text('Super Admin', style: TextStyle(fontSize: 9.sp, color: _textVariant)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 28.w,
                    height: 28.w,
                    decoration: const BoxDecoration(color: _surfaceHigh, shape: BoxShape.circle),
                    child: Icon(Icons.print, size: 14.sp, color: _textMain),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDossierRow(String label, String value, {bool isAmount = false, bool isBold = false, bool isHighlighted = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 10.sp, color: _textVariant)),
        Text(
          value,
          style: TextStyle(
            fontSize: isAmount ? 12.sp : 10.sp,
            fontWeight: isAmount || isBold || isHighlighted ? FontWeight.bold : FontWeight.normal,
            color: isAmount ? _error : (isHighlighted ? _primary : _textMain),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: _primaryContainer,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              minimumSize: Size(double.infinity, 44.h),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.receipt_long, size: 16.sp),
                SizedBox(width: 6.w),
                Text('View Complete Ledger', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: _surfaceHigh,
              foregroundColor: _textMain,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              minimumSize: Size(double.infinity, 44.h),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.download, size: 16.sp, color: _primary),
                SizedBox(width: 6.w),
                Text('Download Summary', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

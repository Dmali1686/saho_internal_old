import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Professional Typography System for SAWO
///
/// Size scale (px):
///   headline   → 18  (screen titles, section headers)
///   title      → 15  (card titles, modal headers)
///   body       → 13  (default body text)
///   caption    → 11  (labels, hints, timestamps)
///   overline   → 10  (ALL-CAPS category labels)
///
/// Design rule:
///   - Never use fontSize > 18 inside a Scaffold body.
///   - Stat values (KPI numbers) may go up to 26 max.
///   - Never hard-code sizes in widgets; always reference this class.
class AppTextStyles {
  AppTextStyles._();

  // ── Headline ──────────────────────────────────────────
  static const headline = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
    letterSpacing: -0.2,
    height: 1.3,
  );

  static const headlineMuted = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.textMuted,
    letterSpacing: -0.2,
    height: 1.3,
  );

  // ── Title ─────────────────────────────────────────────
  static const title = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
    letterSpacing: -0.1,
    height: 1.4,
  );

  static const titlePrimary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    letterSpacing: -0.1,
    height: 1.4,
  );

  // ── Body ──────────────────────────────────────────────
  static const body = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    height: 1.5,
  );

  static const bodyMuted = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.5,
  );

  static const bodySemiBold = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
    height: 1.5,
  );

  // ── Caption ───────────────────────────────────────────
  static const caption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.4,
  );

  static const captionSemiBold = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.textMuted,
    height: 1.4,
  );

  static const captionPrimary = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    height: 1.4,
  );

  // ── Overline (ALL-CAPS labels) ─────────────────────────
  static const overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: AppColors.textMuted,
    letterSpacing: 1.0,
    height: 1.2,
  );

  // ── KPI / Stat values ─────────────────────────────────
  /// Large metric number (e.g. "84", "18"). Max for any numeric KPI.
  static const statLarge = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w800,
    height: 1.0,
    letterSpacing: -0.5,
  );

  /// Medium metric (e.g. secondary stats)
  static const statMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.0,
    letterSpacing: -0.3,
  );

  // ── Button ────────────────────────────────────────────
  static const button = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  // ── Misc helpers ──────────────────────────────────────
  static const sectionHeader = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
    letterSpacing: 0.1,
  );

  static const badge = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
  );
}

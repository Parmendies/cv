import 'package:cv/constants/all.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final bool isDark;

  const AboutSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.pagePadding(context),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(AppConstants.containerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w300,
                color:
                    isDark
                        ? AppConstants.darkTextPrimary
                        : AppConstants.lightTextPrimary,
                letterSpacing: -1,
              ),
            ),
            SizedBox(height: AppConstants.spacingXXXL),

            Container(
              padding: EdgeInsets.all(AppConstants.spacingXXL),
              decoration: BoxDecoration(
                color: isDark ? AppConstants.darkCard : AppConstants.lightCard,
                borderRadius: BorderRadius.circular(AppConstants.cardRadius),
                border: Border.all(
                  color:
                      isDark
                          ? AppConstants.darkBorder
                          : AppConstants.lightBorder,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, I'm a passionate Flutter developer with a clean, minimal approach to building beautiful mobile applications.",
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.7,
                      color:
                          isDark
                              ? AppConstants.darkTextPrimary
                              : AppConstants.lightTextPrimary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: AppConstants.spacingXL),
                  Text(
                    "I focus on creating user-centric solutions with attention to detail and performance optimization.",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color:
                          isDark
                              ? AppConstants.darkTextSecondary
                              : AppConstants.lightTextSecondary,
                    ),
                  ),
                  SizedBox(height: AppConstants.spacingXXL),

                  // Stats
                  Row(
                    children: [
                      _buildStat("2+", "Years", isDark),
                      SizedBox(width: AppConstants.spacingXXL),
                      _buildStat("15+", "Projects", isDark),
                      SizedBox(width: AppConstants.spacingXXL),
                      _buildStat("5+", "Technologies", isDark),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String number, String label, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color:
                isDark
                    ? AppConstants.darkTextPrimary
                    : AppConstants.lightTextPrimary,
          ),
        ),
        SizedBox(height: AppConstants.spacingXS),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color:
                isDark
                    ? AppConstants.darkTextSecondary
                    : AppConstants.lightTextSecondary,
          ),
        ),
      ],
    );
  }
}

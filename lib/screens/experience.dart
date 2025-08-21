import 'package:cv/constants/all.dart';
import 'package:cv/constants/cv.dart';
import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  final bool isDark;

  const ExperienceSection({super.key, required this.isDark});

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
              "Experience",
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

            ...experiences.map(
              (exp) => Container(
                margin: EdgeInsets.only(bottom: AppConstants.spacingXXL),
                padding: EdgeInsets.all(AppConstants.spacingXXL),
                decoration: BoxDecoration(
                  color:
                      isDark ? AppConstants.darkCard : AppConstants.lightCard,
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
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            exp.company,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color:
                                  isDark
                                      ? AppConstants.darkTextPrimary
                                      : AppConstants.lightTextPrimary,
                            ),
                          ),
                        ),
                        Text(
                          exp.duration,
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                isDark
                                    ? AppConstants.darkTextSecondary
                                    : AppConstants.lightTextSecondary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstants.spacingS),
                    Text(
                      exp.position,
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            isDark
                                ? AppConstants.darkTextSecondary
                                : AppConstants.lightTextSecondary,
                      ),
                    ),
                    SizedBox(height: AppConstants.spacingL),
                    Text(
                      exp.description,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color:
                            isDark
                                ? AppConstants.darkTextSecondary
                                : AppConstants.lightTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

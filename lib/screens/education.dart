import 'package:cv/constants/all.dart';
import 'package:cv/models/education.dart';
import 'package:flutter/material.dart';

class EducationSection extends StatelessWidget {
  final bool isDark;

  const EducationSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final educations = [
      Education(
        institution: "Technical University",
        degree: "Computer Engineering",
        duration: "2018 - 2022",
        description:
            "Software engineering, algorithm analysis, data structures, and mobile app development.",
      ),
      Education(
        institution: "Google",
        degree: "Flutter Development Certificate",
        duration: "2022",
        description:
            "Official Google certification program for in-depth Flutter framework learning.",
      ),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.all(AppConstants.containerPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Education",
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

          ...educations.map(
            (edu) => Container(
              margin: EdgeInsets.only(bottom: AppConstants.spacingXXL),
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
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          edu.degree,
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
                        edu.duration,
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
                    edu.institution,
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
                    edu.description,
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
    );
  }
}

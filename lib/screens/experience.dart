import 'package:cv/constants/all.dart';
import 'package:cv/models/experience.dart';
import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  final bool isDark;

  const ExperienceSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final experiences = [
      Experience(
        company: "Tech Company A",
        position: "Senior Flutter Developer",
        duration: "2023 - Present",
        description:
            "Leading mobile app development using Flutter. Focus on performance optimization and user experience.",
      ),
      Experience(
        company: "Startup B",
        position: "Mobile Developer",
        duration: "2022 - 2023",
        description:
            "Rapid prototyping and MVP development in an agile startup environment.",
      ),
      Experience(
        company: "Freelance",
        position: "Flutter Developer",
        duration: "2021 - 2022",
        description:
            "Developed mobile applications for various clients, gaining experience in project management.",
      ),
    ];

    return SingleChildScrollView(
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
                          exp.position,
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
                    exp.company,
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
    );
  }
}

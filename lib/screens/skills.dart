import 'package:cv/constants/all.dart';
import 'package:cv/models/skill_categorty.dart';
import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  final bool isDark;

  const SkillsSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final skillCategories = [
      SkillCategory(
        title: "Frontend & Mobile",
        skills: ["Flutter", "Dart", "React Native", "JavaScript"],
      ),
      SkillCategory(
        title: "Backend & Database",
        skills: ["Node.js", "Firebase", "MongoDB", "PostgreSQL"],
      ),
      SkillCategory(
        title: "Tools & Others",
        skills: ["Git", "REST API", "UI/UX Design", "Agile/Scrum"],
      ),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.all(AppConstants.containerPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Skills",
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

          ...skillCategories.map(
            (category) => Container(
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
                  Text(
                    category.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color:
                          isDark
                              ? AppConstants.darkTextPrimary
                              : AppConstants.lightTextPrimary,
                    ),
                  ),
                  SizedBox(height: AppConstants.spacingL),
                  Wrap(
                    spacing: AppConstants.spacingM,
                    runSpacing: AppConstants.spacingM,
                    children:
                        category.skills
                            .map(
                              (skill) => Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppConstants.spacingL,
                                  vertical: AppConstants.spacingM,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isDark
                                          ? AppConstants.darkBorder
                                          : AppConstants.lightBorder,
                                  borderRadius: BorderRadius.circular(
                                    AppConstants.borderRadius,
                                  ),
                                ),
                                child: Text(
                                  skill,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        isDark
                                            ? AppConstants.darkTextSecondary
                                            : AppConstants.lightTextSecondary,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
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

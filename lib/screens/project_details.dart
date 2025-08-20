import 'package:flutter/material.dart';
import 'package:cv/constants/all.dart';
import 'package:cv/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailPage extends StatelessWidget {
  final Project project;
  final bool isDark;

  const ProjectDetailPage({
    super.key,
    required this.project,
    required this.isDark,
  });

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDark ? AppConstants.darkBackground : AppConstants.lightBackground,
      appBar: AppBar(
        backgroundColor:
            isDark ? AppConstants.darkCard : AppConstants.lightCard,
        title: Text(project.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppConstants.containerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.coverImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(AppConstants.cardRadius),
                child: Image.asset(project.coverImage!, fit: BoxFit.cover),
              ),
            SizedBox(height: AppConstants.spacingXL),

            Text(
              project.title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color:
                    isDark
                        ? AppConstants.darkTextPrimary
                        : AppConstants.lightTextPrimary,
              ),
            ),
            SizedBox(height: AppConstants.spacingL),

            Text(
              project.description,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color:
                    isDark
                        ? AppConstants.darkTextSecondary
                        : AppConstants.lightTextSecondary,
              ),
            ),
            SizedBox(height: AppConstants.spacingXL),

            Wrap(
              spacing: AppConstants.spacingS,
              runSpacing: AppConstants.spacingS,
              children:
                  project.technologies
                      .map(
                        (tech) => Chip(
                          label: Text(tech),
                          backgroundColor:
                              isDark
                                  ? AppConstants.darkBorder
                                  : AppConstants.lightBorder,
                          labelStyle: TextStyle(
                            color:
                                isDark
                                    ? AppConstants.darkTextSecondary
                                    : AppConstants.lightTextSecondary,
                          ),
                        ),
                      )
                      .toList(),
            ),

            SizedBox(height: AppConstants.spacingXL),

            if (project.url != null)
              ElevatedButton(
                onPressed: () => _launchUrl(project.url!),
                child: const Text("View Project"),
              ),
          ],
        ),
      ),
    );
  }
}

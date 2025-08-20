import 'package:cv/constants/all.dart';
import 'package:cv/models/project.dart';
import 'package:cv/screens/project_detail_dialog.dart';
import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  final bool isDark;

  const ProjectsSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final projects = [
      //1
      Project(
        title: "Wordly",
        description:
            "Modern weather application with real-time data and beautiful animations. Features location-based weather, forecasts, and stunning visual effects.",
        technologies: ["Flutter", 'Firebase', "Google TTF"],
        coverImage: "assets/wordly/wordly.png",
        gallery: List.generate(4, (index) => "assets/wordly/${index + 1}.webp"),
        liveUrl:
            "https://play.google.com/store/apps/details?id=com.wordly.app.tr",
      ),
      //2
      Project(
        title: "Blindlook",
        description:
            "Modern weather application with real-time data and beautiful animations. Features location-based weather, forecasts, and stunning visual effects.",
        technologies: ["Flutter", 'Firebase', "Google TTF"],
        coverImage: "assets/blindlook/blindlook.webp",
        gallery: List.generate(
          4,
          (index) => "assets/blindlook/${index + 1}.webp",
        ),
        liveUrl: "https://blindlook.com/",
      ),
      //3
      Project(
        title: "APTI",
        description:
            "Productivity app for task tracking and management with clean interface. Features categories, priorities, deadlines, and team collaboration.",
        technologies: ["Flutter", "Notifications"],
        coverImage: "assets/apti/apti.png",
        gallery: List.generate(4, (index) => "assets/apti/${index + 1}.PNG"),
        liveUrl:
            "https://www.yapiradar.com/PazarYeri/Firma/apti-online-site-apartman-ve-plaza-yonetim-teknolojileri-as",
      ),
      //4
      Project(
        title: "Fallasana",
        description:
            "A smart tool that helps prevent and detect copied content using advanced AI algorithms. Available as a web app with real-time analysis.",
        technologies: ["Flutter Web", "AI", "Machine Learning", "API"],
        coverImage: "assets/fallasana/fallasana.webp",
        gallery: List.generate(
          4,
          (index) => "assets/fallasana/${index + 1}.png",
        ),
        liveUrl: "https://fallasana.com/",
      ),
      //5
      Project(
        title: "Anında App",
        description:
            "Full-featured e-commerce application built with Flutter. Features product catalog, cart, and payment integration with beautiful UI/UX design.",
        technologies: ["Flutter", "Stripe", "Provider"],
        coverImage: "assets/aninda/aninda.png",
        gallery: List.generate(13, (index) => "assets/aninda/${index + 1}.png"),
      ),
      //6
      Project(
        title: "Deste Yönetim",
        description:
            "Full-featured e-commerce application built with Flutter. Features product catalog, cart, and payment integration with beautiful UI/UX design.",
        technologies: ["Flutter", "Stripe", "Provider"],
        coverImage: "assets/deste-yonetim/destek_yonteim_hizmetleri.PNG",
        gallery: List.generate(
          4,
          (index) => "assets/deste-yonetim/${index + 1}.PNG",
        ),
      ),
      //7
      Project(
        title: "Podium",
        description:
            "Full-featured e-commerce application built with Flutter. Features product catalog, cart, and payment integration with beautiful UI/UX design.",
        technologies: ["Flutter", "Stripe", "Provider"],
        coverImage: "assets/podium/podium.png",
        gallery: List.generate(12, (index) => "assets/podium/${index + 1}.png"),
      ),
      Project(
        title: "SoruSakla",
        description:
            "Full-featured e-commerce application built with Flutter. Features product catalog, cart, and payment integration with beautiful UI/UX design.",
        technologies: ["Flutter", "Stripe", "Provider"],
        coverImage: "assets/sorusakla/sorusakla.png",
        gallery: List.generate(
          11,
          (index) => "assets/sorusakla/ (${index + 1}).png",
        ),
      ),
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    int crossAxisCount;
    double childAspectRatio;

    if (isMobile) {
      crossAxisCount = 1;
      childAspectRatio = 1.5;
    } else if (isTablet) {
      crossAxisCount = 2;
      childAspectRatio = 1.3;
    } else {
      crossAxisCount = 2;
      childAspectRatio = 1.2;
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(
        isMobile ? AppConstants.spacingL : AppConstants.containerPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Projects",
            style: TextStyle(
              fontSize: isMobile ? 32 : 40,
              fontWeight: FontWeight.w300,
              color:
                  isDark
                      ? AppConstants.darkTextPrimary
                      : AppConstants.lightTextPrimary,
              letterSpacing: -1,
            ),
          ),
          SizedBox(
            height:
                isMobile ? AppConstants.spacingXXL : AppConstants.spacingXXXL,
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: childAspectRatio,
              crossAxisSpacing:
                  isMobile ? AppConstants.spacingL : AppConstants.spacingXL,
              mainAxisSpacing:
                  isMobile ? AppConstants.spacingL : AppConstants.spacingXL,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return _ProjectCard(
                project: project,
                isDark: isDark,
                isMobile: isMobile,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final bool isDark;
  final bool isMobile;

  const _ProjectCard({
    required this.project,
    required this.isDark,
    required this.isMobile,
  });

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
    _elevationAnimation = Tween<double>(begin: 0.0, end: 8.0).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    if (_isHovered != isHovered) {
      setState(() {
        _isHovered = isHovered;
      });
      if (isHovered) {
        _hoverController.forward();
      } else {
        _hoverController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _hoverController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: MouseRegion(
            onEnter: (_) => _onHover(true),
            onExit: (_) => _onHover(false),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder:
                      (context) => ProjectDetailDialog(
                        project: widget.project,
                        isDark: widget.isDark,
                      ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      widget.isDark
                          ? AppConstants.darkCard
                          : AppConstants.lightCard,
                  borderRadius: BorderRadius.circular(AppConstants.cardRadius),
                  border: Border.all(
                    color:
                        widget.isDark
                            ? AppConstants.darkBorder
                            : AppConstants.lightBorder,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: (widget.isDark ? Colors.black : Colors.grey)
                          .withOpacity(0.1),
                      blurRadius: _elevationAnimation.value,
                      offset: Offset(0, _elevationAnimation.value / 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cover Image
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppConstants.cardRadius),
                            topRight: Radius.circular(AppConstants.cardRadius),
                          ),
                          child:
                              widget.project.coverImage != null
                                  ? Image.asset(
                                    widget.project.coverImage!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color:
                                            widget.isDark
                                                ? AppConstants.darkBorder
                                                : AppConstants.lightBorder,
                                        child: Icon(
                                          Icons.image_not_supported,
                                          size: 48,
                                          color:
                                              widget.isDark
                                                  ? AppConstants
                                                      .darkTextSecondary
                                                  : AppConstants
                                                      .lightTextSecondary,
                                        ),
                                      );
                                    },
                                  )
                                  : Container(
                                    color:
                                        widget.isDark
                                            ? AppConstants.darkBorder
                                            : AppConstants.lightBorder,
                                    child: Icon(
                                      Icons.code,
                                      size: 48,
                                      color:
                                          widget.isDark
                                              ? AppConstants.darkTextSecondary
                                              : AppConstants.lightTextSecondary,
                                    ),
                                  ),
                        ),
                      ),
                    ),

                    // Content
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(
                          widget.isMobile
                              ? AppConstants.spacingL
                              : AppConstants.spacingXL,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              widget.project.title,
                              style: TextStyle(
                                fontSize: widget.isMobile ? 16 : 18,
                                fontWeight: FontWeight.w600,
                                color:
                                    widget.isDark
                                        ? AppConstants.darkTextPrimary
                                        : AppConstants.lightTextPrimary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: AppConstants.spacingM),

                            // Description
                            Expanded(
                              child: Text(
                                widget.project.description,
                                style: TextStyle(
                                  fontSize: widget.isMobile ? 12 : 14,
                                  height: 1.4,
                                  color:
                                      widget.isDark
                                          ? AppConstants.darkTextSecondary
                                          : AppConstants.lightTextSecondary,
                                ),
                                maxLines: widget.isMobile ? 2 : 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: AppConstants.spacingM),

                            // Technologies
                            Wrap(
                              spacing: AppConstants.spacingS,
                              runSpacing: AppConstants.spacingXS,
                              children:
                                  widget.project.technologies
                                      .take(widget.isMobile ? 2 : 3)
                                      .map(
                                        (tech) => Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: AppConstants.spacingS,
                                            vertical: AppConstants.spacingXS,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                widget.isDark
                                                    ? AppConstants.darkBorder
                                                    : AppConstants.lightBorder,
                                            borderRadius: BorderRadius.circular(
                                              AppConstants.borderRadius,
                                            ),
                                          ),
                                          child: Text(
                                            tech,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color:
                                                  widget.isDark
                                                      ? AppConstants
                                                          .darkTextSecondary
                                                      : AppConstants
                                                          .lightTextSecondary,
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
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:cv/constants/all.dart';
import 'package:cv/constants/cv.dart';
import 'package:cv/models/project.dart';
import 'package:cv/screens/project_detail_dialog.dart';
import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  final bool isDark;

  const ProjectsSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1200;
    final isDesktop = screenWidth >= 1200;

    int crossAxisCount;
    double childAspectRatio;
    double horizontalPadding;

    if (isMobile) {
      crossAxisCount = 1;
      childAspectRatio = 0.85; // Taller cards for better content visibility
      horizontalPadding = 16;
    } else if (isTablet) {
      crossAxisCount = 2;
      childAspectRatio = 0.8; // Better ratio for tablet
      horizontalPadding = 24;
    } else {
      crossAxisCount = 3; // Show 3 columns on desktop for better use of space
      childAspectRatio = 0.75; // Optimal ratio for desktop
      horizontalPadding = AppConstants.containerPadding;
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 16 : AppConstants.containerPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Projects",
            style: TextStyle(
              fontSize: isMobile ? 32 : (isTablet ? 36 : 40),
              fontWeight: FontWeight.w300,
              color:
                  isDark
                      ? AppConstants.darkTextPrimary
                      : AppConstants.lightTextPrimary,
              letterSpacing: -1,
            ),
          ),
          SizedBox(
            height: isMobile ? 24 : (isTablet ? 32 : AppConstants.spacingXXXL),
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: childAspectRatio,
              crossAxisSpacing:
                  isMobile ? 16 : (isTablet ? 20 : AppConstants.spacingXL),
              mainAxisSpacing:
                  isMobile ? 16 : (isTablet ? 20 : AppConstants.spacingXL),
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return _ProjectCard(
                project: project,
                isDark: isDark,
                isMobile: isMobile,
                isTablet: isTablet,
                isDesktop: isDesktop,
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
  final bool isTablet;
  final bool isDesktop;

  const _ProjectCard({
    required this.project,
    required this.isDark,
    required this.isMobile,
    required this.isTablet,
    required this.isDesktop,
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
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
    _elevationAnimation = Tween<double>(begin: 0.0, end: 12.0).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    if (_isHovered != isHovered && !widget.isMobile) {
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
          scale: widget.isMobile ? 1.0 : _scaleAnimation.value,
          child: MouseRegion(
            onEnter: (_) => _onHover(true),
            onExit: (_) => _onHover(false),
            cursor: SystemMouseCursors.click,
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
                          .withOpacity(widget.isMobile ? 0.05 : 0.1),
                      blurRadius:
                          widget.isMobile ? 4 : _elevationAnimation.value,
                      offset: Offset(
                        0,
                        widget.isMobile ? 2 : _elevationAnimation.value / 2,
                      ),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cover Image - Responsive height
                    Expanded(
                      flex: widget.isMobile ? 5 : (widget.isTablet ? 4 : 5),
                      child: Container(
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
                                    height: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      return _buildPlaceholderImage();
                                    },
                                  )
                                  : _buildPlaceholderImage(),
                        ),
                      ),
                    ),

                    // Content - More space allocated
                    Expanded(
                      flex: widget.isMobile ? 6 : (widget.isTablet ? 6 : 5),
                      child: Padding(
                        padding: EdgeInsets.all(
                          widget.isMobile ? 16 : (widget.isTablet ? 18 : 20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Title
                            Text(
                              widget.project.title,
                              style: TextStyle(
                                fontSize:
                                    widget.isMobile
                                        ? 18
                                        : (widget.isTablet ? 17 : 18),
                                fontWeight: FontWeight.w600,
                                color:
                                    widget.isDark
                                        ? AppConstants.darkTextPrimary
                                        : AppConstants.lightTextPrimary,
                                height: 1.2,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: widget.isMobile ? 8 : 10),

                            // Description - More space and better sizing
                            Expanded(
                              flex: 3,
                              child: Text(
                                widget.project.description,
                                style: TextStyle(
                                  fontSize:
                                      widget.isMobile
                                          ? 14
                                          : (widget.isTablet ? 13 : 14),
                                  height: 1.4,
                                  color:
                                      widget.isDark
                                          ? AppConstants.darkTextSecondary
                                          : AppConstants.lightTextSecondary,
                                ),
                                maxLines:
                                    widget.isMobile
                                        ? 4
                                        : (widget.isTablet ? 3 : 4),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: widget.isMobile ? 12 : 10),

                            // Technologies - Better responsive handling
                            Flexible(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    spacing: widget.isMobile ? 6 : 8,
                                    runSpacing: widget.isMobile ? 4 : 6,
                                    children:
                                        widget.project.technologies
                                            .take(_getTechCount())
                                            .map((tech) => _buildTechChip(tech))
                                            .toList(),
                                  ),
                                  if (widget.project.technologies.length >
                                      _getTechCount())
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        '+${widget.project.technologies.length - _getTechCount()} more',
                                        style: TextStyle(
                                          fontSize: widget.isMobile ? 10 : 11,
                                          color:
                                              widget.isDark
                                                  ? AppConstants.darkTextMuted
                                                  : AppConstants.lightTextMuted,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
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

  Widget _buildPlaceholderImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors:
              widget.isDark
                  ? [AppConstants.darkBorder, AppConstants.darkSurface]
                  : [AppConstants.lightBorder, AppConstants.lightSurface],
        ),
      ),
      child: Icon(
        widget.project.coverImage != null
            ? Icons.image_not_supported
            : Icons.code,
        size: widget.isMobile ? 32 : 40,
        color:
            widget.isDark
                ? AppConstants.darkTextSecondary
                : AppConstants.lightTextSecondary,
      ),
    );
  }

  Widget _buildTechChip(String tech) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.isMobile ? 8 : 10,
        vertical: widget.isMobile ? 4 : 5,
      ),
      decoration: BoxDecoration(
        color:
            widget.isDark
                ? AppConstants.darkBorder.withOpacity(0.7)
                : AppConstants.lightBorder.withOpacity(0.7),
        borderRadius: BorderRadius.circular(
          widget.isMobile ? 12 : AppConstants.borderRadius,
        ),
        border:
            widget.isDark
                ? null
                : Border.all(
                  color: AppConstants.lightBorder.withOpacity(0.3),
                  width: 0.5,
                ),
      ),
      child: Text(
        tech,
        style: TextStyle(
          fontSize: widget.isMobile ? 11 : (widget.isTablet ? 10 : 11),
          fontWeight: FontWeight.w500,
          color:
              widget.isDark
                  ? AppConstants.darkTextSecondary
                  : AppConstants.lightTextSecondary,
        ),
      ),
    );
  }

  int _getTechCount() {
    if (widget.isMobile) return 3;
    if (widget.isTablet) return 3;
    return 4; // Desktop
  }
}

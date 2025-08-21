import 'package:cv/constants/all.dart';
import 'package:cv/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailDialog extends StatefulWidget {
  final Project project;
  final bool isDark;

  const ProjectDetailDialog({
    super.key,
    required this.project,
    required this.isDark,
  });

  @override
  _ProjectDetailDialogState createState() => _ProjectDetailDialogState();
}

class _ProjectDetailDialogState extends State<ProjectDetailDialog>
    with TickerProviderStateMixin {
  late AnimationController _dialogController;
  late AnimationController _contentController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late ScrollController scrollController;

  PageController? _pageController;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();

    _dialogController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _contentController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _dialogController, curve: Curves.elasticOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _dialogController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _contentController, curve: Curves.easeOutCubic),
    );

    // Start animations
    _dialogController.forward();
    Future.delayed(Duration(milliseconds: 200), () {
      if (mounted) _contentController.forward();
    });

    // Initialize page controller for all images (cover + gallery)
    final images = widget.project.gallery ?? [];

    if (images.isNotEmpty) {
      _pageController = PageController();
    }
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    _dialogController.dispose();
    _contentController.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  void _closeDialog() async {
    await _contentController.reverse();
    await _dialogController.reverse();
    if (mounted) Navigator.of(context).pop();
  }

  void _launchUrl(String url) {
    try {
      launchUrl(Uri.parse(url));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to launch URL: $e'),
          backgroundColor:
              widget.isDark ? AppConstants.darkCard : AppConstants.lightCard,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 768;
    final dialogWidth =
        isMobile ? screenSize.width * 0.95 : screenSize.width * 0.8;
    final dialogHeight =
        isMobile ? screenSize.height * 0.9 : screenSize.height * 0.85;

    return AnimatedBuilder(
      animation: _dialogController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(0.7 * _fadeAnimation.value),
          body: Center(
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                width: dialogWidth,
                height: dialogHeight,
                margin: EdgeInsets.all(AppConstants.spacingL),
                decoration: BoxDecoration(
                  color:
                      widget.isDark
                          ? AppConstants.darkSurface
                          : AppConstants.lightSurface,
                  borderRadius: BorderRadius.circular(
                    AppConstants.cardRadius * 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 30,
                      offset: Offset(0, 15),
                    ),
                  ],
                ),
                child: SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _contentController,
                    child: _buildDialogContent(isMobile),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDialogContent(bool isMobile) {
    return Column(
      children: [
        // Header
        _buildHeader(isMobile),

        // Content
        Expanded(
          child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        ),
      ],
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(AppConstants.spacingXL),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color:
                widget.isDark
                    ? AppConstants.darkBorder
                    : AppConstants.lightBorder,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.project.title,
                  style: TextStyle(
                    fontSize: isMobile ? 24 : 28,
                    fontWeight: FontWeight.w700,
                    color:
                        widget.isDark
                            ? AppConstants.darkTextPrimary
                            : AppConstants.lightTextPrimary,
                  ),
                ),
                SizedBox(height: AppConstants.spacingS),
                Wrap(
                  spacing: AppConstants.spacingS,
                  runSpacing: AppConstants.spacingXS,
                  children:
                      widget.project.technologies
                          .map(
                            (tech) => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppConstants.spacingM,
                                vertical: AppConstants.spacingS,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    widget.isDark
                                        ? AppConstants.darkCard
                                        : AppConstants.lightCard,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color:
                                      widget.isDark
                                          ? AppConstants.darkBorder
                                          : AppConstants.lightBorder,
                                ),
                              ),
                              child: Text(
                                tech,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      widget.isDark
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
          IconButton(
            onPressed: _closeDialog,
            icon: Icon(
              Icons.close,
              color:
                  widget.isDark
                      ? AppConstants.darkTextSecondary
                      : AppConstants.lightTextSecondary,
            ),
            iconSize: 28,
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppConstants.spacingXL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Gallery
          _buildImageGallery(true),
          SizedBox(height: AppConstants.spacingXXL),

          // Description
          _buildDescription(),
          SizedBox(height: AppConstants.spacingXXL),

          // Action Buttons
          _buildActionButtons(true),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Padding(
      padding: EdgeInsets.all(AppConstants.spacingXXL),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Side - Images (Centered and optimized for mobile screenshots)
          Expanded(flex: 2, child: Center(child: _buildImageGallery(false))),
          SizedBox(width: AppConstants.spacingXXL),

          // Right Side - Content
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDescription(),
                SizedBox(height: AppConstants.spacingXXL),
                _buildActionButtons(false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGallery(bool isMobile) {
    final images = widget.project.gallery ?? [];
    if (images.isEmpty) return SizedBox.shrink();

    return Column(
      children: [
        // Gallery 6 kısım kaplıyor
        Expanded(
          flex: 6,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentImageIndex = index);
              },
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(child: Image.asset(images[index]));
                            },
                          );
                        },
                        icon: Icon(Icons.zoom_out_map),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                _pageController?.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              icon: Icon(Icons.arrow_back),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),

                          child: Image.asset(
                            images[index],
                            fit: BoxFit.contain, // oran korunuyor
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                _pageController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              icon: Icon(Icons.arrow_forward),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),

        if (images.length > 1) ...[
          SizedBox(height: AppConstants.spacingM),

          // Thumbnail 1 kısım kaplıyor
          Expanded(
            flex: 1,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    scrollController.animateTo(
                      scrollController.position.pixels - 100,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.spacingM,
                    ),
                    itemBuilder: (context, index) {
                      final isSelected = index == _currentImageIndex;
                      return GestureDetector(
                        onTap: () => _pageController?.jumpToPage(index),
                        child: Container(
                          margin: EdgeInsets.only(right: AppConstants.spacingM),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected ? Colors.black : Colors.grey,
                              width: isSelected ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    scrollController.animateTo(
                      scrollController.position.pixels + 100,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About this project",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color:
                widget.isDark
                    ? AppConstants.darkTextPrimary
                    : AppConstants.lightTextPrimary,
          ),
        ),
        SizedBox(height: AppConstants.spacingL),
        Text(
          widget.project.description,
          style: TextStyle(
            fontSize: 14,
            height: 1.6,
            color:
                widget.isDark
                    ? AppConstants.darkTextSecondary
                    : AppConstants.lightTextSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(bool isMobile) {
    final buttons = <Widget>[];

    if (widget.project.liveUrl != null) {
      buttons.add(
        _buildActionButton(
          icon: Icons.launch,
          label: "Live Demo",
          onPressed: () => _launchUrl(widget.project.liveUrl!),
          isPrimary: true,
        ),
      );
    }

    if (widget.project.githubUrl != null) {
      buttons.add(
        _buildActionButton(
          icon: Icons.code,
          label: "View Code",
          onPressed: () => _launchUrl(widget.project.githubUrl!),
          isPrimary: false,
        ),
      );
    }

    if (widget.project.url != null) {
      buttons.add(
        _buildActionButton(
          icon: Icons.web,
          label: "Visit Site",
          onPressed: () => _launchUrl(widget.project.url!),
          isPrimary: buttons.isEmpty,
        ),
      );
    }

    if (buttons.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      children: [
        if (isMobile)
          Column(
            children:
                buttons
                    .map(
                      (button) => Padding(
                        padding: EdgeInsets.only(bottom: AppConstants.spacingM),
                        child: SizedBox(width: double.infinity, child: button),
                      ),
                    )
                    .toList(),
          )
        else
          Wrap(
            spacing: AppConstants.spacingM,
            runSpacing: AppConstants.spacingM,
            children: buttons,
          ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required bool isPrimary,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 18,
        color:
            isPrimary
                ? Colors.white
                : (widget.isDark
                    ? AppConstants.darkTextPrimary
                    : AppConstants.lightTextPrimary),
      ),
      label: Text(
        label,
        style: TextStyle(
          color:
              isPrimary
                  ? Colors.white
                  : (widget.isDark
                      ? AppConstants.darkTextPrimary
                      : AppConstants.lightTextPrimary),
          fontWeight: FontWeight.w500,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isPrimary
                ? (widget.isDark ? Colors.blue.shade600 : Colors.blue.shade500)
                : Colors.transparent,
        foregroundColor:
            isPrimary
                ? Colors.white
                : (widget.isDark
                    ? AppConstants.darkTextPrimary
                    : AppConstants.lightTextPrimary),
        side:
            isPrimary
                ? null
                : BorderSide(
                  color:
                      widget.isDark
                          ? AppConstants.darkBorder
                          : AppConstants.lightBorder,
                ),
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.spacingXL,
          vertical: AppConstants.spacingL,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        elevation: isPrimary ? 2 : 0,
      ),
    );
  }
}

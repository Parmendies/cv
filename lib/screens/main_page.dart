import 'package:cv/constants/all.dart';
import 'package:cv/screens/about.dart';
import 'package:cv/screens/contact.dart';
import 'package:cv/screens/education.dart';
import 'package:cv/screens/experience.dart';
import 'package:cv/screens/projects.dart';
import 'package:cv/screens/skills.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int selectedIndex = 0;
  ThemeMode themeMode = ThemeMode.system;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  bool _isSidebarOpen = false;

  final List<String> tabs = [
    'About',
    'Experience',
    'Projects',
    'Skills',
    'Education',
    'Contact',
  ];

  final List<IconData> tabIcons = [
    Icons.person_outline,
    Icons.work_outline,
    Icons.code_outlined,
    Icons.star_outline,
    Icons.school_outlined,
    Icons.mail_outline,
  ];

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeIn));
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _changeTab(int index) {
    if (index != selectedIndex) {
      _fadeController.reset();
      setState(() {
        selectedIndex = index;
        _isSidebarOpen = false; // Close sidebar on mobile after selection
      });
      _fadeController.forward();
    }
  }

  void _toggleTheme() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentIsDark =
        themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Scaffold(
      backgroundColor:
          currentIsDark
              ? AppConstants.darkBackground
              : AppConstants.lightBackground,
      body: Stack(
        children: [
          Row(
            children: [
              // Desktop/Tablet Sidebar
              if (!isMobile)
                SizedBox(
                  width: isTablet ? 200 : AppConstants.sidebarWidth,
                  child: _buildSidebar(currentIsDark, isTablet),
                ),

              // Main Content
              Expanded(
                child: Column(
                  children: [
                    // Mobile App Bar
                    if (isMobile)
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color:
                              currentIsDark
                                  ? AppConstants.darkSurface
                                  : AppConstants.lightSurface,
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  currentIsDark
                                      ? AppConstants.darkBorder
                                      : AppConstants.lightBorder,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.menu,
                                color:
                                    currentIsDark
                                        ? AppConstants.darkTextPrimary
                                        : AppConstants.lightTextPrimary,
                              ),
                              onPressed: _toggleSidebar,
                            ),
                            Expanded(
                              child: Text(
                                tabs[selectedIndex],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      currentIsDark
                                          ? AppConstants.darkTextPrimary
                                          : AppConstants.lightTextPrimary,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                currentIsDark
                                    ? Icons.light_mode_outlined
                                    : Icons.dark_mode_outlined,
                                color:
                                    currentIsDark
                                        ? AppConstants.darkTextSecondary
                                        : AppConstants.lightTextSecondary,
                              ),
                              onPressed: _toggleTheme,
                            ),
                          ],
                        ),
                      ),

                    // Content Area
                    Expanded(
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: _buildContent(currentIsDark),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Mobile Sidebar Overlay
          if (isMobile && _isSidebarOpen)
            GestureDetector(
              onTap: () => setState(() => _isSidebarOpen = false),
              child: Container(color: Colors.black.withOpacity(0.5)),
            ),

          // Mobile Sidebar
          if (isMobile)
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              left: _isSidebarOpen ? 0 : -280,
              top: 0,
              bottom: 0,
              child: Container(
                width: 280,
                child: _buildSidebar(currentIsDark, false),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSidebar(bool currentIsDark, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        color:
            currentIsDark
                ? AppConstants.darkSurface
                : AppConstants.lightSurface,
        border: Border(
          right: BorderSide(
            color:
                currentIsDark
                    ? AppConstants.darkBorder
                    : AppConstants.lightBorder,
            width: 1,
          ),
        ),
        boxShadow:
            MediaQuery.of(context).size.width < 768
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(2, 0),
                  ),
                ]
                : null,
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(
              isTablet ? AppConstants.spacingXL : AppConstants.spacingXXL,
            ),
            child: Column(
              children: [
                // Profile
                Container(
                  width: isTablet ? 60 : 80,
                  height: isTablet ? 60 : 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        currentIsDark
                            ? AppConstants.darkBorder
                            : AppConstants.lightBorder,
                  ),
                  child: Icon(
                    Icons.person_outline,
                    size: isTablet ? 24 : 32,
                    color:
                        currentIsDark
                            ? AppConstants.darkTextSecondary
                            : AppConstants.lightTextSecondary,
                  ),
                ),
                SizedBox(height: AppConstants.spacingL),
                Text(
                  "Your Name",
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 18,
                    fontWeight: FontWeight.w600,
                    color:
                        currentIsDark
                            ? AppConstants.darkTextPrimary
                            : AppConstants.lightTextPrimary,
                  ),
                ),
                SizedBox(height: AppConstants.spacingS),
                Text(
                  "Flutter Developer",
                  style: TextStyle(
                    fontSize: isTablet ? 12 : 14,
                    color:
                        currentIsDark
                            ? AppConstants.darkTextSecondary
                            : AppConstants.lightTextSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Navigation
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingL),
              child: Column(
                children: [
                  ...tabs.asMap().entries.map((entry) {
                    int index = entry.key;
                    String tab = entry.value;
                    final isSelected = selectedIndex == index;

                    return Container(
                      margin: EdgeInsets.only(bottom: AppConstants.spacingS),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => _changeTab(index),
                          borderRadius: BorderRadius.circular(
                            AppConstants.borderRadius,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.spacingM,
                              vertical: AppConstants.spacingM,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? (currentIsDark
                                          ? AppConstants.darkCard
                                          : AppConstants.lightCard)
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(
                                AppConstants.borderRadius,
                              ),
                              border:
                                  isSelected
                                      ? Border.all(
                                        color:
                                            currentIsDark
                                                ? AppConstants.darkBorder
                                                : AppConstants.lightBorder,
                                      )
                                      : null,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  tabIcons[index],
                                  size: 18,
                                  color:
                                      isSelected
                                          ? (currentIsDark
                                              ? AppConstants.darkTextPrimary
                                              : AppConstants.lightTextPrimary)
                                          : (currentIsDark
                                              ? AppConstants.darkTextSecondary
                                              : AppConstants
                                                  .lightTextSecondary),
                                ),
                                SizedBox(width: AppConstants.spacingM),
                                Text(
                                  tab,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                        isSelected
                                            ? FontWeight.w500
                                            : FontWeight.w400,
                                    color:
                                        isSelected
                                            ? (currentIsDark
                                                ? AppConstants.darkTextPrimary
                                                : AppConstants.lightTextPrimary)
                                            : (currentIsDark
                                                ? AppConstants.darkTextSecondary
                                                : AppConstants
                                                    .lightTextSecondary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          // Theme Toggle (Desktop/Tablet only, mobile has it in app bar)
          if (!(MediaQuery.of(context).size.width < 768))
            Padding(
              padding: EdgeInsets.all(AppConstants.spacingL),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _toggleTheme,
                  borderRadius: BorderRadius.circular(
                    AppConstants.borderRadius,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(AppConstants.spacingM),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            currentIsDark
                                ? AppConstants.darkBorder
                                : AppConstants.lightBorder,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppConstants.borderRadius,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          currentIsDark
                              ? Icons.light_mode_outlined
                              : Icons.dark_mode_outlined,
                          size: 18,
                          color:
                              currentIsDark
                                  ? AppConstants.darkTextSecondary
                                  : AppConstants.lightTextSecondary,
                        ),
                        if (!isTablet) ...[
                          SizedBox(width: AppConstants.spacingS),
                          Text(
                            currentIsDark ? 'Light' : 'Dark',
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  currentIsDark
                                      ? AppConstants.darkTextSecondary
                                      : AppConstants.lightTextSecondary,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent(bool isDark) {
    switch (selectedIndex) {
      case 0:
        return AboutSection(isDark: isDark);
      case 1:
        return ExperienceSection(isDark: isDark);
      case 2:
        return ProjectsSection(isDark: isDark);
      case 3:
        return SkillsSection(isDark: isDark);
      case 4:
        return EducationSection(isDark: isDark);
      case 5:
        return ContactSection(isDark: isDark);
      default:
        return AboutSection(isDark: isDark);
    }
  }
}

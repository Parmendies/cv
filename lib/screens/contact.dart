import 'package:cv/constants/all.dart';
import 'package:flutter/material.dart';

class ContactSection extends StatefulWidget {
  final bool isDark;

  const ContactSection({super.key, required this.isDark});

  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      // Simulate form submission
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        _isSubmitting = false;
      });

      // Clear form
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Message sent successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppConstants.containerPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w300,
              color:
                  widget.isDark
                      ? AppConstants.darkTextPrimary
                      : AppConstants.lightTextPrimary,
              letterSpacing: -1,
            ),
          ),
          SizedBox(height: AppConstants.spacingXXXL),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contact Information
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(AppConstants.spacingXXL),
                  decoration: BoxDecoration(
                    color:
                        widget.isDark
                            ? AppConstants.darkCard
                            : AppConstants.lightCard,
                    borderRadius: BorderRadius.circular(
                      AppConstants.cardRadius,
                    ),
                    border: Border.all(
                      color:
                          widget.isDark
                              ? AppConstants.darkBorder
                              : AppConstants.lightBorder,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get in Touch",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color:
                              widget.isDark
                                  ? AppConstants.darkTextPrimary
                                  : AppConstants.lightTextPrimary,
                        ),
                      ),
                      SizedBox(height: AppConstants.spacingL),
                      Text(
                        "Feel free to reach out for collaborations or just a friendly hello!",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color:
                              widget.isDark
                                  ? AppConstants.darkTextSecondary
                                  : AppConstants.lightTextSecondary,
                        ),
                      ),
                      SizedBox(height: AppConstants.spacingXXL),

                      // Contact Items
                      _buildContactItem(
                        Icons.email_outlined,
                        "Email",
                        "your.email@example.com",
                        widget.isDark,
                      ),
                      SizedBox(height: AppConstants.spacingL),
                      _buildContactItem(
                        Icons.phone_outlined,
                        "Phone",
                        "+1 (555) 123-4567",
                        widget.isDark,
                      ),
                      SizedBox(height: AppConstants.spacingL),
                      _buildContactItem(
                        Icons.location_on_outlined,
                        "Location",
                        "Your City, Country",
                        widget.isDark,
                      ),
                      SizedBox(height: AppConstants.spacingXXL),

                      // Social Links
                      Text(
                        "Social",
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
                      Row(
                        children: [
                          _buildSocialButton(
                            Icons.code,
                            "GitHub",
                            widget.isDark,
                          ),
                          SizedBox(width: AppConstants.spacingM),
                          _buildSocialButton(
                            Icons.work,
                            "LinkedIn",
                            widget.isDark,
                          ),
                          SizedBox(width: AppConstants.spacingM),
                          _buildSocialButton(
                            Icons.alternate_email,
                            "Twitter",
                            widget.isDark,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: AppConstants.spacingXXL),

              // Contact Form
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(AppConstants.spacingXXL),
                  decoration: BoxDecoration(
                    color:
                        widget.isDark
                            ? AppConstants.darkCard
                            : AppConstants.lightCard,
                    borderRadius: BorderRadius.circular(
                      AppConstants.cardRadius,
                    ),
                    border: Border.all(
                      color:
                          widget.isDark
                              ? AppConstants.darkBorder
                              : AppConstants.lightBorder,
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Send Message",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color:
                                widget.isDark
                                    ? AppConstants.darkTextPrimary
                                    : AppConstants.lightTextPrimary,
                          ),
                        ),
                        SizedBox(height: AppConstants.spacingXXL),

                        // Name Field
                        _buildTextField(
                          controller: _nameController,
                          label: "Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: AppConstants.spacingL),
                        _buildTextField(
                          controller: _emailController,
                          label: "Email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}',
                            ).hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: AppConstants.spacingL),

                        // Message Field
                        _buildTextField(
                          controller: _messageController,
                          label: "Message",
                          maxLines: 5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your message';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: AppConstants.spacingXXL),

                        // Submit Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isSubmitting ? null : _submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  widget.isDark
                                      ? AppConstants.darkTextPrimary
                                      : AppConstants.lightTextPrimary,
                              foregroundColor:
                                  widget.isDark
                                      ? AppConstants.darkBackground
                                      : AppConstants.lightBackground,
                              padding: EdgeInsets.symmetric(
                                vertical: AppConstants.spacingL,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppConstants.borderRadius,
                                ),
                              ),
                              elevation: 0,
                            ),
                            child:
                                _isSubmitting
                                    ? SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              widget.isDark
                                                  ? AppConstants.darkBackground
                                                  : AppConstants
                                                      .lightBackground,
                                            ),
                                      ),
                                    )
                                    : Text(
                                      "Send Message",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String label,
    String value,
    bool isDark,
  ) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(AppConstants.spacingM),
          decoration: BoxDecoration(
            color: isDark ? AppConstants.darkBorder : AppConstants.lightBorder,
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          child: Icon(
            icon,
            size: 20,
            color:
                isDark
                    ? AppConstants.darkTextSecondary
                    : AppConstants.lightTextSecondary,
          ),
        ),
        SizedBox(width: AppConstants.spacingM),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color:
                    isDark
                        ? AppConstants.darkTextMuted
                        : AppConstants.lightTextMuted,
              ),
            ),
            SizedBox(height: AppConstants.spacingXS),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color:
                    isDark
                        ? AppConstants.darkTextPrimary
                        : AppConstants.lightTextPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, String label, bool isDark) {
    return InkWell(
      onTap: () {
        // Handle social link tap
      },
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      child: Container(
        padding: EdgeInsets.all(AppConstants.spacingM),
        decoration: BoxDecoration(
          border: Border.all(
            color: isDark ? AppConstants.darkBorder : AppConstants.lightBorder,
          ),
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        child: Icon(
          icon,
          size: 20,
          color:
              isDark
                  ? AppConstants.darkTextSecondary
                  : AppConstants.lightTextSecondary,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(
        color:
            widget.isDark
                ? AppConstants.darkTextPrimary
                : AppConstants.lightTextPrimary,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color:
              widget.isDark
                  ? AppConstants.darkTextSecondary
                  : AppConstants.lightTextSecondary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: BorderSide(
            color:
                widget.isDark
                    ? AppConstants.darkBorder
                    : AppConstants.lightBorder,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: BorderSide(
            color:
                widget.isDark
                    ? AppConstants.darkBorder
                    : AppConstants.lightBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: BorderSide(
            color:
                widget.isDark
                    ? AppConstants.darkTextPrimary
                    : AppConstants.lightTextPrimary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor:
            widget.isDark
                ? AppConstants.darkSurface
                : AppConstants.lightSurface,
      ),
    );
  }
}

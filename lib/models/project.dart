class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? coverImage;
  final List<String>? gallery;
  final String? url;
  final String? githubUrl;
  final String? liveUrl;

  Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.coverImage,
    this.gallery,
    this.url,
    this.githubUrl,
    this.liveUrl,
  });

  // Helper method to get all images (cover + gallery)
  List<String> get allImages {
    final images = <String>[];
    if (coverImage != null) images.add(coverImage!);
    if (gallery != null) images.addAll(gallery!);
    return images;
  }

  // Helper method to check if project has any links
  bool get hasLinks => url != null || githubUrl != null || liveUrl != null;

  // Helper method to get primary link
  String? get primaryLink => liveUrl ?? url ?? githubUrl;
}

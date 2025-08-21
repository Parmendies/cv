import 'package:cv/models/education.dart';
import 'package:cv/models/experience.dart';
import 'package:cv/models/project.dart';
import 'package:cv/models/skill_categorty.dart';

final projects = [
  //1
  Project(
    title: "Wordly",
    description:
        "Weather application with real-time data, location-based forecasts, and animated UI.",
    technologies: ["Flutter", "Dart", "Firebase", "Geolocation", "REST API"],
    coverImage: "assets/wordly/wordly.png",
    gallery: List.generate(4, (index) => "assets/wordly/${index + 1}.webp"),
    liveUrl: "https://play.google.com/store/apps/details?id=com.wordly.app.tr",
  ),
  //2
  Project(
    title: "Blindlook",
    description:
        "Accessibility platform mobile app. Focused on UI for visually impaired users and integration with accessibility services.",
    technologies: ["Flutter", "Dart", "Firebase", "Accessibility APIs"],
    coverImage: "assets/blindlook/blindlook.webp",
    gallery: List.generate(4, (index) => "assets/blindlook/${index + 1}.webp"),
    liveUrl: "https://blindlook.com/",
  ),
  //3
  Project(
    title: "APTI",
    description:
        "Property management and productivity app with tasks, categories, deadlines, and notifications.",
    technologies: ["Flutter", "Dart", "Local Notifications", "Provider"],
    coverImage: "assets/apti/apti.png",
    gallery: List.generate(4, (index) => "assets/apti/${index + 1}.PNG"),
    liveUrl:
        "https://www.yapiradar.com/PazarYeri/Firma/apti-online-site-apartman-ve-plaza-yonetim-teknolojileri-as",
  ),
  //4
  Project(
    title: "Fallasana",
    description:
        "Plagiarism detection and AI-based analysis web app built with Flutter Web.",
    technologies: ["Flutter Web", "Dart", "REST API", "AI/ML Integration"],
    coverImage: "assets/fallasana/fallasana.webp",
    gallery: List.generate(4, (index) => "assets/fallasana/${index + 1}.png"),
    liveUrl: "https://fallasana.com/",
  ),
  //5
  Project(
    title: "BulutFix",
    description:
        "E-commerce app with product catalog, cart, and integrated online payment system.",
    technologies: [
      "Flutter",
      "Dart",
      "Stripe",
      "Provider",
      "Shared Preferences",
    ],
    coverImage: "assets/bulutfix/bulutfix.png",
    gallery: List.generate(7, (index) => "assets/bulutfix/${index + 1}.webp"),
    liveUrl: "https://bulutyonetim.com/",
  ),
  Project(
    title: "Anında App",
    description:
        "On-demand service marketplace mobile app with product listing, cart, and order management.",
    technologies: ["Flutter", "Dart", "Firebase", "Stripe", "Bloc"],
    coverImage: "assets/aninda/aninda.png",
    gallery: List.generate(12, (index) => "assets/aninda/${index + 1}.png"),
  ),
  //6
  Project(
    title: "Deste Yönetim",
    description:
        "Business management and communication platform app for internal processes.",
    technologies: ["Flutter", "Dart", "Firebase", "Provider"],
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
        "Event and competition platform app with participant management and real-time updates.",
    technologies: ["Flutter", "Dart", "Firebase", "Socket.IO"],
    coverImage: "assets/podium/podium.png",
    gallery: List.generate(12, (index) => "assets/podium/${index + 1}.png"),
  ),
  Project(
    title: "SoruSakla",
    description:
        "Question bank and exam preparation app. Users can store, categorize, and practice questions.",
    technologies: ["Flutter", "Dart", "Hive DB", "Provider"],
    coverImage: "assets/sorusakla/sorusakla.png",
    gallery: List.generate(
      11,
      (index) => "assets/sorusakla/ (${index + 1}).png",
    ),
  ),
];

final experiences = [
  Experience(
    company: "BlindLook",
    position: "Mobile Application Front-End Developer",
    duration: "03/2022 – 06/2022",
    description:
        "Developed mobile app features with Flutter, optimized UI for accessibility and performance.",
  ),
  Experience(
    company: "Apti",
    position: "Mobile Application Developer",
    duration: "02/2022 – 01/2023",
    description:
        "Built and maintained mobile app features for productivity and property management.",
  ),
  Experience(
    company: "Bulut Yönetim",
    position: "Mobile Application Developer",
    duration: "02/2022 – 04/2025",
    description:
        "Developed large-scale e-commerce and management apps with Flutter. Integrated payment systems and push notifications.",
  ),
  Experience(
    company: "Code Academy",
    position: "Flutter Trainer",
    duration: "07/2023 – 08/2023",
    description:
        "Conducted Flutter training sessions for beginners and intermediates.",
  ),
  Experience(
    company: "Freelancer",
    position: "Mobile Application Developer",
    duration: "01/2021 – Present",
    description:
        "Delivered various mobile apps with Flutter for clients. Focused on custom UI, state management, and API integrations.",
  ),
];

final skillCategories = [
  SkillCategory(
    title: "Frontend & Mobile",
    skills: ["Flutter", "Dart", "Bloc", "Provider", "Riverpod", "Animations"],
  ),
  SkillCategory(
    title: "Backend & Database",
    skills: ["Firebase", "Node.js", "Express", "MongoDB", "REST API"],
  ),
  SkillCategory(
    title: "Tools & Others",
    skills: ["Git", "GitHub/GitLab", "Jira", "Postman", "Figma"],
  ),
];

final educations = [
  Education(
    institution: "Ondokuz Mayıs Üniversitesi",
    degree: "BSc Computer Engineering",
    duration: "2020 - Present",
    description:
        "Core computer engineering program with focus on algorithms, software development, databases, and mobile applications.",
  ),
];

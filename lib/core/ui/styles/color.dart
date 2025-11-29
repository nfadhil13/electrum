part of 'style.dart';

abstract class AppColors {
  static AppColors get defaultColors => LightColors();

  // Base colors
  Color get background;
  Color get foreground;

  // Card colors
  Color get card;
  Color get cardForeground;

  // Popover colors
  Color get popover;
  Color get popoverForeground;

  // Primary colors
  Color get primary;
  Color get primaryForeground;

  // Secondary colors
  Color get secondary;
  Color get secondaryForeground;

  // Muted colors
  Color get muted;
  Color get mutedForeground;

  // Accent colors
  Color get accent;
  Color get accentForeground;

  // Destructive colors
  Color get destructive;
  Color get destructiveForeground;

  // Border and input colors
  Color get border;
  Color get input;
  Color get inputBackground;
  Color get switchBackground;
  Color get ring;

  // Chart colors
  Color get chart1;
  Color get chart2;
  Color get chart3;
  Color get chart4;
  Color get chart5;

  // Sidebar colors
  Color get sidebar;
  Color get sidebarForeground;
  Color get sidebarPrimary;
  Color get sidebarPrimaryForeground;
  Color get sidebarAccent;
  Color get sidebarAccentForeground;
  Color get sidebarBorder;
  Color get sidebarRing;
}

class LightColors implements AppColors {
  // Base colors
  @override
  Color get background => const Color(0xFFFFFFFF);

  @override
  Color get foreground => const Color(0xFF252525);

  // Card colors
  @override
  Color get card => const Color(0xFFFFFFFF);

  @override
  Color get cardForeground => const Color(0xFF252525);

  // Popover colors
  @override
  Color get popover => const Color(0xFFFFFFFF);

  @override
  Color get popoverForeground => const Color(0xFF252525);

  // Primary colors
  @override
  Color get primary => const Color(0xFF030213);

  @override
  Color get primaryForeground => const Color(0xFFFFFFFF);

  // Secondary colors
  @override
  Color get secondary => const Color(0xFFF5F4F8);

  @override
  Color get secondaryForeground => const Color(0xFF030213);

  // Muted colors
  @override
  Color get muted => const Color(0xFFECECF0);

  @override
  Color get mutedForeground => const Color(0xFF717182);

  // Accent colors
  @override
  Color get accent => const Color(0xFFE9EBEF);

  @override
  Color get accentForeground => const Color(0xFF030213);

  // Destructive colors
  @override
  Color get destructive => const Color(0xFFD4183D);

  @override
  Color get destructiveForeground => const Color(0xFFFFFFFF);

  // Border and input colors
  @override
  Color get border => const Color(0x1A000000);

  @override
  Color get input => Colors.transparent;

  @override
  Color get inputBackground => const Color(0xFFF3F3F5);

  @override
  Color get switchBackground => const Color(0xFFCBCED4);

  @override
  Color get ring => const Color(0xFFB4B4B4);

  // Chart colors
  @override
  Color get chart1 => const Color(0xFFE8A85C);

  @override
  Color get chart2 => const Color(0xFF5DB8A3);

  @override
  Color get chart3 => const Color(0xFF4A6FA5);

  @override
  Color get chart4 => const Color(0xFFF5D76E);

  @override
  Color get chart5 => const Color(0xFFE8C85C);

  // Sidebar colors
  @override
  Color get sidebar => const Color(0xFFFAFAFA);

  @override
  Color get sidebarForeground => const Color(0xFF252525);

  @override
  Color get sidebarPrimary => const Color(0xFF030213);

  @override
  Color get sidebarPrimaryForeground => const Color(0xFFFAFAFA);

  @override
  Color get sidebarAccent => const Color(0xFFF7F7F7);

  @override
  Color get sidebarAccentForeground => const Color(0xFF343434);

  @override
  Color get sidebarBorder => const Color(0xFFEBEBEB);

  @override
  Color get sidebarRing => const Color(0xFFB4B4B4);
}

class DarkColors implements AppColors {
  // Base colors
  @override
  Color get background => const Color(0xFF252525);

  @override
  Color get foreground => const Color(0xFFFAFAFA);

  // Card colors
  @override
  Color get card => const Color(0xFF252525);

  @override
  Color get cardForeground => const Color(0xFFFAFAFA);

  // Popover colors
  @override
  Color get popover => const Color(0xFF252525);

  @override
  Color get popoverForeground => const Color(0xFFFAFAFA);

  // Primary colors
  @override
  Color get primary => const Color(0xFFFAFAFA);

  @override
  Color get primaryForeground => const Color(0xFF343434);

  // Secondary colors
  @override
  Color get secondary => const Color(0xFF444444);

  @override
  Color get secondaryForeground => const Color(0xFFFAFAFA);

  // Muted colors
  @override
  Color get muted => const Color(0xFF444444);

  @override
  Color get mutedForeground => const Color(0xFFB4B4B4);

  // Accent colors
  @override
  Color get accent => const Color(0xFF444444);

  @override
  Color get accentForeground => const Color(0xFFFAFAFA);

  // Destructive colors
  @override
  Color get destructive => const Color(0xFFD85A6B);

  @override
  Color get destructiveForeground => const Color(0xFFE89AA5);

  // Border and input colors
  @override
  Color get border => const Color(0xFF444444);

  @override
  Color get input => const Color(0xFF444444);

  @override
  Color get inputBackground => const Color(0xFF444444);

  @override
  Color get switchBackground => const Color(0xFF444444);

  @override
  Color get ring => const Color(0xFF707070);

  // Chart colors
  @override
  Color get chart1 => const Color(0xFF8B7FD4);

  @override
  Color get chart2 => const Color(0xFF6FD4A3);

  @override
  Color get chart3 => const Color(0xFFE8C85C);

  @override
  Color get chart4 => const Color(0xFFD47FC4);

  @override
  Color get chart5 => const Color(0xFFE8A85C);

  // Sidebar colors
  @override
  Color get sidebar => const Color(0xFF343434);

  @override
  Color get sidebarForeground => const Color(0xFFFAFAFA);

  @override
  Color get sidebarPrimary => const Color(0xFF8B7FD4);

  @override
  Color get sidebarPrimaryForeground => const Color(0xFFFAFAFA);

  @override
  Color get sidebarAccent => const Color(0xFF444444);

  @override
  Color get sidebarAccentForeground => const Color(0xFFFAFAFA);

  @override
  Color get sidebarBorder => const Color(0xFF444444);

  @override
  Color get sidebarRing => const Color(0xFF707070);
}

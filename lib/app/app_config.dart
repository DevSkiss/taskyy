class AppConfig {
  AppConfig({
    required this.apiUrl,
    this.showLogs = false,
  });

  final String apiUrl;
  final bool showLogs;
}

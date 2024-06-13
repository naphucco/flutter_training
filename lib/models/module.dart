class Module {
  final String title;
  final String subtitle;

  Module(this.title, this.subtitle);

  // Factory method to create ListItem from JSON
  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      json['title'] as String,
      json['subtitle'] as String,
    );
  }
}

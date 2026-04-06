class AppStrings {
  static const String appTitle = 'Keys vs No Keys';
  static const String noKeysTitle = 'No Keys';
  static const String withKeysTitle = 'With Keys';
  static const String deleteHint = 'Tap to delete';
  static const String explanationNoKeys = 'Without Keys, Flutter might reuse the State of a widget for a different item in the list if they have the same type, leading to UI inconsistencies when elements are removed.';
  static const String explanationWithKeys = 'With Unique Keys, Flutter correctly maps each widget to its corresponding State, ensuring the UI remains consistent even when items are removed or reordered.';
}

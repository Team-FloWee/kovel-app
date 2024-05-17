enum ChatCase {
  recommendPlan('recommendPlan'),
  archiveBasedCourse('archiveBasedCourse'),
  text('');

  const ChatCase(this.value);
  final String value;

  factory ChatCase.fromString(String value) {
    return values.firstWhere((element) => element.value == value);
  }
}
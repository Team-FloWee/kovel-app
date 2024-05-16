enum ChatCase {
  recommendPlan('recommendPlan'),
  archiveBaseCourse('archiveBaseCourse'),
  text('');

  const ChatCase(this.value);
  final String value;

  factory ChatCase.fromString(String value) {
    return values.firstWhere((element) => element.value == value);
  }
}
enum ChatCase {
  recommendPlan('recommendPlan'),
  archiveBaseCourse('archiveBaseCourse'),
  unknown('unknown');

  const ChatCase(this.text);
  final String text;
}
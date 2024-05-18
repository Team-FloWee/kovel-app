enum ChatType {
  button('button'),
  text('');

  const ChatType(this.value);
  final String value;

  factory ChatType.fromString(String value) {
    return values.firstWhere((element) => element.value == value);
  }
}
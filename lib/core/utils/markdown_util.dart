class MarkdownUtil {
  // **로 둘러싸인 텍스트 삭제
  String removeMarkdownTags(String input) {
    return input.replaceAll('*', '');
  }
}
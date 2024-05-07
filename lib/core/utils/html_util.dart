class HtmlUtil {
  // html tag 삭제
  String removeHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: false);
    return htmlText.replaceAll(exp, '');
  }
}

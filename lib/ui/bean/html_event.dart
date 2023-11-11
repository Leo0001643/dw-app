
class HtmlEvent{

  String? data = "";

  bool? isHtmlData = false;

  String? pageTitle = "";

  HtmlEvent({this.data, this.isHtmlData, this.pageTitle});


  @override
  String toString() {
    return "data:${data},isHtmlData:${isHtmlData},pageTitle:${pageTitle}";
  }

}



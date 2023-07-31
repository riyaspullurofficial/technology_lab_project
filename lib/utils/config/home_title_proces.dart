String titleHome({required List<String> title}) {
  String aa = "";

  for (int i = 0; i < title.length; i++) {
    aa = '${title[i]}\n';
  }
  return aa;
}

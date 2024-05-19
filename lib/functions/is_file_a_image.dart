bool isFileAImage(String filePath) {
  List<String> name = filePath.split(".");
  String ext = name.last;
  if (ext != 'jpg' && ext != 'png' && ext != 'jpeg') {
    return false;
  }
  return true;
}

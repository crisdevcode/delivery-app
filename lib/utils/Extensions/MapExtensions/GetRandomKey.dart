
extension Key on Map {
  String getRandomKey() {
    String key = "";
    this.entries.forEach( (k) {
      key = k.key;
    });
    return key;
  }
}
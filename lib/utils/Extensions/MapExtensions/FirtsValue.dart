

extension FirstValue on Map {
  Map<String,dynamic> getFirtsValue() {
    var _list = this.values.toList();
    Map<String,dynamic> model = _list[0];

    return model;
  }
}
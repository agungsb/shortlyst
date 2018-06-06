class ChatItemModel {
  final String _type;
  final String _text;

  ChatItemModel(this._text, this._type);

  String get text => _text;

  String get type => _type;

}

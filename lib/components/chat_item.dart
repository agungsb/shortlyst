import 'package:flutter/material.dart';

class ChatType {
  static String right = 'chat-right';
  static String left = 'chat-left';
  static String ava = 'ava';
}

class ChatItem extends StatefulWidget {
  final String text;
  final String type;

  ChatItem(this.text, this.type);

  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  render() {
    var type = '';
    if (widget.type == ChatType.right) {
      return ChatRight(widget.text);
    } else if (widget.type == ChatType.left) {
      return ChatLeft(widget.text);
    } else if (widget.type == ChatType.ava) {
      return ChatAva(widget.text);
    } else {
      return Text('kosong');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: render(),
    );
  }
}

class ChatLeft extends StatelessWidget {
  final String text;

  ChatLeft(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(5.0),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 24.0),
                  child: Text(this.text, style: TextStyle(fontSize: 18.0)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChatRight extends StatelessWidget {
  final String text;

  ChatRight(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(5.0),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 24.0),
                  child: Text(this.text, style: TextStyle(fontSize: 18.0)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChatAva extends StatelessWidget {
  final String text;

  ChatAva(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: new NetworkImage('https://placekitten.com/50/50'),
          ),
        ],
      ),
    );
  }
}

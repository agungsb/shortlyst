import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const bg = [
  'http://www.hhcid.com/web/sites/default/files/_MHP1124-%E7%B7%A8%E8%BC%AF_0.jpg',
  'https://media.glassdoor.com/l/5d/a8/00/85/our-london-office-space.jpg',
  'http://www.cquence.com.sg/img/paths/assets/images/showcase-images/grab/cc-grab-02.jpg/4164727edaa3eb4c7f878d4c453327f8.jpg',
];

const _logo = [
  'http://1.bp.blogspot.com/_BrloiEvGMN4/TPilhr6NTWI/AAAAAAAABsw/s_FGf7NIRCM/s1600/adidas_logo.jpg',
  'https://assets.entrepreneur.com/content/3x2/1300/1405612741-airbnb-why-new-logo.jpg',
  'https://4.bp.blogspot.com/-9auPqdX2fMw/Wu3IRba1uAI/AAAAAAAAzjE/8yfpAd8vZkIpINnoGymwJUeW15UqXDwqwCLcBGAs/s1600/Grab.jpg',
];

const company = [
  'adidas',
  'airbnb',
  'Grab',
];

const position = [
  'UI/UX Designer',
  'UX Researcher',
  'UX Researcher',
];

class Vacancy extends StatelessWidget {
  final int _index;
  Vacancy(this._index);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _Card(_index),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final int _index;
  _Card(this._index);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: <Widget>[
          _CardHeader(_index),
          _CardContent(),
          _CardFooter(),
        ],
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  final int _index;
  _CardHeader(this._index);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
          image: NetworkImage(bg[_index]),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Center(
              child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.transparent,
                  Colors.black.withOpacity(0.25),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.75),
                  Colors.black.withOpacity(1.0),
                ],
              ),
            ),
          )),
          Center(
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    height: 60.0,
                    width: 60.0,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
                        image: NetworkImage(_logo[_index]),
                      ),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                  const Padding(padding: const EdgeInsets.only(left: 18.0)),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            position[_index],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const Padding(padding: const EdgeInsets.only(top: 6.0)),
                          new Text(
                            "${company[_index]} - Jakarta, Indonesia",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Mid-Senior Level',
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '8.000.000 - 15.000.000 IDR/month',
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Full-time',
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Text(
              '99% Match',
              textAlign: TextAlign.right,
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                height: 50.0,
                child: Text(
                  'Apply',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            width: 1.0,
            height: 50.0,
            color: Colors.grey,
          ),
          Flexible(
            flex: 1,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                height: 50.0,
                child: Text(
                  'View',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

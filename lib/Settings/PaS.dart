import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Prisec extends StatefulWidget {
  @override
  _PrisecState createState() => _PrisecState();
}

class _PrisecState extends State<Prisec> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.fromLTRB(5, 0, 4, 0),
              child: Center(
                  child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Privacy and Security',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi a ipsum velit. Phasellus nec fringilla ligula. Fusce a convallis nisl, vel pulvinar mi. In sed sollicitudin massa, eu efficitur quam. Duis in pretium sem. Phasellus ac consectetur velit. Nulla ultricies eget tellus at gravida. Nulla congue porttitor egestas. Nunc aliquam rutrum varius. Integer convallis aliquam imperdiet. ',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi a ipsum velit. Phasellus nec fringilla ligula. Fusce a convallis nisl, vel pulvinar mi. In sed sollicitudin massa, eu efficitur quam. Duis in pretium sem. Phasellus ac consectetur velit. Nulla ultricies eget tellus at gravida. Nulla congue porttitor egestas. Nunc aliquam rutrum varius. Integer convallis aliquam imperdiet. ',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi a ipsum velit. Phasellus nec fringilla ligula. Fusce a convallis nisl, vel pulvinar mi. In sed sollicitudin massa, eu efficitur quam. Duis in pretium sem. Phasellus ac consectetur velit. Nulla ultricies eget tellus at gravida. Nulla congue porttitor egestas. Nunc aliquam rutrum varius. Integer convallis aliquam imperdiet. ',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi a ipsum velit. Phasellus nec fringilla ligula. Fusce a convallis nisl, vel pulvinar mi. In sed sollicitudin massa, eu efficitur quam. Duis in pretium sem. Phasellus ac consectetur velit. Nulla ultricies eget tellus at gravida. Nulla congue porttitor egestas. Nunc aliquam rutrum varius. Integer convallis aliquam imperdiet. ',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi a ipsum velit. Phasellus nec fringilla ligula. Fusce a convallis nisl, vel pulvinar mi. In sed sollicitudin massa, eu efficitur quam. Duis in pretium sem. Phasellus ac consectetur velit. Nulla ultricies eget tellus at gravida. Nulla congue porttitor egestas. Nunc aliquam rutrum varius. Integer convallis aliquam imperdiet. ',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi a ipsum velit. Phasellus nec fringilla ligula. Fusce a convallis nisl, vel pulvinar mi. In sed sollicitudin massa, eu efficitur quam. Duis in pretium sem. Phasellus ac consectetur velit. Nulla ultricies eget tellus at gravida. Nulla congue porttitor egestas. Nunc aliquam rutrum varius. Integer convallis aliquam imperdiet. ',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}

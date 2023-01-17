import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'drawer_widget.dart';

class DetailScreen extends StatefulWidget {

const DetailScreen({Key? key}) :super(key:key);
static const String routeName ='/details';

  @override
  State<StatefulWidget> createState() {
    return _DetailScreenState();
  }
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      drawer: drawer_widget(false),
      body:Container());
  }
}
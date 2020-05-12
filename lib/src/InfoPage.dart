import 'package:flutter/material.dart';
import './models/medications_model.dart';

class InfoPage extends StatelessWidget {
  static const routeName = '/InfoPage';
  bool subClass = true;
  @override
  Widget build(BuildContext context) {
    final Medications med = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(med.medName),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            subClass ? Text(med.subCat + '    ' + med.cat) : Text(med.cat),
            Divider(),
            PropertiesCard('Initial Dose', med.doseInit,
                comment: med.doseInitComment),
            PropertiesCard('Max Dose', med.maxDose),
            Spacer()
          ],
        ),
      ),
    );
  }
}

class PropertiesCard extends StatefulWidget {
  String title;
  String content;
  String comment;
  PropertiesCard(this.title, this.content, {this.comment});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PropertiesCardState(title, content, comment: comment);
  }
}

class PropertiesCardState extends State<PropertiesCard> {
  String title;
  String content;
  String comment;
  PropertiesCardState(this.title, this.content, {this.comment});
  bool isExpanded = true;

  void _isCardExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  _buildCard(title, content, comment: comment);
     
  }

  Widget _buildCard(String title, String content, {String comment}) {
    return Card(
      child: InkWell(
        onTap: _isCardExpanded,
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(title),
                  Spacer(),
                  isExpanded ? Icon(Icons.expand_less) : Icon(Icons.expand_more)
                ],
              ),
              if (isExpanded)
                Column(
                  children: <Widget>[
                    Text(content),
                    if (comment != null)
                      Text(
                        comment,
                        style: TextStyle(fontSize: 10),
                      )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

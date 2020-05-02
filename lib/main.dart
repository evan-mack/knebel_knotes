import 'package:flutter/material.dart';
//testing git upload
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Knebel Knotes"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            "Drug Name",
            style: TextStyle(fontSize: 26),
            textAlign: TextAlign.center,
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Class"),
              Text("SubClass"),
            ],
          ),
          Divider(),
          InfoCard(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text("Medications"),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfoCardState();
  }
}

class InfoCardState extends State<InfoCard> {
  bool show = true;

  void isShowing() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          isShowing();
        },
        child: Container(
          width: double.infinity,
          child: InfoCardText(show),
        ),
      ),
    );
  }
}

class InfoCardText extends StatelessWidget {
  final bool show;
  InfoCardText(this.show);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('Indications'),
            Spacer(),
            show ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
          ],
        ),
        if (show) GetIndications(),
      ],
    );
  }
}

class GetIndications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.black45),
      
      children: [
        TableRow(
          
          children: [
            Text('Indication 1'),
            Text('Indication 2'),
            Text('Indication 5')
          ],
        ),
        TableRow(
          children: [
            Text('Indication 3'),
            Text('Indication 4'),
            Text('Indication 6')
          ],
        ),
      ],
    );
  }
}

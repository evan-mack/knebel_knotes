import 'package:flutter/material.dart';
import 'package:knebel_knotes/src/InfoPage.dart';

import './providers/medicationApiProvider.dart';
import './providers/db_provider2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;
  var isAccepted = false;
  @override
  void initState() {
    super.initState();
    _loadFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Knebel Knotes'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: _buildMedicationListView(),
                ),
          Spacer(),
          if (!isAccepted)
            AlertDialog(
              title: Text("Disclaimer"),
              content: Column(
                children: <Widget>[
                  Text('Disclaimer place holder'),
                  RaisedButton(
                    onPressed: _acceptDisclaimer,
                    child: Text('I Understand'),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  _acceptDisclaimer() async {
    setState(() {
      isAccepted = true;
    });
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider2 = MedicationApiProvider();
    await apiProvider2.getAllMedications();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  _deleteData() async {
    setState(() {
      isLoading = true;
    });

    // wait for 1 second to simulate loading of data
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading = false;
    });

    print('All employees deleted');
  }

  _buildMedicationListView() {
    return FutureBuilder(
      future: DBProvider.db.getAllMedications(),
      //future: DBProvider.db.getAllEmployees(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black12,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(
                  "${index + 1}",
                  style: TextStyle(fontSize: 20.0),
                ),
                title: Text(
                  "Med: ${snapshot.data[index].medName}",
                ),
                trailing: Icon(Icons.navigate_next),
                onTap: () => Navigator.pushNamed(context, InfoPage.routeName, arguments: snapshot.data[index]),
              );
            },
          );
        }
      },
    );
  }
}

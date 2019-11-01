import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Les scrollables',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Les scrollables'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Activite> mesActivites = [
    new Activite("Vélo", Icons.directions_bike),
    new Activite("Peinture", Icons.palette),
    new Activite("Golf", Icons.golf_course),
    new Activite("Arcade", Icons.gamepad),
    new Activite("Bricolage", Icons.build),
    new Activite("Vélo", Icons.directions_bike),
    new Activite("Peinture", Icons.palette),
    new Activite("Golf", Icons.golf_course),
    new Activite("Arcade", Icons.gamepad),
    new Activite("Bricolage", Icons.build),
    new Activite("Vélo", Icons.directions_bike),
    new Activite("Peinture", Icons.palette),
    new Activite("Golf", Icons.golf_course),
    new Activite("Arcade", Icons.gamepad),
    new Activite("Bricolage", Icons.build)
  ];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    print(orientation);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (orientation == Orientation.portrait) ? liste() : grille(),
      ),
    );
  }

  Widget grille() {
    return new GridView.builder(
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: mesActivites.length,
      itemBuilder: (context, i) {
        return new Container(
          margin: EdgeInsets.all(2.5),
          child: new Card(
              elevation: 10,
              child: new InkWell(
                onTap: (() => print("tap grille")),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text("Activité:",
                        style:
                            new TextStyle(color: Colors.teal, fontSize: 15.0)),
                    new Icon(mesActivites[i].icone,
                        color: Colors.teal, size: 40),
                    new Text(mesActivites[i].nom,
                        style: new TextStyle(
                            color: Colors.teal,
                            fontSize: 20,
                            fontStyle: FontStyle.italic))
                  ],
                ),
              )),
        );
      },
    );
  }

  Widget liste() {
    return new ListView.builder(
      itemCount: mesActivites.length,
      itemBuilder: (context, i) {
        Activite activite = mesActivites[i];
        String key = activite.nom;
        return new Dismissible(
          key: new Key(key),
          child: new Container(
            height: 135,
            padding: EdgeInsets.all(5.0),
            child: new Card(
              elevation: 7.5,
              child: new InkWell(
                onTap: (() => print("taped ${activite.nom}")),
                onLongPress: (() => print("C'est looonnng")),
                child: new Container(
                    child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Icon(activite.icone, color: Colors.teal, size: 75),
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "Actvité:",
                          style:
                              new TextStyle(color: Colors.teal, fontSize: 20),
                        ),
                        new Text(activite.nom,
                            style: new TextStyle(
                                color: Colors.teal[700], fontSize: 30.0))
                      ],
                    )
                  ],
                )),
              ),
            ),
          ),
          background: new Container(
            color: Colors.red,
            padding: EdgeInsets.only(right: 20),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(
                  "Supprimer",
                  style: new TextStyle(color: Colors.white),
                ),
                new Icon(
                  Icons.delete,
                  color: Colors.white,
                )
              ],
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              print(activite.nom);
              mesActivites.removeAt(i);
            });
          },
        );
      },
    );
  }
}

class Activite {
  String nom;
  IconData icone;

  Activite(String nom, IconData icone) {
    this.nom = nom;
    this.icone = icone;
  }
}

// ListTile

// new ListTile(
//   title: new Text("Activité: ${activite.nom}"),
//   trailing: new Icon(activite.icone),
// )

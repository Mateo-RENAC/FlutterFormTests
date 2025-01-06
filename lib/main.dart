import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TextField
  String? textField;
  bool isObscure = true;

  //Checkbox
  Map<String,bool> listeCourse = {
    "Carottes" : false,
    "Bannanes" : false,
    "Yaourt" : false,
    "Pain" : false,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Les Formulaires'),
      ),
      body: Column(
        children : [
          TextField(
            obscureText: isObscure,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: "Saisir votre Email",
              hintText: "test@test.com",
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
              )
            ),
            onChanged : (String value){
              setState(() {
                textField = value;
              });
            },
          ),
          Divider(),
          Text("Valeur du TextField = ${textField}"),
          Container(
            child: Column(
              children: checkListCourse(),
            )
          )
        ]
      ),
    );
  }

  List<Widget> checkListCourse(){
    List<Widget> l = [];
    listeCourse.forEach((String aliments, bool achete){
      // [] Carrottes
      Row row = Row(
        children: [
          Checkbox(
            value : achete,
            onChanged : (bool? b){
              setState(() {
                listeCourse[aliments] = b!;
              });
            },
          ),
          Text(aliments,
              style : TextStyle(
                  decoration: (achete) ? TextDecoration.lineThrough : TextDecoration.none
              )),
        ],
      );
      l.add(row);
    });


    return l;
  }
}





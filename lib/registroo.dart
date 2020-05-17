import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final formKey = new GlobalKey<FormState>();

  final _controllerUsuario = TextEditingController();
  final _controllerContrasena = TextEditingController();
  final _controllerEmail = TextEditingController();

  String _usuario;
  String _contrasena;
  String _email;
  String savename = '';
  String savecorreo = '';
  String nombre = '';
  String contrasena = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    setState(() {
      obtenerPreferencias();
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[100],
        centerTitle: true,
        title:
        Text('Registro de Usuario',style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      image: new NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRhpyTr4pxWPTdlLLDvYH7OhXLz7O2j014SQHwWzKB2-deIcAJj&usqp=CAU"),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.person),onPressed: null),
                          Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 20.0,left: 20.0),
                                child: TextFormField(
                                  validator: (valor) =>
                                  valor.length < 3
                                      ? 'Name can not be empty'
                                      : null,
                                  controller: _controllerUsuario,
                                  onSaved: (valor) => _usuario = valor,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: Colors.deepPurple[100],
                                        width: 5,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                        color: Colors.deepPurple[100],
                                        width: 5,
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.mail),onPressed: null),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 20.0,left: 20.0),
                              child: TextFormField(
                                controller: _controllerEmail,
                                validator: (valor) =>
                                !valor.contains('@')
                                    ? 'Ingresa un email valido'
                                    : null,
                                onSaved: (valor) => _email = valor,
                                decoration: InputDecoration(
                                  labelText: 'E-mail',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple[100],
                                      width: 5,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple[100],
                                      width: 5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.enhanced_encryption),
                              onPressed: null),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 20.0,left: 20.0),
                              child: TextFormField(
                                controller: _controllerContrasena,
                                validator: (valor) =>
                                valor.length < 3
                                    ? 'Campo Incorrecto'
                                    : null,
                                onSaved: (valor) => _contrasena = valor,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple[100],
                                      width: 5,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple[100],
                                      width: 5,
                                    ),
                                  ),
                                ),
                                obscureText: true,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 60,
                          child: RaisedButton(
                            onPressed: () {
                              final form = formKey.currentState;
                              if (form.validate()) {
                                setState(() {
                                  nombre = _controllerUsuario.text;
                                  email = _controllerEmail.text;
                                  guardarPreferencias();
                                });
                                pushPage();
                              }
                            },
                            color: Colors.green,
                            child: Text(
                              'Registarse',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future _checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool('_sesion')) {
      Navigator.push(context,MaterialPageRoute(builder: (context) {
        return new Scaffold(
          appBar: AppBar(
            title: new Text("Perfil de Usuario"),
            automaticallyImplyLeading: false,
            //Quita flecha de retroceso en appBar
            centerTitle: true,
            backgroundColor: Colors.deepPurpleAccent[100],
          ),
          body: new Card(
            color: Colors.deepPurple[300],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0)),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.all(30.0)),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRhpyTr4pxWPTdlLLDvYH7OhXLz7O2j014SQHwWzKB2-deIcAJj&usqp=CAU"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(20.0)),
                  Text(
                    "Datos del Usuario",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  new Padding(padding: EdgeInsets.all(5.0)),
                  new Divider(
                      color: Colors.purple,
                      indent: 20,
                      endIndent: 20,
                      thickness: 3.0),
                  new Padding(padding: EdgeInsets.all(40.0)),
                  Text(
                    "Nombre ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      '$savename',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(30.0)),
                  Text(
                    "E-mail",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('$savecorreo',
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  new Padding(padding: EdgeInsets.all(60.0)),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      _CerrarSession();
                      print("Clicko");
                    },
                    child: new Text(
                      "Cerrar Sesion",
                      textScaleFactor: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }));
    }
  }

  void pushPage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('_sesion',true);

    Navigator.push(context,MaterialPageRoute(builder: (context) {
      return new Scaffold(
        appBar: AppBar(
          title: new Text("Perfil de Usuario"),
          automaticallyImplyLeading: false,
          //Quita flecha de retroceso en appBar
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent[100],
        ),
        body: new Card(
          color: Colors.deepPurple[300],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(30.0)),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRhpyTr4pxWPTdlLLDvYH7OhXLz7O2j014SQHwWzKB2-deIcAJj&usqp=CAU"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                new Padding(padding: EdgeInsets.all(20.0)),
                Text(
                  "Datos del Usuario",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                new Padding(padding: EdgeInsets.all(5.0)),
                new Divider(
                    color: Colors.purple,
                    indent: 20,
                    endIndent: 20,
                    thickness: 3.0),
                new Padding(padding: EdgeInsets.all(40.0)),
                Text(
                  "Nombre ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(nombre,
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                new Padding(padding: EdgeInsets.all(30.0)),
                Text(
                  "E-mail",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                new Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(email,
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                new Padding(padding: EdgeInsets.all(60.0)),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () {
                    _CerrarSession();
                    print("Clicko");
                  },
                  child: new Text(
                    "Cerrar Sesion",
                    textScaleFactor: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }

  Future<void> guardarPreferencias() async {
    SharedPreferences datos = await SharedPreferences.getInstance();
    datos.setString('nombre',_controllerUsuario.text);
    datos.setString('email',_controllerEmail.text);
  }

  Future<void> obtenerPreferencias() async {
    SharedPreferences datos = await SharedPreferences.getInstance();
    setState(() {
      savename = datos.get('nombre') ?? nombre;
      savecorreo = datos.get('email') ?? email;
    });
  }

/*  Future<void> cerrarSesion() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('_sesion', false);
    setState(() {
      savename = '';
      savecorreo = '';
    });
    Navigator.pop(context);
  }
}*/
  Future<void> _CerrarSession() async {
    final sharedprefs = await SharedPreferences.getInstance();
    sharedprefs.setBool('_sesion', false);
    setState(() {
      Navigator.pop(context,MaterialPageRoute(
          builder: (context) => Registro()));
      savename = '';
      savecorreo = '';
    });
  }
}






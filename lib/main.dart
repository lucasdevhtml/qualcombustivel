import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main(){
  runApp(MaterialApp
    (home: Home(),
    ));

}



class Home extends StatefulWidget {
  @override 
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  TextEditingController precoGasolinaController = TextEditingController();
  TextEditingController precoEtanolController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _info = "informe os preços dos combustiveis! ";

  void _resetFields(){
    precoEtanolController.text = "";
    precoGasolinaController.text = "";
    setState(() {
      _info = "informe os preços dos combustiveis!";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calcularMelhorCombustivel(){
    double precoEtanol = double.parse(precoEtanolController.text);
    double precoGasolina = double.parse(precoGasolinaController.text);
    double coeficiente = precoEtanol / precoGasolina;
    print(coeficiente);
    _info = (coeficiente < 0.7) ? "Etanol é melhor opção" : "Gasolina é melhor opção";
    
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Qual combustivel? "),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
          onPressed: _resetFields
          ),
        ],
        backgroundColor: Colors.red,
      ),
      
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Icon(Icons.time_to_leave, size: 100.0, color: Colors.red),

            TextFormField(
            controller: precoGasolinaController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Gasolina R\$",
              labelStyle: TextStyle(color: Colors.red)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red, fontSize: 20.0),
            validator: (value){
              if(value.isEmpty){
                return "Informe o preço da Gasolina";
              }
            }
            ),
          
            TextFormField(
            controller: precoEtanolController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Etanol R\$",
              labelStyle: TextStyle(color: Colors.red)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red, fontSize: 20.0),
            validator: (value){
              if(value.isEmpty){
                return "Informe o preço do etanol";
              }
            }
          ),

            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
              height: 50.0,
              child: RaisedButton(
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    _calcularMelhorCombustivel();
                  }
                },
                child: Text("Calcular",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  color: Colors.red
              ),
            ),
          ),
          
          //Text ("Informações",
          //textAlign: TextAlign.center,
          //style: TextStyle(color: Colors.red, fontSize: 20.0),),

          Text(_info, textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontSize: 20.0),)
          
  
          ],
         ),
        ),
      ),
    );
  }
}
 
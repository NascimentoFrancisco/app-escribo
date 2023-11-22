import 'package:app_escribo/app/backend/sum_number.dart';
import 'package:app_escribo/app/screens/widgets/snackbar_erros.dart';
import 'package:app_escribo/app/utils/colors/colors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String result = '';
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors().colorBackgroundScaffold,
      appBar: AppBar(
        title: Text(
          "Escribo",
          style: TextStyle(
            color: DefaultColors().colorTextDefault,
            fontSize: 27,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: DefaultColors().colorBackgroundAppBar,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Somatório de todos os valores inteiros divisíveis por 3 ou 5",
                    style: TextStyle(
                      color: DefaultColors().colorTextDefault,
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 8),
                  child: TextField(
                    controller: numberController,
                    style: TextStyle(color: DefaultColors().colorTextDefault),
                    keyboardType: TextInputType.number,
                    cursorColor: DefaultColors().colorYellowDefaultForms,
                    decoration: InputDecoration(
                      fillColor: DefaultColors().colorTextDefault,
                      labelText: "Número inteiro positivo",
                      hintText: "Ex: 10",
                      hintStyle: TextStyle(
                        color:DefaultColors().colorTextDefault
                      ),
                      labelStyle: TextStyle(
                        color:DefaultColors().colorYellowDefaultForms
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: DefaultColors().colorYellowDefaultForms
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: DefaultColors().colorYellowDefaultForms
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: DefaultColors().colorYellowDefaultForms,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Text(
                    result,
                    style: TextStyle(
                      color: DefaultColors().colorTextDefault,
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          setState(() {
                            numberController.clear();
                            result = '';
                          });
                        }, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: DefaultColors().colorRedButton,
                          minimumSize: const Size(35, 35)
                        ),
                        child: const Text('LIMPAR',
                          style: TextStyle(
                            fontSize: 18
                          ),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              try{
                                result = SumNumbers().sumIntegerDivisors(numberController.text).toString();
                                numberController.clear();
                              }catch (e){
                                numberController.clear();
                                if(e is ArgumentError){
                                  ScaffoldMessenger.of(context).showSnackBar(returnSnckBar(e.message));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(returnSnckBar('Algo deu errado!'));
                                }
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: DefaultColors().colorGreenButton,
                            minimumSize: const Size(35, 35)
                          ),
                          child: const Text('SOMAR',
                            style: TextStyle(
                              fontSize: 18
                            ),
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
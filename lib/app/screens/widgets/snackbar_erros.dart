import 'package:app_escribo/app/utils/colors/colors.dart';
import 'package:flutter/material.dart';


dynamic returnSnckBar(String message){
  return SnackBar(
    content: Text(message,
      style: TextStyle(color: DefaultColors().colorTextDefault),
    ),
    backgroundColor: DefaultColors().colorRedButton,
    action: SnackBarAction(
      label: 'Fechar',
      textColor: Colors.black,
      onPressed: (){},
    ),
  );
}

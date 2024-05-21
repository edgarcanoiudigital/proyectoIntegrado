import 'package:flutter/material.dart';


class TextoInput extends StatelessWidget {
  final String? hinttext;
  final String? labeltext;
  final String? helpertext;
  final String? countertext;
  final IconData? suffixtext;
  final IconData? prefixicon;
  final TextInputType? textinputtype;
  final bool obscuretext ;
  final TextEditingController controller ;
  

  const TextoInput(
      {super.key,
      this.hinttext,
      this.labeltext,
      this.helpertext,
      this.countertext,
      this.suffixtext,
      this.prefixicon,
      this.textinputtype,  
      this.obscuretext=false, required this.controller, required TextInputType keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ,
      style:  TextStyle( 
        decorationColor: Colors.red[300]
      ),
      keyboardType: textinputtype,
      obscureText: obscuretext,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      onChanged: (value) {},
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          fillColor: Colors.red[100],
          filled: true,
          hintText: hinttext,
          counterText: countertext,
          suffixIcon: Icon(suffixtext),
          prefixIcon: Icon(prefixicon),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10)))),
    );
  }
}

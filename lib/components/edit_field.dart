import 'package:flutter/material.dart';

class EditField extends StatelessWidget {

  final keyboardType,labelText,prefixIcon,onChange,initialValue,enable;

  const EditField(this.keyboardType,this.labelText,this.prefixIcon,this.onChange,{this.enable = true,this.initialValue
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        enabled: enable,

        keyboardType: keyboardType,
        
        decoration: InputDecoration(
        
          label: Text(labelText),
          prefixIcon: Icon(prefixIcon),
          border: const OutlineInputBorder()
        ),
        // initialValue: "",
        onChanged: onChange,
      ),
    );
  }
}

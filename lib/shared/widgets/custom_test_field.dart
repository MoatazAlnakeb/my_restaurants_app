import 'package:flutter/material.dart';
import 'package:my_restaurant_app/general/general_constants.dart';
//
// class CustomTextField extends StatelessWidget {
//   final String hint;
//   final IconData prefixIcon;
//   final IconData suffixIcon;
//   final Function onClick;
//   TextEditingController controller;
//
//   String _errorMessage(String str) {
//     switch (hint) {
//       case 'Enter your name':
//         return 'Name is empty !';
//       case 'Enter User Name':
//         return 'User Name is empty !';
//       case 'Enter your password':
//         return 'Password is empty !';
//       case 'Enter Customer Phone':
//         return 'Phone Number is Empty';
//     }
//   }
//
//
//   CustomTextField(
//       {@required this.controller,@required this.onClick, @required this.prefixIcon, @required this.hint,this.suffixIcon});
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: TextFormField(
//         controller:controller ,
//         validator: (value) {
//           if (value.isEmpty) {
//             return _errorMessage(hint);
//             // ignore: missing_return
//           }
//         },
//         keyboardType:hint=='Enter Customer Phone'?TextInputType.number:TextInputType.text,
//         onSaved: onClick,
//         obscureText: (hint == 'Enter your password'|| hint == 'ادخل كلمة المرور') ? true : false,
//         cursorColor: General.kMainColor,
//         decoration: InputDecoration(
//           hintText: hint,
//           prefixIcon: Icon(
//             prefixIcon,
//             color:General.kSecondaryColor,
//           ),
//           suffixIcon: Icon(
//             suffixIcon,
//             color:Colors.grey,
//           ),
//           filled: true,
//           fillColor: General.kMainColor,
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(15),
//               borderSide: BorderSide(color: Colors.white)),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20),
//               borderSide: BorderSide(color: Colors.white)),
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20),
//               borderSide: BorderSide(color: Colors.white)),
//         ),
//       ),
//     );
//   }
// }


Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType keboardType,
  Function? onSubmit,
  Function? onChanged,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable =true,
  Color? prefixcolor,
}) => TextFormField(
  controller:controller ,
  keyboardType: keboardType,
  obscureText: isPassword,
  enabled: isClickable,
  onFieldSubmitted: onSubmit as void Function(String)?,
  onChanged: onChanged as void Function(String)?,
  onTap: onTap as void Function()?,
  validator: validate as String? Function(String?)?,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix,color: prefixcolor,),
    suffixIcon: suffix!=null? IconButton(
        onPressed: suffixPressed as void Function()?,
        icon: Icon(suffix,)):null,

    border:OutlineInputBorder(),
  ),

);

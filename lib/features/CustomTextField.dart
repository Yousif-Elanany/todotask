import 'package:flutter/material.dart';

class customSearchTextField extends StatelessWidget {
  customSearchTextField({
    super.key,
    required this.hintText,
    required this.mycontroller,
    this.onsub,
    this.onTap,
    required this.labelText,
    this.tybe,
  });
  TextEditingController? mycontroller = TextEditingController();
  void Function(String)? onsub;
  TextInputType? tybe;
  String? hintText;
  String? labelText;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 8),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      controller: mycontroller,
      keyboardType: tybe,
      onTap: onTap,
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}

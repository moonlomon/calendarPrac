import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../const/colors.dart';

class CustumTextFeild extends StatelessWidget {

  final String label;
  final bool isTime;

  const CustumTextFeild({Key? key, required this.label, required this.isTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.w500
          ),
        ),
        Expanded(
          flex: isTime ? 0 : 1,
          child: TextFormField(
            maxLines: isTime ? 1 : null,
            expands: isTime ? false : true,
            keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
            inputFormatters: isTime ? [FilteringTextInputFormatter.digitsOnly] : [],
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[300],
              suffix: isTime ? const Text("시") : null
            ),
          ),
        )
      ],
    );
  }
}
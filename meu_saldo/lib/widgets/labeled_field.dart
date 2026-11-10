import 'package:flutter/material.dart';

/// Campo com rótulo em negrito acima, como no protótipo.
class LabeledField extends StatelessWidget {
  const LabeledField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.obscure = false,
    this.keyboardType,
    this.validator,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool obscure;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';

class CreditCardInfo extends StatefulWidget {
  const CreditCardInfo({super.key});

  @override
  State<CreditCardInfo> createState() => _CreditCardInfoState();
}

class _CreditCardInfoState extends State<CreditCardInfo> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = List.generate(4, (_) => TextEditingController());
  final _focusNodes = List.generate(4, (_) => FocusNode());
  final _expiryDateController = TextEditingController();
  final _expiryDateFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        if (!_focusNodes[i].hasFocus && _controllers[i].text.length == 4) {
          if (i < _focusNodes.length - 1) {
            FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
          } else {
            _submitForm();
          }
        }
      });
    }
    _expiryDateController.addListener(_formatInput);
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }

    _expiryDateController.dispose();
    _expiryDateFocusNode.dispose();
    super.dispose();
  }

  void _formatInput() {
    String text = _expiryDateController.text;
    if (text.length > 5) {
      text = text.substring(0, 5);
    }

    if (text.length >= 2 && text[2] != '/') {
      text = '${text.substring(0, 2)}/${text.substring(2)}';
    }

    if (text != _expiryDateController.text) {
      _expiryDateController.value = _expiryDateController.value.copyWith(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform form submission logic here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Form submitted successfully!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Card Number',
            style: theme.textTheme.titleMedium,
          ).setVerticalPadding(context, 0.05),
          Row(
            children: List.generate(4, (index) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d{0,4}$')),
                    ],
                    decoration: const InputDecoration(
                      hintText: 'XXXX',
                    ),
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.length == 4) {
                        if (index < _focusNodes.length - 1) {
                          FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                        } else {
                          _submitForm();
                        }
                      }
                    },
                  ),
                ),
              );
            })
                .expand(
                  (widget) => [
                    widget,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        '-',
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                  ],
                )
                .toList()
                .sublist(0, 7),
          ),
          Text(
            'Card holder name',
            style: theme.textTheme.titleMedium,
          ).setVerticalPadding(context, 0.05),
          TextFormField(
            decoration: InputDecoration(hintText: 'Card holder name'),
          ),
          Text(
            'Expiry date',
            style: theme.textTheme.titleMedium,
          ).setVerticalPadding(context, 0.05),
          TextFormField(
            decoration: InputDecoration(hintText: '02 / 24'),
          ),
          Text(
            'CVV',
            style: theme.textTheme.titleMedium,
          ).setVerticalPadding(context, 0.05),
          TextFormField(
            obscureText: true,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d{0,3}$')),],
            decoration: const InputDecoration(hintText: '***'),
          ),
        ],
      ),
    );
  }
}

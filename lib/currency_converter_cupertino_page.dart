import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 86.2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey4,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey4,
        middle: Text(
          'Currency Converter',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.white),
              ),
              CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                placeholder: 'Please enter amount in USD',
                prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                onPressed: convert,
                color: CupertinoColors.black,
                child: const Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GrindSelectorWidget extends StatefulWidget {
  const GrindSelectorWidget({super.key});

  @override
  _GrindSelectorWidgetState createState() => _GrindSelectorWidgetState();
}

class _GrindSelectorWidgetState extends State<GrindSelectorWidget> {
  String selectedGrind = 'В зёрнах';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Помол:'), // обработать
        const SizedBox(width: 16), // отступ между текстом и выпадающим списком
        Expanded(
          child: GestureDetector(
            onTap: () async {
              final String? result = await showDialog<String>(
                context: context,
                builder: (context) => SimpleDialog(
                  title: const Text('Выберите помол'),
                  children: [
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.pop(context, 'В зёрнах');
                      },
                      child: const Text('В зёрнах'),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.pop(context, 'Молотый');
                      },
                      child: const Text('Молотый'),
                    ),
                  ],
                ),
              );
              if (result != null) {
                setState(() {
                  selectedGrind = result;
                });
              }
            },
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey[200]!),
                borderRadius: BorderRadius.circular(7),
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedGrind,
                    style: TextStyle(
                      color: Colors.blueGrey[700],
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blueGrey[400],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

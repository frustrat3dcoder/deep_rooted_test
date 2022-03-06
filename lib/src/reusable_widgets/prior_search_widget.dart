import 'package:flutter/material.dart';

class PriorSearchWidget extends StatelessWidget {
  const PriorSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: const [
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Enter a currency pair to load data",
            style: TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

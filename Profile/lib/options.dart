import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ListTile(
            leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.camera,
                  color: Colors.white,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}

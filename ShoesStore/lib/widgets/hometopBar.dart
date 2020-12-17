import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Shoes',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1.5),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            child: Icon(
              Icons.notifications_outlined,
            ),
          ),
          Container(
              height: 40, width: 40, child: Icon(Icons.shopping_cart_outlined))
        ],
      ),
    );
  }
}

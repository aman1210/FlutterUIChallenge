import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          buildListTile(context, Icons.camera, 'Memories'),
          buildListTile(context, Icons.favorite, 'Favourites'),
          buildListTile(context, LineAwesomeIcons.gift, 'Presents'),
          buildListTile(context, Icons.group, 'Friends'),
          buildListTile(context, LineAwesomeIcons.trophy, 'Memories'),
        ],
      ),
    );
  }

  ListTile buildListTile(
    BuildContext context,
    IconData icon,
    String name,
  ) {
    return ListTile(
      onTap: () {},
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                const Color.fromRGBO(114, 30, 224, 1),
                const Color.fromRGBO(160, 46, 185, 1),
              ],
              stops: [0.5, 0.9],
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
      title: Text(
        '$name',
        style: TextStyle(
          fontFamily: 'LineAwesome',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        size: 30,
      ),
    );
  }
}

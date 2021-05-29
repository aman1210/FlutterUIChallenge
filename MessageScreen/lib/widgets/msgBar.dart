import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MsgBar extends StatelessWidget {
  const MsgBar({
    Key? key,
    required this.smile,
  }) : super(key: key);

  final String smile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 80,
      child: Row(
        children: [
          SvgPicture.asset('assets/images/camera.svg'),
          SizedBox(width: 16),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    smile,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                suffixIconConstraints: BoxConstraints(
                  maxHeight: 40,
                ),
                suffixIcon: Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: SvgPicture.asset('assets/images/send.svg')),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          SvgPicture.asset('assets/images/mic.svg'),
        ],
      ),
    );
  }
}

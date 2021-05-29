import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NameBar extends StatelessWidget {
  const NameBar({
    Key? key,
    required this.maxHeight,
  }) : super(key: key);

  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    var onlineStatus = Positioned(
      right: 0,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.lightGreen,
        ),
      ),
    );
    var contactInfo = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              height: 70,
              width: 70,
              child: Image.asset(
                'assets/images/user_msg.png',
                fit: BoxFit.cover,
              ),
            ),
            onlineStatus,
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          'My Designer',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        )
      ],
    );
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: maxHeight * 0.16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back_ios),
          contactInfo,
          SvgPicture.asset('assets/images/call.svg'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onTap;
  final bool isSelected;

  const CircularContainer(this.imagePath,
      {super.key, required this.title, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                border:
                    Border.all(color: isSelected ? Colors.blue : Colors.grey),
                // image: DecorationImage(
                //   fit: BoxFit.fill,
                //   image: AssetImage('icons/borrow.png'),
                // ),
              ),
              child: Image.asset(imagePath),
            ),
            Text(
              title,
              style: TextStyle(color: isSelected ? Colors.blue : Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InitialService extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String serviceName;
  final double width;
  List<Color> colors;

  InitialService(
      {@required this.serviceName,
      @required this.icon,
      @required this.colors,
      this.iconSize = 28,
      this.width = 64});

  @override
  Widget build(BuildContext context) {
    if (colors == null) colors = [Colors.blue[100], Colors.blue[700]];

    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: serviceName != null ? 8 : 0),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: Icon(
              this.icon,
              color: Colors.black87,
              size: iconSize,
            ),
          ),
          Text(
            this.serviceName ?? "",
            style:
                TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

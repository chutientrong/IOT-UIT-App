import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceHeader extends StatelessWidget {
  final String urlImageBackground;
  final String tag;
  const ServiceHeader({
    Key key,
    this.urlImageBackground,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(tag);
    return Stack(
      children: [
        Hero(
          tag: tag,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              urlImageBackground,
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

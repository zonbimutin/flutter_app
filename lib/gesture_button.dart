import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureButton extends StatelessWidget {
  const GestureButton(
      {
        Key? key,
        required this.isActive,
        required this.image,
        required this.clicksPerSecond,
        required this.price,
        required this.handleTap
      }) : super(key: key);

  final bool isActive;
  final Image image;
  final int clicksPerSecond;
  final Function handleTap;
  final int price;

  @override
  Widget build(BuildContext context) {

    return Opacity(
      opacity: isActive ? 1 : 0.5,
      child: GestureDetector(
          onTap: (){
            if(isActive){
              handleTap();
            }
          },
          child: Column(
            children: [
              image,
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '+ $clicksPerSecond/s',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Row (
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '$price',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/cookie.png',
                    fit: BoxFit.cover, // this is the solution for border
                    width: 15.0,
                    height: 15.0,
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }
}


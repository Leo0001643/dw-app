

import 'package:flutter/material.dart';
import 'package:red_task/src/red_task_service.dart';

abstract class AppRedTheme {


  static const Color headerTimeColor = Color.fromRGBO(255, 222, 63, 1);
  static const Color GrabTimeColor = Color.fromRGBO(255, 255, 0, 1);
  static const Color styleColor = Color.fromRGBO(255, 195, 79, 1);

  static const Color banner = Color(0xff797B82);
  static const Color bannerBg = Color(0xff1C1E29);
  static const Color commonBg = Color(0xff0B0D1B);

  static const  selGradient =  LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors:
                            
                                 [
                                     Color.fromRGBO(255, 78, 83, 0.5),
                                     Color.fromRGBO(212, 179, 111, 0.5),
                                     Color.fromRGBO(212, 230, 208, 1),
                                  ]
                                  
                                );
  static const  selGradient2 =  LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors:
                               
                               [
                                   Color.fromRGBO(255, 78, 83, 1),
                                   Color.fromRGBO(255, 78, 83, 1),

                                 ]   
                                );
                                

  static const norGradient =  LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors:

                              [
                                     Color.fromRGBO(250, 238, 235, 1),
                                     Color.fromRGBO(253, 208, 168, 1),
                                ]
                                );

  static const norGradient2 =  LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors:

                              [
                                     Color.fromRGBO(201, 201, 201, 1),
                                     Color.fromRGBO(201, 201, 201, 1),
                                ]
                                );
                              

}

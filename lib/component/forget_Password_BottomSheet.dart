import 'package:brand_bridge/theme/theme.dart';
import 'package:flutter/material.dart';

class ForgetPasswordBottomSHeet {
  static Future<dynamic> showmodalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
                              
                              context: context,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              builder: (context) => Container(
                                decoration: BoxDecoration(
                                    gradient: AppColors.gradientBackground),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child:  Column(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Make selection!",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        "Select Any Option to reset your password",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blueGrey,
                                            ),
                                      ),
                                      
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.blueGrey,
                                        ),
                                        child: const Row(
                                          children: [
                                            Icon(Icons.mail,size: 60),
                                            SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("E-Mail",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                                Text("Reset password via Email"),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application_color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        builder: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            title: Consumer<ApplicationColor>(
                          builder: (context, applicationColor, _) => Text(
                "Provider State Management",
                style: TextStyle(color: applicationColor.color),
              ),
            ),
          ) ,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ApplicationColor>(
                                  builder: (context, applicationColor, _) AnimatedContainer(
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    color: Colors.lightBlue,
                    duration: Duration(milliseconds: 500),
                    ),
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(margin: EdgeInsets.all(5), child: Text("AB")),
                      Consumer<ApplicationColor>(builder: context, applicationColor, _) => Switch(
                        value: applicationColor.isLightBlue, 
                        onChanged: (newValue){},
                      ),
                      Container(margin: EdgeInsets.all(5), child: Text("LB"))
                    ],
                  )
              ],
            ),),
        ),
      ),
    );
  }
}
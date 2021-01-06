import 'package:flutter/material.dart';
import 'package:flutter_app/demo_animation/delayed.dart';
import 'package:flutter_app/demo_animation/demo1.dart';
import 'package:flutter_app/modal/item_list_anim.dart';

import 'demo_animation/parenting_nnimations.dart';

void main() {
  runApp(MyApp());
}

/*Animation Flutter*/
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


/*Note : AnimatedBuilder widget là một widget rất hữu ích khi xây dựng animation.
 Nó hiệu quả hơn việc gọi setState() mỗi khi có sự thay đổi giá trị của animation*/

class _MyHomePageState extends State<MyHomePage> {
  List<AnimationItemList> list = AnimationItemList.createListItem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Animation"),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (list[index]
                      .title
                      .toString()
                      .contains("Transform_Translation")) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DemoOne()),
                    );
                  }
                  if (list[index]
                      .title
                      .toString()
                      .contains("Delayed_Animation")) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DemoDelayed()),
                    );
                  }  if (list[index]
                      .title
                      .toString()
                      .contains("Parenting_Animations")) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Parenting_Animations()),
                    );
                  }
                },
                child: Container(
                  child: ListTile(
                    title: Text(list[index].title),
                    subtitle: Text(list[index].title),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(list[index].imageUrl),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

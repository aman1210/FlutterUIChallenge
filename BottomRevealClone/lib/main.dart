import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Reveal Clone'),
      ),
      body: Stack(
        children: [
          Container(
              height: size.height,
              width: size.width,
              color: Theme.of(context).primaryColor.withBlue(120)),
          Positioned(
            bottom: 80,
            right: 0,
            child: Container(
              height: 270,
              width: 80,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildOption(Icons.play_arrow),
                  buildOption(Icons.image),
                  buildOption(Icons.camera),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              // color: Colors.blue,
              height: 80,
              width: size.width * 0.8,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  height: 60,
                  width: size.width * 0.7,
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          border: InputBorder.none
                          // contentPadding: const EdgeInsets.all(0),
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: enabled ? -100 : 0,
            left: enabled ? -100 : 0,
            child: AnimatedContainer(
              curve: Curves.bounceInOut,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              duration: Duration(milliseconds: 300),
              height: size.height - 80,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(enabled ? 40 : 0),
                ),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: Icon(Icons.celebration),
                    title: Text(
                      'Item number ${index + 1}',
                    ),
                  ),
                ),
                itemCount: 100,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            enabled = !enabled;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Container buildOption(IconData icon) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        size: 40,
        color: Colors.white,
      ),
    );
  }
}

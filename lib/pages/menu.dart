import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Color.fromARGB(0, 255, 255, 255),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /**
                   * Logo
                   */
                  Image(
                    //image: NetworkImage('https://drive.google.com/uc?export=view&id=1Aq0Kc8un1G7zbv4deu0nDO9w9YhCFtiF'),
                    image: AssetImage('images/logo.png'),
                    width: 409,
                  ),
                  Padding(padding: EdgeInsets.only(top: 31),),
                  /**
                   * Add button
                   */
                  SizedBox(
                    width: 240,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 159, 107, 121),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/add');
                      },
                      child: Text('Добавить ребенка', style: TextStyle(
                        fontSize: 20,
                      ),),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 37),),
                  /**
                   * List button
                   */
                  SizedBox(
                    width: 240,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 159, 107, 121),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/list');
                      },
                      child: Text('Посмотреть список', style: TextStyle(
                        fontSize: 20,
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
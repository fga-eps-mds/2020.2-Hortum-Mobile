import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff47CC70).withOpacity(0.7),
                  Color(0xff1D8E40).withOpacity(0.7),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              height: size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: size.width * 0.08),
                    child: MaterialButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return null;
                        // }));
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: size.width * 0.2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                margin:
                                    EdgeInsets.only(top: size.height * 0.005),
                                child: Icon(
                                  Icons.favorite,
                                  size: 35,
                                  color: Colors.white,
                                )),
                            Container(
                              margin: EdgeInsets.only(top: size.height * 0.005),
                              child: Text(
                                'Favoritos',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: size.width * 0.08),
                    child: MaterialButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return null;
                        // }));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: size.height * 0.005),
                              child: Icon(
                                Icons.account_circle,
                                size: 35,
                                color: Colors.white,
                              )),
                          Container(
                              margin: EdgeInsets.only(top: size.height * 0.005),
                              child: Text(
                                'Perfil',
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                bottom: size.height * 0.05,
              ),
              child: MaterialButton(
                child: Container(
                  height: size.width * 0.18,
                  width: size.width * 0.18,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [Color(0xff5EED47), Color(0xff67B980)],
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black.withOpacity(0.25)),
                  ),
                  child: Icon(Icons.format_align_justify_rounded,
                      color: Colors.white, size: 30),
                ),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return null;
                  // }));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

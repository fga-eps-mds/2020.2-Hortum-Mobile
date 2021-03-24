import 'package:flutter/material.dart';
import 'package:hortum_mobile/components/announcement_box.dart';
import 'package:hortum_mobile/components/footer.dart';
import 'package:hortum_mobile/views/home_customer/components/categories.dart';

class CustomerHomePage extends StatefulWidget {
  @override
  _CustomerHomePageState createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  final TextEditingController _filter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.08),
                padding: EdgeInsets.only(left: 10),
                height: size.height * 0.25,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(right: size.width * 0.01),
                      child: TextButton(
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                child: Material(
                                  child: InkWell(
                                      child: Image.asset(
                                          categories[index]['image_path'],
                                          fit: BoxFit.fill,
                                          height: size.height * 0.12,
                                          width: size.height * 0.12)),
                                ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  categories[index]['name'],
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Bold',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                  width: size.width * 0.8,
                  height: size.height * 0.04,
                  padding: EdgeInsets.only(
                      left: size.width * 0.02, right: size.width * 0.05),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.4)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Pesquisar",
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(bottom: size.height * 0.018)),
                    cursorColor: Colors.black.withOpacity(0.2),
                    controller: _filter,
                    onChanged: (value) {
                      setState(() {});
                    },
                  )),
              Container(
                height: size.height * 0.45,
                padding: EdgeInsets.only(
                    right: size.width * 0.05, left: size.width * 0.05),
                margin: EdgeInsets.only(top: size.height * 0.06),
                child: ListView.builder(
                  itemCount: announcements.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    if (announcements[index]['title']
                        .toString()
                        .toLowerCase()
                        .contains(_filter.text.toLowerCase())) {
                      return AnnouncementBox(
                          profilePic: announcements[index]['profilePic'],
                          name: announcements[index]['name'],
                          title: announcements[index]['title'],
                          localization: announcements[index]['localization'],
                          price: announcements[index]['price'],
                          productPic: announcements[index]['productPic']);
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
        Footer()
      ]),
    );
  }
}

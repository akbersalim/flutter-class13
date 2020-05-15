import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookBody extends StatefulWidget {
  @override
  _BookBodyState createState() => _BookBodyState();
}

class _BookBodyState extends State<BookBody> {
  @override
  var name = [
    "Dune",
    "A Sword of Ice and Fire",
    "A Clash of Kings",
    "A Feast for Crows",
    "A Storm of Swords",
    "A Dance with Dragons",
    "Kimetsu no Yaiba",
    "Shingeki no Kyogin",
    "The Philosopher's Stone",
    "Chamber of Secrets",
    "Prisoner of Askaban"
  ];
  var auth = [
    "Frank Herbert",
    "G.R.R Martin",
    "G.R.R Martin",
    "G.R.R Martin",
    "G.R.R Martin",
    "G.R.R Martin",
    "Koyoharu Gotouge",
    "Hajime Isayama",
    "J.K Rowling",
    "J.K Rowling",
    "J.K Rowling"
  ];
  var bkno = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController authcontroller = TextEditingController();
    TextEditingController bknocontroller = TextEditingController();
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  labelText: "Enter book name",
                  labelStyle: TextStyle(color: Colors.blue),
                  hintText: "Name:",
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: authcontroller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  labelText: "Enter author",
                  labelStyle: TextStyle(color: Colors.blue),
                  hintText: "Author:",
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: bknocontroller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  labelText: "Enter book no:",
                  labelStyle: TextStyle(color: Colors.blue),
                  hintText: "Book No:",
                  border: OutlineInputBorder()),
            ),
            RaisedButton(
              elevation: 10.0,
              highlightElevation: 1.0,
              splashColor: Colors.blueAccent,
              onPressed: () {
                var nam = namecontroller.text;
                var aut = authcontroller.text;
                var bkn = bknocontroller.text;
                namecontroller.clear();
                authcontroller.clear();
                bknocontroller.clear();
                setState(() {
                  nam != "" ? name.add(nam.toString()) : name.add("");
                  aut != "" ? auth.add(aut.toString()) : auth.add("");
                  bkn != "" ? bkno.add(int.parse(bkn)) : bkno.add(0);
                });
              },
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
              child: Text(
                "ENTER",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 611,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: name.length == null ? 0 : name.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3.0,
                    child: ListTile(
                      leading: Icon(
                        Icons.book,
                        color: Colors.blue,
                        size: 50.0,
                      ),

                      /*ClipOval(
                        child: Image(
                          image: NetworkImage(imag[index]),
                          height: 40.0,
                        ),
                      ),*/
                      trailing: MaterialButton(
                          onPressed: () {
                            setState(() {
                              name.removeAt(index);
                              auth.removeAt(index);
                              bkno.removeAt(index);
                            });
                          },
                          highlightColor: Colors.blueAccent,
                          shape: CircleBorder(),
                          elevation: 20.0,
                          child: Icon(
                            Icons.delete,
                            color: Colors.blue,
                          )),
                      title: Text(
                        "Name: " + name[index],
                        style: TextStyle(color: Colors.blue),
                      ),
                      subtitle: Text("Author: " +
                          auth[index] +
                          "\n" +
                          "Book No: " +
                          bkno[index].toString()),
                    ),
                  );
                },
              ),
            ),
          ]),
    );
  }
}

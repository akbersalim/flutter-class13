import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PdtBody extends StatefulWidget {
  @override
  _PdtBodyState createState() => _PdtBodyState();
}

class _PdtBodyState extends State<PdtBody> {
  @override
  var name = [
    "Soap",
    "Sanitizer",
    "Handwash",
    "Magazine",
    "Chocolate",
    "Stationary Item",
    "Wheat",
    "Vegitable",
    "Meat",
    "Fruit",
    "Packaged Snacks"
  ];
  var pdid = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  var pric = [100, 120, 130, 140, 150, 160, 157, 148, 96, 110, 191];

  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController pdidcontroller = TextEditingController();
    TextEditingController priccontroller = TextEditingController();
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
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  labelText: "Enter product name",
                  labelStyle: TextStyle(color: Colors.green),
                  hintText: "Name:",
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: pdidcontroller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  labelText: "Enter product id",
                  labelStyle: TextStyle(color: Colors.green),
                  hintText: "Employee Id:",
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: priccontroller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  labelText: "Enter price",
                  labelStyle: TextStyle(color: Colors.green),
                  hintText: "Price",
                  border: OutlineInputBorder()),
            ),
            RaisedButton(
              elevation: 10.0,
              highlightElevation: 1.0,
              splashColor: Colors.greenAccent,
              onPressed: () {
                var nam = namecontroller.text;
                var pid = pdidcontroller.text;
                var pri = priccontroller.text;
                namecontroller.clear();
                pdidcontroller.clear();
                priccontroller.clear();
                setState(() {
                  name.add(nam.toString());
                  pdid.add(int.parse(pid));
                  pric.add(int.parse(pri));
                });
              },
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
              child: Text(
                "ENTER",
                style: TextStyle(color: Colors.green),
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
                        Icons.account_circle,
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
                              pdid.removeAt(index);
                              pric.removeAt(index);
                            });
                          },
                          highlightColor: Colors.greenAccent,
                          shape: CircleBorder(),
                          elevation: 20.0,
                          child: Icon(
                            Icons.delete,
                            color: Colors.green,
                          )),
                      title: Text(
                        "Name: " + name[index],
                        style: TextStyle(color: Colors.green),
                      ),
                      subtitle: Text("Product Id: " +
                          pdid[index].toString() +
                          "\n" +
                          "Price: " +
                          pric[index].toString()),
                    ),
                  );
                },
              ),
            ),
          ]),
    );
  }
}

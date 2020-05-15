import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmpBody extends StatefulWidget {
  @override
  _EmpBodyState createState() => _EmpBodyState();
}

class _EmpBodyState extends State<EmpBody> {
  @override
  var name = [
    "Gohan",
    "Nezuko",
    "Eren",
    "Shigeo",
    "Ritsu",
    "Jia",
    "Izuku",
    "Katsuki",
    "Kurapika",
    "Leorio",
    "Ashish"
  ];
  var emid = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  var sala = [1000, 1020, 1300, 1400, 1450, 1460, 1470, 1480, 1590, 1610, 1711];

  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController emidcontroller = TextEditingController();
    TextEditingController salacontroller = TextEditingController();
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
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  labelText: "Enter employee name",
                  labelStyle: TextStyle(color: Colors.red),
                  hintText: "Name:",
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: emidcontroller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  labelText: "Enter employee id",
                  labelStyle: TextStyle(color: Colors.red),
                  hintText: "Employee Id:",
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: salacontroller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  labelText: "Enter Salary",
                  labelStyle: TextStyle(color: Colors.red),
                  hintText: "Salary",
                  border: OutlineInputBorder()),
            ),
            RaisedButton(
              elevation: 10.0,
              highlightElevation: 1.0,
              splashColor: Colors.redAccent,
              onPressed: () {
                var nam = namecontroller.text;
                var eid = emidcontroller.text;
                var sal = salacontroller.text;
                namecontroller.clear();
                emidcontroller.clear();
                salacontroller.clear();
                setState(() {
                  nam != "" ? name.add(nam.toString()) : name.add("");
                  eid != "" ? emid.add(int.parse(eid)) : emid.add(0);
                  sal != "" ? sala.add(int.parse(sal)) : sala.add(0);
                });
              },
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
              child: Text(
                "ENTER",
                style: TextStyle(color: Colors.red),
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
                        color: Colors.red,
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
                              emid.removeAt(index);
                              sala.removeAt(index);
                            });
                          },
                          highlightColor: Colors.redAccent,
                          shape: CircleBorder(),
                          elevation: 20.0,
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                      title: Text(
                        "Name: " + name[index],
                        style: TextStyle(color: Colors.red),
                      ),
                      subtitle: Text("Employee Id: " +
                          emid[index].toString() +
                          "\n" +
                          "Salary: " +
                          sala[index].toString()),
                    ),
                  );
                },
              ),
            ),
          ]),
    );
  }
}

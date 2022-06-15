// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:sample/model/user.dart';
import 'package:sample/screen/drawer/drawer.dart';
import 'package:sample/screen/home_sc.dart';
import 'package:sample/screen/second.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  // static void setLocale(BuildContext context, Locale newLocale) {
  //var state = context.findAncestorStateOfType<_MyAppState>();
  //state!.setLocale(newLocale);
  // }

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Locale? _locale;

  // void setLocale(Locale locale) {
  //   setState(() {
  //     _locale = locale;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // locale: _locale,
        // localizationsDelegates: AppLocalizations.localizationsDelegates,
        // supportedLocales: AppLocalizations.supportedLocales,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: FirstPade());
  }
}

class FirstPade extends StatefulWidget {

  @override
  State<FirstPade> createState() => _FirstPadeState();
}

class _FirstPadeState extends State<FirstPade> {
// late Future<User>userdata;
// Map<String, dynamic> userMap = jsonDecode(jsonString);
// var user = User.fromJson(userMap);

  double? ratingValue;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController notescontroller = TextEditingController();
  TextEditingController dateconteoller = TextEditingController();
  String _singleValue = "";
  dynamic selectstate = "";
  bool selected = false;
  List items = [];
  List radioBT = [];
  List dropDown = [];
  List checkBox = [];
  List<String> chipfilter = [];
  List<String> getcheck = [];
  List chip = [];
  int value = 2;
  String dropDownvalue = "";
  double slidevalue = 0;
  late List<DropdownMenuItem<int>> dropDownItems;
  bool isSwitched = false;
  bool isSwitched2 = false;
  var textValue = 'Dont share Profile';

  //late List<CheckboxMenuitem<int>>checkItems;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    var data = await json.decode(response);
    Items items = Items.fromJson(data);
    print(jsonEncode(items));
    /* setState(() {
      items = data["items"];
    });
    radioBT = items[2]["data"];
    dropDown = items[3]["data"];
    checkBox = items[4]["checkbox"];
    chip = items[5]["chip"];
    dropDownItems = List.generate(
      dropDown.length,
      (i) => DropdownMenuItem(
        value: int.parse(dropDown[i]["idattribute"]),
        child: Text("${dropDown[i]["attrName"]}"),
      ),
    ); */
  }

  List<Map> checkboxs = [
    {"name": "Foobball", "isChecked": false},
    {"name": "Baseball", "isChecked": false},
    {"name": "Video Games", "isChecked": false},
    {"name": "Readding Books", "isChecked": false},
    {"name": "Surfling The Internet", "isChecked": false}
  ];

  String dropdownvalue = '';
  @override
  Widget build(BuildContext context) {
    readJson();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback"),
      ),
      drawer: Drawer(
        child: Container(
            margin: EdgeInsets.only(left: 10),
            color: Colors.white,
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 40.0),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:  [
                        Expanded(
                            child:
                                MenuProfileContent("SP", "Seva", "9943120520")),
                      ],
                    ),
                  ),
                ),
                Listtitle(icon: Icons.home, title: "My profile", ontap: () {}),
                Listtitle(
                    icon: Icons.access_alarm, title: "Second", ontap: () {}),
                Listtitle(
                    title: "Privicy notice", ontap: () {}, icon: Icons.note),
                Listtitle(
                    title: "Change phone number",
                    ontap: () {},
                    icon: Icons.phone),
                Listtitle(
                    title: "Terms and conditions",
                    ontap: () {},
                    icon: Icons.theater_comedy),
                Listtitle(
                    title: "About",
                    ontap: () {},
                    icon: Icons.warning_amber_outlined),
                Listtitle(
                    title: "Language", ontap: () {}, icon: Icons.language),
                Listtitle(title: "Logout", ontap: () {}, icon: Icons.logout)
              ],
            )),
      ),
      body: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.only(top: 25, left: 25, right: 20, bottom: 10),
          child: Column(
            children: [
              // ElevatedButton(onPressed: readJson, child: const Text("View Form")),
              items.isNotEmpty
                  ? Expanded(
                      child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[0]["FormName"],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          //Text(items[0]["List"][0]["color"])
                          const SizedBox(
                            height: 20,
                          ),

                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Title(title: "Name")),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextField(
                              autocorrect: false,
                              controller: namecontroller,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[0-9a-zA-Z]")),
                                LengthLimitingTextInputFormatter(
                                    items[1]["maxlengeth"])
                              ],
                              decoration: InputDecoration(
                                labelText: items[1]["Lablename"],
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const Divider(),
                          Padding(
                              padding: const EdgeInsets.all(15),
                              child: Title(
                                title: items[2]["title"],
                              )),
                          Row(
                            children: [
                              RadioButton(
                                description: radioBT[0]["data1"],
                                value: radioBT[0]["data1"].toString(),
                                groupValue: _singleValue,
                                onChanged: (value) => setState(
                                  () => _singleValue = value.toString(),
                                ),
                                activeColor: Colors.red,
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              RadioButton(
                                description: radioBT[1]["data2"],
                                value: radioBT[1]["data2"].toString(),
                                groupValue: _singleValue,
                                onChanged: (value) => setState(
                                  () => _singleValue = value.toString(),
                                ),
                                activeColor: Colors.red,
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              RadioButton(
                                description: radioBT[2]["data3"],
                                value: radioBT[2]["data3"].toString(),
                                groupValue: _singleValue,
                                onChanged: (value) => setState(
                                  () => _singleValue = value.toString(),
                                ),
                                activeColor: Colors.red,
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Padding(
                              padding: const EdgeInsets.all(15),
                              child: Title(
                                title: items[3]["title"],
                              )),

                          const SizedBox(
                            height: 20,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: DropdownButtonFormField(
                                hint: Title(title: "Select state"),
                                items: dropDownItems,
                                value: value,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    // borderSide: BorderSide(color: Colors.red, width: 2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                dropdownColor: Colors.white,
                                onChanged: (newValue) {
                                  setState(() {
                                    dropdownvalue = newValue.toString();
                                    dynamic selectdata = dropDown.firstWhere(
                                        (element) =>
                                            element['idattribute'] ==
                                            dropdownvalue);
                                    selectstate = selectdata["attrName"];
                                    debugPrint(selectstate);
                                  });
                                }),
                          ),

                          const Divider(),

                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Choose your hobbies:',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 10),

                                  // The checkboxes will be here
                                  Column(
                                      children: checkboxs.map((hobby) {
                                    return CheckboxListTile(
                                        value: hobby["isChecked"],
                                        title: Text(hobby["name"]),
                                        onChanged: (newValue) {
                                          setState(() {
                                            hobby["isChecked"] = newValue;
                                          });
                                          // debugPrint(checkBox[0]["isChecked"]
                                          //     .toString());
                                        });
                                  }).toList()),
                                  // Display the result here
                                  const SizedBox(height: 10),

                                  Wrap(
                                    children: checkboxs.map((hobby) {
                                      if (hobby["isChecked"] == true) {
                                        //  getcheck.add(hobby["name"]);
                                        return Card(
                                          elevation: 3,
                                          color: Colors.red,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(hobby["name"],
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        );
                                      }
                                      return Container();
                                    }).toList(),
                                  )
                                ]),
                          ),

                          const Divider(),

                          const SizedBox(
                            height: 10,
                          ),

                          const Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 10, bottom: 10),
                            child: Text(
                              "Note",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          TextField(
                            maxLines: 7,
                            controller: notescontroller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          Title(title: "Date"),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextField(
                                controller: dateconteoller,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.calendar_today),
                                    hintText: "Date"),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickedDate);
                                    setState(() {
                                      dateconteoller.text = formattedDate;
                                    });
                                  }
                                },
                              )),
                          const Divider(),

                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Text(
                                  textValue,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const Spacer(),
                                Expanded(
                                  child: Transform.scale(
                                    scale: 2,
                                    child: Switch(
                                        value: isSwitched,
                                        onChanged: (vaue) {
                                          setState(() {
                                            if (isSwitched == false) {
                                              setState(() {
                                                isSwitched = true;
                                                textValue = ' share Profile';
                                              });
                                            } else {
                                              setState(() {
                                                isSwitched = false;
                                                textValue =
                                                    'Dont share Profile';
                                              });
                                            }
                                          });
                                        },
                                        activeColor: Colors.red,
                                        activeTrackColor: Colors.red[200]
                                        //inactiveTrackColor: ,
                                        // inactiveThumbColor: Colors.redAccent,
                                        // inactiveTrackColor: Colors.orange,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          const Divider(),

                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Title(title: "Your score %")),

                          Slider(
                            value: slidevalue,
                            max: 100,
                            divisions: 20,
                            label: slidevalue.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                slidevalue = value;
                              });
                            },
                          ),
                          const Divider(),

                          Row(
                            children: [
                              Title(title: "Rating"),
                              RatingBar(
                                  initialRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  ratingWidget: RatingWidget(
                                      full: const Icon(Icons.star,
                                          color: Colors.orange),
                                      half: const Icon(
                                        Icons.star_half,
                                        color: Colors.orange,
                                      ),
                                      empty: const Icon(
                                        Icons.star_outline,
                                        color: Colors.orange,
                                      )),
                                  onRatingUpdate: (value) {
                                    setState(() {
                                      ratingValue = value;
                                    });
                                  }),
                            ],
                          ),

                          const SizedBox(
                            height: 18,
                          ),

                          Container(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                onTap: () {
                                  getcheck.clear();
                                  debugPrint(ratingValue.toString());
                                  for (var element in checkboxs) {
                                    if (element["isChecked"] == true) {
                                      getcheck.add(element["name"]);
                                    }
                                  }

                                  if (namecontroller.text.isNotEmpty &&
                                      _singleValue.isNotEmpty &&
                                      dropdownvalue.isNotEmpty &&
                                      dateconteoller.text.isNotEmpty &&
                                      getcheck.isNotEmpty &&
                                      slidevalue >= 1 &&
                                      ratingValue! >= 0) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Secndpage(
                                                namecontroller.text,
                                                _singleValue,
                                                selectstate,
                                                getcheck,
                                                ratingValue!,
                                                dateconteoller.text,
                                              )),
                                    );

                                    // const snackBar = SnackBar(
                                    //   content: Text("Form Submited"),
                                    // );
                                    // ScaffoldMessenger.of(context)
                                    //     .showSnackBar(snackBar);

                                  } else {
                                    const snackBar = SnackBar(
                                        content: Text("fill the * field"));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    // getcheck.clear();
                                    // debugPrint(ratingValue.toString());
                                    // for (var element in availableHobbies) {
                                    //   if (element["isChecked"] == true) {
                                    //     getcheck.add(element["name"]);
                                    //   }
                                    // }
                                  }
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.red,
                                    ),
                                    height: 60),
                              )),
                        ],
                      ),
                    ))
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  String title;
  Title({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const Text(
          "*",
          style: TextStyle(color: Colors.red, fontSize: 18),
        )
      ],
    );
  }
}

class Listtitle extends StatelessWidget {
  String title;
  Function ontap;
  IconData icon;
  Listtitle(
      {Key? key, required this.title, required this.ontap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
      onTap: () {
        ontap();
      },
    );
  }
}

/*
class FirstPade extends StatefulWidget {
  const FirstPade({Key? key}) : super(key: key);

  @override
  _FirstPadeState createState() => _FirstPadeState();
}

class _FirstPadeState extends State<FirstPade> {
  late String radioValue; //Initial definition of radio button value
  // late String choice;
  final _formKey = GlobalKey<FormState>();
  // @override
  //  void initState() {
  //   setState(() {
  //     radioValue = "one";
  //   });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('GeeksforGeeks'),
          ),
          body: Form(
            
            key: _formKey,
            child: Container(
              margin:const EdgeInsets.all(15),
              child: Column(
                
                children: [
                TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                    inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    obscureText: true,
                    decoration: const InputDecoration(
                      //border: InputBorder.,
                      labelText: 'Name',
                    )),
                /* Row(
                  children: [
                    ListTile(
                      title: Text("data1"),
                      leading: Radio(value: "Data4", groupValue: radioValue, 
                      onChanged: (value){setState(() {
                        radioValue=value.toString();
                      });}),
                    ),
                    ListTile(
                      title: Text("data2"),
                      leading: Radio(value: "Data4", groupValue: radioValue, 
                      onChanged: (value){setState(() {
                        radioValue=value.toString();
                      });}),
                    ),
                    ListTile(
                      title: Text("data3"),
                      leading: Radio(value: "Data4", groupValue: radioValue, 
                      onChanged: (value){setState(() {
                        radioValue=value.toString();
                      });}),
                    ),ListTile(
                      title: Text("data4"),
                      leading: Radio(value: "Data4", groupValue: radioValue, 
                      onChanged: (value){setState(() {
                        radioValue=value.toString();
                      });}),
                    )
                  ],
                ),*/
                const Text("drop down"),
                Expanded(
                    child: Container(
                  alignment: Alignment.bottomCenter,
                  child:const  Text("SUBMIT"),
                ))
              ]),
            ),
          )),
    );
  }
}*/

/*...............RefreshIndicator.................

RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 1), () {
              print("Referes");
            });
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              child: Center(
                  child: Stack(
                children: [
                  Container(
                    child: Text("data"),
                  )
                ],
              )),
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
....................................................................*/

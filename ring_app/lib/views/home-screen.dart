import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ring_app/controllers/shopping-list-controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _limit = TextEditingController();
  final TextEditingController _offset = TextEditingController();
  var controller = Get.put(ShoppingListController());

  void submit() async {
    setState(() {
      if (formKey.currentState!.validate()) {
        print("validated");
        controller.getList(_city.text, _limit.text, _offset.text);
      } else {
        print("not validated");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.jpg",
                height: 150,
                width: 150,
              ),
              Text("News, shops, products and good plans nearby"),
              Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Center(
                    child: Container(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _city,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == "" || value!.isEmpty) {
                                return "Please enter city name";
                              }
                              return null;
                            },
                            onChanged: (String val) {},
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              hintText: "Lille",
                              labelText: "City",
                            ),
                          ),
                          TextFormField(
                            controller: _limit,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == "" || value == null) {
                                return "Please enter number of records you want to see";
                              }
                              return null;
                            },
                            onChanged: (String val) {},
                            decoration: InputDecoration(
                              hintText: "10",
                              labelText: "Number of records wants to see",
                            ),
                          ),
                          TextFormField(
                            controller: _offset,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == "" || value == null) {
                                return "Please enter offset value";
                              }
                              return null;
                            },
                            onChanged: (String val) {},
                            decoration: InputDecoration(
                              hintText: "1",
                              labelText: "Offset",
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 100,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () => submit(),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed))
                                      return Colors.green;
                                    return Color(
                                        0xFF1591C0); // Use the component's default.
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

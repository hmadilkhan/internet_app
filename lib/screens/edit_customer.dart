import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_app/controllers/customer_controller.dart';
import 'package:internet_app/models/area_model.dart';

class EditCustomer extends StatefulWidget {
  // const EditCustomer({Key? key}) : super(key: key);
  const EditCustomer({super.key});

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  final controller = Get.put(CustomerController());

  @override
  void initState() {
    super.initState();
    // print(controller.listAreas.value);
    // for (var element in controller.listAreas.value) {
    //   print(element.name);
    // }
    controller.listAreas.map((area) {
      print(area.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    var customer = Get.arguments;
    final TextEditingController name =
        TextEditingController(text: customer.name);
    final TextEditingController username =
        TextEditingController(text: customer.username);
    final TextEditingController mobile =
        TextEditingController(text: customer.mobile);
    final TextEditingController address =
        TextEditingController(text: customer.address);
    final TextEditingController amount =
        TextEditingController(text: customer.amount);

    String _selectedLocation = customer.area ?? "2"; // Option 2
    String _selectedPackage = customer.package ?? "2"; // Option 2

    return GetBuilder<CustomerController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white
            ),
            title: const Text("Edit Customer",
                style: TextStyle(color: Colors.white)),
            backgroundColor: const Color(0xFF9F7BFF),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                      hintText: 'Enter Name',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: username,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                      hintText: 'Enter Username',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: mobile,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Mobile',
                      border: OutlineInputBorder(),
                      hintText: 'Enter Mobile',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: amount,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                      hintText: 'Enter amount',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                      future: controller.getAreas(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var areas = snapshot.data['data']['areas']!;
                          return DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Area',
                                border: OutlineInputBorder(),
                              ),
                              hint: const Text(
                                  'Please choose a area'), // Not necessary for Option 1
                              value: _selectedLocation,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedLocation = newValue!;
                                });
                              },
                              items:
                                  areas.map<DropdownMenuItem<String>>((area) {
                                return DropdownMenuItem<String>(
                                  value: area['id'].toString(),
                                  child: Text(area['name']),
                                );
                              }).toList());
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                      future: controller.getPackages(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var packages = snapshot.data["data"]["packages"]!;
                          return DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Area',
                                border: OutlineInputBorder(),
                              ),
                              hint: const Text(
                                  'Please choose a Package'), // Not necessary for Option 1
                              value: _selectedPackage,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedPackage = newValue!;
                                });
                              },
                              items: packages
                                  .map<DropdownMenuItem<String>>((area) {
                                return DropdownMenuItem<String>(
                                  value: area['id'].toString(),
                                  child: Text(area['name']),
                                );
                              }).toList());
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    maxLines: 3,
                    controller: address,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                      hintText: 'Enter Address',
                    ),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xFF9F7BFF)),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return Colors.blue.withOpacity(0.04);
                            }
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed)) {
                              return Colors.blue.withOpacity(0.12);
                            }
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () {
                        controller.updateCustomer(customer.id,name.text, username.text, mobile.text, amount.text, _selectedLocation, _selectedPackage, address.text);
                      },
                    ))
              ],
            ),
          ));
    });
  }
}

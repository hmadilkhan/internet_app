import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EditCustomer extends StatefulWidget {
  // final Customer dataList;
  // const EditCustomer({Key? key}) : super(key: key);
  const EditCustomer({super.key});

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  get dataList => null;

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
    final TextEditingController area =
        TextEditingController(text: customer.area);
    final TextEditingController package =
        TextEditingController(text: customer.package);
    List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
    String _selectedLocation = "A"; // Option 2
    String _selectedPackage = "A"; // Option 2

    return Scaffold(
        appBar: AppBar(
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
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                    hintText: 'Enter amount',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Area',
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text(
                      'Please choose a location'), // Not necessary for Option 1
                  value: _selectedLocation,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLocation = newValue!;
                    });
                  },
                  items: _locations.map((location) {
                    return DropdownMenuItem(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Packages',
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text(
                      'Please choose a location'), // Not necessary for Option 1
                  value: _selectedPackage,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedPackage = newValue!;
                    });
                  },
                  items: _locations.map((location) {
                    return DropdownMenuItem(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                ),
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
              )
            ],
          ),
        ));
  }
}

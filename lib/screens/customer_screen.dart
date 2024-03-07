import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:internet_app/controllers/customer_controller.dart';
import 'package:internet_app/models/customer_model.dart';
import 'package:internet_app/screens/edit_customer.dart';
import 'package:internet_app/widgets/custom_drawer.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  var controller = Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customers", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF9F7BFF),
      ),
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<CustomerController>(builder: (controller) {
        return Obx(
          () => controller.listProduct.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemCount: controller.listProduct.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final customer = controller.listProduct[index];
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            backgroundColor: Colors.amber.shade400,
                            icon: Icons.edit,
                            label: 'Edit',
                            onPressed: (context) =>
                                // Get.off(() => EditCustomer(dataList: customer)),
                                Get.to(const EditCustomer(),
                                    arguments: customer),
                          ),
                          SlidableAction(
                            backgroundColor: Colors.red.shade400,
                            icon: Icons.delete,
                            label: 'Delete',
                            onPressed: (context) => _onDismissed(),
                          ),
                        ],
                      ),
                      child: customerTile(customer),
                    );
                  },
                ),
        );
      }),
    );
  }

  _onDismissed() {}
}

Widget customerTile(Customer customer) => ListTile(
      leading: CircleAvatar(
        child: Text("${customer.name?[0].capitalize}"),
      ),
      title: Text(
        customer.name!.toUpperCase(),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontFamily: "Poppins",
        ),
      ),
      subtitle: Text(customer.username.toString()),
      trailing: Text(
        "Rs. ${customer.amount.toString()}",
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontFamily: "Poppins",
        ),
      ),
    );

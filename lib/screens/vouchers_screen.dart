import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:internet_app/controllers/voucher_controller.dart';
import 'package:internet_app/models/voucher_model.dart';
import 'package:internet_app/widgets/custom_drawer.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VoucherContoller());
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Customers", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF9F7BFF),
      ),
      body: GetBuilder<VoucherContoller>(builder: (controller) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          // color: Colors.green.shade400,
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: const Text(
                          "All",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          // color: Colors.green.shade400,
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: const Text(
                          "Paid",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        // color: Colors.red.shade400,
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 1.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: const Text(
                        "Unpaid",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Generate Voucher",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
            Expanded(
              child: Obx(
                () => controller.listVouchers.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        itemCount: controller.listVouchers.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final customer = controller.listVouchers[index];
                          return Slidable(
                            endActionPane: ActionPane(
                              motion: const StretchMotion(),
                              children: [
                                (customer.status == 0
                                    ? SlidableAction(
                                        backgroundColor: Colors.green.shade400,
                                        icon: Icons.money,
                                        label: 'Paid',
                                        onPressed: (context) => {
                                          controller.updateVouchers(
                                              customer.id, 1)
                                        },
                                      )
                                    : SlidableAction(
                                        backgroundColor: Colors.red.shade400,
                                        icon: Icons.money,
                                        label: 'UnPaid',
                                        onPressed: (context) => {
                                          controller.updateVouchers(
                                              customer.id, 0)
                                        },
                                      ))
                              ],
                            ),
                            child: customerTile(customer),
                          );
                        },
                      ),
              ),
            ),
          ],
        );
      }),
    );
  }

  _onDismissed() {}
}

Widget customerTile(Voucher voucher) => ListTile(
    leading: CircleAvatar(
      child: Text("${voucher.name?[0].capitalize}"),
    ),
    title: Text(
      voucher.name!.toUpperCase(),
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: "Poppins",
      ),
    ),
    subtitle: Text(voucher.amount.toString()),
    trailing: Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: voucher.status == 0 ? Colors.red : Colors.green,
        border: Border.all(
          color: voucher.status == 0 ? Colors.redAccent : Colors.green,
          width: 5.0,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Text(
        voucher.status == 0 ? "Unpaid" : "Paid",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    ));

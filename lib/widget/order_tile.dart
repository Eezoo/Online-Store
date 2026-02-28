import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class OrderTile extends StatelessWidget {
  final String items;
  final String paymentMethod;
  final String date;
  final String status;
  final VoidCallback? onTap;

  const OrderTile({
    super.key,
    required this.items,
    required this.paymentMethod,
    required this.date,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                items,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.darkBlue, //Todo: localization
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'طرق الدفع : $paymentMethod', //Payment
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                date,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: _getStatusColor(status),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          status,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    //Todo: localization
    switch (status) {
      case 'قيد الانتظار': //pending
        return Colors.grey;
      case 'قيد المعالجة': //processing
        return Colors.orange;
      case 'تم الشحن': //shipped
        return Colors.blue;
      case 'تم التسليم': //delivered
        return Colors.green;
      case 'تم الإلغاء': //cancelled
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}

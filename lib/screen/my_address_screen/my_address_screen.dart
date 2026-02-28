import '../../utility/extensions.dart';
import 'package:flutter/material.dart';
import '../../utility/app_color.dart';
import '../../widget/custom_text_field.dart';

class MyAddressPage extends StatelessWidget {
  const MyAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.profileProvider.retrieveSavedAddress();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "عنواني", //My Address
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A4F8C)),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: context.profileProvider.addressFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // textDirection: TextDirection.rtl,
                        children: [
                          CustomTextField(
                            labelText: 'رقم الهاتف',
                            controller: context.profileProvider.phoneController,
                            inputType: TextInputType.phone,
                            onSave: (value) {},
                            validator: (value) => value!.isEmpty
                                  ? 'يرجاء ادخال رقم الهاتف'
                                  : null,
                          ),
                          CustomTextField(
                            labelText: 'المدينة',
                            onSave: (value) {},
                            controller: context.profileProvider.cityController,
                            validator: (value) => value!.isEmpty
                                ? 'يرجاء إدخال اسم المدينة'
                                : null,
                          ),
                          CustomTextField(
                            labelText: 'المنطقة',
                            onSave: (value) {},
                            controller: context.profileProvider.streetController,
                            validator: (value) => value!.isEmpty ? 'يرجاء إدخال اسم المنطقة': null,
                          ),
                          CustomTextField(
                            labelText: 'وصف عنوان التوصيل',
                            onSave: (value) {},
                            controller: context.profileProvider.ditleController,
                            validator: (value) => value!.isEmpty
                                ? 'يرجاء وضع وصف عنوان التوصيل'
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.darkBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {
                        if (context.profileProvider.addressFormKey.currentState!
                            .validate()) {
                          context.profileProvider.storeAddress();
                        }
                      },
                      child: const Text('حفظ', //Update Address
                          style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

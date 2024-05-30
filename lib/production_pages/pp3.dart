
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foab_e_traceablity/production_pages/pp4.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';
import '../widget/custome_titile_with_textfield.dart';
import '../widget/custome_title.dart';

class ProductionPage3 extends StatefulWidget {
  const ProductionPage3({super.key});

  @override
  State<ProductionPage3> createState() => _ProductionPage3State();
}

class _ProductionPage3State extends State<ProductionPage3> {
  final List<String> farmingOptions3 = [
    "সংলগ্ন খাল",
   "নদী",
  "ভূগর্ভস্থ পানি",
   "বৃষ্টির পানি",
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomeAppbarUth(title: "উৎপাদন প্রক্রিয়া"),
    body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      CustomTitle(title: "পানির উৎস"),
      SizedBox(height: 20),
        Container(
          height: MediaQuery.of(context).size.height * .3,
          width: MediaQuery.of(context).size.width,
          child: Consumer<FarmingOptionsProvider>(
            builder: (context, provider, child) {
              return ListView.builder(
                physics:  NeverScrollableScrollPhysics(),
                itemCount: farmingOptions3.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    activeColor: Colors.black,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(farmingOptions3[index] ),
                    value: provider.selectedOptions3[index],
                    onChanged: (bool? newValue) {
                      provider.toggleOption3(index);
                    },
                  );
                },
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        const Text("লবণাক্ততা:"),
        const SizedBox(
          height: 10,
        ),
        TitleWithField(
          keyBoardType: TextInputType.number,
            title1: "পানিতে লবণাক্ততার পরিমান?",
            title2: " ",
            textFieldValue:
            Provider.of<FarmingOptionsProvider>(context).saltAmount),
        SizedBox(height: 50),
        CustomeButton(
          title: "পরবর্তী",
          onClicked: () {
            final provider = Provider.of<FarmingOptionsProvider>(
                context,
                listen: false);
            if (provider.selectedOptions3.contains(true)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductionPage4()),
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Warning"),
                    content:
                    Text("Please select at least one option."),
                    actions: [
                      TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ]
      ),
    )
    )
    );
  }
}

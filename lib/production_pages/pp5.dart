
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foab_e_traceablity/production_pages/pp6.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';
import '../widget/custome_titile_with_textfield.dart';
import '../widget/custome_title.dart';

class ProductionPage5 extends StatefulWidget {
  const ProductionPage5({super.key});

  @override
  State<ProductionPage5> createState() => _ProductionPage5State();
}

class _ProductionPage5State extends State<ProductionPage5> {
  final List<String> farmingOptions5 = [
    "হ্যাচারি এসপিএফ",
    "হ্যাচারি নন এসপিএফ",
    "প্রাকৃতিক",
    "প্রাকৃতিক এবং হ্যাচারি উভয়ই",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppbarUth(title: "উৎপাদন প্রক্রিয়া"),
        body: Padding(
            padding: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitle(title: "PL/ Juvenile এর উৎস"),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height*.04,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .3,
                      width: MediaQuery.of(context).size.width,
                      child: Consumer<FarmingOptionsProvider>(
                        builder: (context, provider, child) {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: farmingOptions5.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                activeColor: Colors.black,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(farmingOptions5[index]),
                                value: provider.selectedOptions5[index],
                                onChanged: (bool? newValue) {
                                  provider.toggleOption5(index);
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                     SizedBox(
                      height: MediaQuery.sizeOf(context).height*.04,
                    ),
                    TitleWithField(
                      keyBoardType: TextInputType.number,
                        title1: "বাগদা রেণু মজুদ",
                        title2: "প্রতি বিঘা",
                        textFieldValue:
                            Provider.of<FarmingOptionsProvider>(context)
                                .bagdaAmount),
                    TitleWithField(
                        keyBoardType: TextInputType.number,
                        title1: "গলদা রেণু মজুদ",
                        title2: "প্রতি বিঘা",
                        textFieldValue:
                            Provider.of<FarmingOptionsProvider>(context)
                                .galdaAmount),
                    TitleWithField(
                        keyBoardType: TextInputType.number,
                        title1: "বলদা পিছ",
                        title2: "প্রতি বিঘা",
                        textFieldValue:
                            Provider.of<FarmingOptionsProvider>(context)
                                .bagdaPAmount),
                    TitleWithField(
                        keyBoardType: TextInputType.number,
                        title1: "সাদা মাছ",
                        title2: "প্রতি বিঘা",
                        textFieldValue:
                            Provider.of<FarmingOptionsProvider>(context)
                                .galdaPAmount),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height*.05,
                    ),
                    Text(
                      "***বিশেষ দ্রষ্টব্যঃ  ১ বিঘা = ৩৩ শতাংশ",
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomeButton(
                      title: "পরবর্তী",
                      onClicked: () {
                        final provider = Provider.of<FarmingOptionsProvider>(
                            context,
                            listen: false);
                        if (provider.selectedOptions5.contains(true)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FinalPage()),
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
                  ]),
            )));
  }
}

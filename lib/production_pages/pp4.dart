
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foab_e_traceablity/production_pages/pp5.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';
import '../widget/custome_titile_with_textfield.dart';
import '../widget/custome_title.dart';

class ProductionPage4 extends StatefulWidget {
  const ProductionPage4({super.key});

  @override
  State<ProductionPage4> createState() => _ProductionPage4State();
}

class _ProductionPage4State extends State<ProductionPage4> {
  final List<String> farmingOptions4 = [
    "খামার তৈরি বা মিক্সড খাদ্য",
    "স্থানীয় ফিড মিল",
    "কোম্পানী কর্তৃক বাজারজাতকৃত খাদ্য",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppbarUth(title: "উৎপাদন প্রক্রিয়া"),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child:
                SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                CustomTitle(title: "ব্যবহৃত ফিডের ধরন"),
                                SizedBox(height: MediaQuery.sizeOf(context).height*.04),
                    Container(
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width,
                      child: Consumer<FarmingOptionsProvider>(
                        builder: (context, provider, child) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: farmingOptions4.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                activeColor: Colors.black,
                                controlAffinity: ListTileControlAffinity.leading,
                                title: Text(farmingOptions4[index]),
                                value: provider.selectedOptions4[index],
                                onChanged: (bool? newValue) {
                                  provider.toggleOption4(index);
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TitleWithField(
                      keyBoardType: TextInputType.number,
                        title1: "আপনি দিনে কতবার খাবার খাওয়ান",
                        title2: "বার",
                        textFieldValue:
                        Provider.of<FarmingOptionsProvider>(context).feedAmount),
                    SizedBox(height: 50),
                    CustomeButton(
                      title: "পরবর্তী",
                      onClicked: () {
                        final provider = Provider.of<FarmingOptionsProvider>(
                            context,
                            listen: false);
                        if (provider.selectedOptions4.contains(true)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductionPage5()),
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

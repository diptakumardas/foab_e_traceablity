
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foab_e_traceablity/production_pages/pp3.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_button.dart';
import '../widget/custome_title.dart';

class ProductionPage2 extends StatefulWidget {
  const ProductionPage2({super.key});

  @override
  State<ProductionPage2> createState() => _ProductionPage2State();
}

class _ProductionPage2State extends State<ProductionPage2> {


  final List<String> farmingOptions2 = [
    "ফসল উৎপাদনের পরে পুকুরের তলা শুকানো হয়েছে?",
    "কালো মাটি সরানো হয়েছে?",
    "পাথুরে চুন বা লাইমিং করা হয়েছে কিনা ?",
    "ব্লিচিং ব্যবহার করা হয়েছে?",
    "পানি দেয়ার পূর্বে সম্পূর্ণ পুকুর পরিষ্কার করা হয়েছে?",
    "অবাঞ্ছিত গাছপালা পরিষ্কার করা হয়েছে কিনা?",
    "রাক্ষুসে ও অবাঞ্ছিত মাছ সরানো হয়েছে?",
    "পাড় মেরামত ও উঁচু করে বাঁধা হয়েছে কিনা",
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
              CustomTitle(title: "পুকুর প্রস্তুতি"),
              SizedBox(height: MediaQuery.sizeOf(context).height*.04),
              Container(
                height: MediaQuery.of(context).size.height * .65,
                width: MediaQuery.of(context).size.width,
                child: Consumer<FarmingOptionsProvider>(
                  builder: (context, provider, child) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: farmingOptions2.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          activeColor: Colors.black,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(farmingOptions2[index]),
                          value: provider.selectedOptions2[index],
                          onChanged: (bool? newValue) {
                            provider.toggleOption2(index);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              CustomeButton(
                title: "পরবর্তী",
                onClicked: () {
                  final provider = Provider.of<FarmingOptionsProvider>(
                      context,
                      listen: false);
                  if (provider.selectedOptions2.contains(true)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductionPage3()),
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
            ],
          ),
        ),
      ),
    );;
  }
}

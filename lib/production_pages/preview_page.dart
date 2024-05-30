import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/screen_provider.dart';
import '../widget/custome_appbar_uthpadon.dart';
import '../widget/custome_titile_with_textfield.dart';
import '../widget/custome_title.dart';

class PreviewPage extends StatefulWidget {
  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  final List<String> farmingOptions2 = [
    "ফসল উৎপাদনের পরে পুকুরের তলা শুকানো হয়েছে?",
    "কালো মাটি সরানো হয়েছে?",
    "পাথুরে চুন বা লাইমিং করা হয়েছে কিনা ?",
    "ব্লিচিং ব্যবহার করা হয়েছে?",
    "পানি দেয়ার পূর্বে সম্পূর্ণ পুকুর পরিষ্কার করা হয়েছে?",
    "ব্অবাঞ্ছিত গাছপালা পরিষ্কার করা হয়েছে কিনা?",
    "বরাক্ষুসে ও অবাঞ্ছিত মাছ সরানো হয়েছে?",
    "পাড় মেরামত ও উঁচু করে বাঁধা হয়েছে কিনা",
  ];

  final List<String> farmingOptions3 = [
    "ফসল উৎপাদনের পরে পুকুরের তলা শুকানো হয়েছে?",
    "কালো মাটি সরানো হয়েছে?",
    "পাথুরে চুন বা লাইমিং করা হয়েছে কিনা ?",
    "ব্লিচিং ব্যবহার করা হয়েছে?",
    "পানি দেয়ার পূর্বে সম্পূর্ণ পুকুর পরিষ্কার করা হয়েছে?",
    "ব্অবাঞ্ছিত গাছপালা পরিষ্কার করা হয়েছে কিনা?",
    "বরাক্ষুসে ও অবাঞ্ছিত মাছ সরানো হয়েছে?",
    "পাড় মেরামত ও উঁচু করে বাঁধা হয়েছে কিনা",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppbarUth(title: "Preview Selected Options"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitle(title: "পুকুর প্রস্তুতি (Page 1)"),
              SizedBox(height: 20),
              Consumer<FarmingOptionsProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: farmingOptions2.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        activeColor: Colors.black,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(farmingOptions2[index]),
                        value: provider.selectedOptions2[index],
                        onChanged: null, // Disable checkbox interaction
                      );
                    },
                  );
                },
              ),
              Consumer<FarmingOptionsProvider>(
                  builder: (context, provider, child) {
                return TitleWithField(
                  readOnly: true,
                  title1: "চাষযোগ্য মোট জমির পরিমান",
                  title2: "শতাংশ",
                  textFieldValue:
                      Provider.of<FarmingOptionsProvider>(context).landArea,

                  /*Provider.of<FarmingOptionsProvider>(context).landArea*/
                );
              }),
              SizedBox(height: 50),
              CustomTitle(title: "পুকুর প্রস্তুতি (Page 2)"),
              SizedBox(height: 20),
              Consumer<FarmingOptionsProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: farmingOptions3.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        activeColor: Colors.black,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(farmingOptions3[index]),
                        value: provider.selectedOptions2[index],
                        onChanged: null, // Disable checkbox interaction
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

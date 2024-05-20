import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partner_dashboard/widgets/fading_line_seperator.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import '../models/partner_model.dart';

class RenewalReportSection extends StatefulWidget {
  final RenewalCountData renewalData;

  RenewalReportSection({required this.renewalData});

  @override
  _RenewalReportSectionState createState() => _RenewalReportSectionState();
}

class _RenewalReportSectionState extends State<RenewalReportSection> {
  String selectedRenewalType = "Two Wheeler";
  late ValueNotifier<double> progressNotifier;
  late num totalNOPSum;
  @override
  void initState() {
    super.initState();
    progressNotifier = ValueNotifier<double>(0.0);
    _updateProgress();
  }

  void _updateProgress() {
    Map<String, dynamic> renewalDataMap = {
      "Two Wheeler": {
        "totalNOP": widget.renewalData.totalRmRenewalsTwoWheeler,
        "dueNOP": widget.renewalData.totalRmPendingRenewalsTwoWheeler,
        "collectedNOP": widget.renewalData.totalRmDoneRenewalsTwoWheeler,
        "collectedPremium": widget.renewalData.totalRmTwPremium,
        "collectionPercentage": widget.renewalData.totalPremiumTwoWheelerPercentage,
      },
      "Four Wheeler": {
        "totalNOP": widget.renewalData.totalRmRenewalsFourWheeler,
        "dueNOP": widget.renewalData.totalRmPendingRenewalsFourWheeler,
        "collectedNOP": widget.renewalData.totalRmDoneRenewalsFourWheeler,
        "collectedPremium": widget.renewalData.totalRmFwPremium,
        "collectionPercentage": widget.renewalData.totalPremiumFourWheelerPercentage,
      },
      "CV": {
        "totalNOP": widget.renewalData.totalRmRenewalsCv,
        "dueNOP": widget.renewalData.totalRmPendingRenewalsCv,
        "collectedNOP": widget.renewalData.totalRmDoneRenewalsCv,
        "collectedPremium": widget.renewalData.totalRmCvPremium,
        "collectionPercentage": widget.renewalData.totalPremiumCvPercentage,
      },
      "Health": {
        "totalNOP": widget.renewalData.totalRmRenewalsHealth,
        "dueNOP": widget.renewalData.totalRmPendingRenewalsHealth,
        "collectedNOP": widget.renewalData.totalRmDoneRenewalsHealth,
        "collectedPremium": widget.renewalData.totalRmHealthPremium,
        "collectionPercentage": widget.renewalData.totalPremiumHealthPercentage,
      },
    };

    double progress = renewalDataMap[selectedRenewalType]['totalNOP'] / 100.0;
    progressNotifier.value = progress * 100;
    totalNOPSum =0;
    for (var category in renewalDataMap.values) {
      if (category is Map<String, dynamic> && category.containsKey('totalNOP')) {
        totalNOPSum += category['totalNOP'];
      }
    }



  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> renewalDataMap = {
      "Two Wheeler": {
        "totalNOP": widget.renewalData.totalRmRenewalsTwoWheeler,
        "dueNOP": widget.renewalData.totalRmPendingRenewalsTwoWheeler,
        "collectedNOP": widget.renewalData.totalRmDoneRenewalsTwoWheeler,
        "collectedPremium": widget.renewalData.totalRmTwPremium,
        "collectionPercentage": widget.renewalData.totalPremiumTwoWheelerPercentage,
      },
      "Four Wheeler": {
        "totalNOP": widget.renewalData.totalRmRenewalsFourWheeler,
        "dueNOP": widget.renewalData.totalRmPendingRenewalsFourWheeler,
        "collectedNOP": widget.renewalData.totalRmDoneRenewalsFourWheeler,
        "collectedPremium": widget.renewalData.totalRmFwPremium,
        "collectionPercentage": widget.renewalData.totalPremiumFourWheelerPercentage,
      },
      "CV": {
        "totalNOP": widget.renewalData.totalRmRenewalsCv,
        "dueNOP": widget.renewalData.totalRmPendingRenewalsCv,
        "collectedNOP": widget.renewalData.totalRmDoneRenewalsCv,
        "collectedPremium": widget.renewalData.totalRmCvPremium,
        "collectionPercentage": widget.renewalData.totalPremiumCvPercentage,
      },
      "Health": {
        "totalNOP": widget.renewalData.totalRmRenewalsHealth,
        "dueNOP": widget.renewalData.totalRmPendingRenewalsHealth,
        "collectedNOP": widget.renewalData.totalRmDoneRenewalsHealth,
        "collectedPremium": widget.renewalData.totalRmHealthPremium,
        "collectionPercentage": widget.renewalData.totalPremiumHealthPercentage,
      },
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Renewal Report',
          style: Theme.of(context).textTheme.headline5, // Using headline5
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 10, // Blur radius
                offset: Offset(0, 3), // Offset in x and y direction
              ),
            ],
            color: Colors.white,

            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildRenewalTypeButton("Two Wheeler"),
                    _buildRenewalTypeButton("Four Wheeler"),
                    _buildRenewalTypeButton("CV"),
                    _buildRenewalTypeButton("Health"),
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: SimpleCircularProgressBar(


                    animationDuration: 0,

                    size: 150,
                    progressStrokeWidth: 10,
                    backStrokeWidth: 20,
                    mergeMode: true,
                    progressColors: [Colors.greenAccent],
                    backColor: Colors.blueAccent,
                    valueNotifier: progressNotifier,
                    onGetText: (double value) {
                      return Text(
                        textAlign: TextAlign.center,
                        'Total NOP\n$totalNOPSum',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold), // Using subtitle1
                      );
                    },
                  ),
                ),
               const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: const CircleAvatar(radius: 5, backgroundColor: Colors.blueAccent),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Due NOP', style: Theme.of(context).textTheme.bodyText2),
                              const SizedBox(height: 10,),// Using bodyText2
                              Text(
                                renewalDataMap[selectedRenewalType]['dueNOP'].toInt().toString(),
                                style: Theme.of(context).textTheme.titleLarge, // Using bodyText1
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         const Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: const CircleAvatar(radius: 5, backgroundColor: Colors.greenAccent),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Collected NOP', style: Theme.of(context).textTheme.bodyText2), // Using bodyText2
                              const SizedBox(height: 10,),// Us
                              Text(
                                renewalDataMap[selectedRenewalType]['collectedNOP'].toInt().toString(),
                                style: Theme.of(context).textTheme.titleLarge, // Using bodyText1
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child:  FadingLineSeperator(),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: const EdgeInsets.only(top: 4.0,right: 10),
                            child: const CircleAvatar(radius: 5, backgroundColor: Colors.blueAccent),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Collected Premium', style: Theme.of(context).textTheme.bodyText2), // Using bodyText2
                              Text(
                                "RS. ${
                                    renewalDataMap[selectedRenewalType]['collectedPremium'].toInt()

                                }",

                                style: Theme.of(context).textTheme.titleLarge, // Using bodyText1
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: const EdgeInsets.only(top: 4.0,right: 10),
                            child: const CircleAvatar(radius: 5, backgroundColor: Colors.blueAccent),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Collection %', style: Theme.of(context).textTheme.bodyText2), // Using bodyText2
                              Text(
                                  "${renewalDataMap[selectedRenewalType]['collectionPercentage'].toInt().toString()
                                  }%",

                                style: Theme.of(context).textTheme.titleLarge, // Using bodyText1
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRenewalTypeButton(String type) {
    bool isSelected = selectedRenewalType == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRenewalType = type;
          _updateProgress();
        });
      },
      child:  Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          type,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }
}

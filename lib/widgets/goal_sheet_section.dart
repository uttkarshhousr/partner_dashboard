import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import '../models/partner_model.dart';
import 'fading_line_seperator.dart';
import 'dart:math';

class GoalSheetSection extends StatelessWidget {
  final PartnerModel data;

  GoalSheetSection({required this.data});

  @override
  Widget build(BuildContext context) {
    double progress = (data.currentContribution / 100000) / (data.goalsheetContributionGoal / 100000) * 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Goal Sheet',
          style: Theme.of(context).textTheme.headline5, // Using headline5 from the text theme
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
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
                  border: Border.all(color:const Color(0xFFbdcfff),width: 2 ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Contribution',
                        style: Theme.of(context).textTheme.titleLarge, // Using subtitle1 from the text theme
                      ),
                     const SizedBox(height: 26),
                      SimpleCircularProgressBar(
                        animationDuration: 1,
                        size: 100,
                        progressStrokeWidth: 20,
                        backStrokeWidth: 15,
                        mergeMode: true,
                        progressColors: [Colors.blue],
                        backColor: Colors.grey.shade200,
                        valueNotifier: ValueNotifier(progress),
                        onGetText: (double value) {
                          return Text(
                            textAlign: TextAlign.center,
                            '${value.toStringAsFixed(0)}%\nCompleted',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold), // Using subtitle1
                          );
                        },
                      ),
                      const SizedBox(height: 26),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Target', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)), // Using bodyText2
                              Text(
                                '${(data.goalsheetContributionGoal / 100000).toStringAsFixed(0)}Lac',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold), // Using bodyText1
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const FadingLineSeperator(),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Achieved', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)), // Using bodyText2
                              Row(
                                children: [
                                  Text(
                                    '${(data.currentContribution / 100000).toStringAsFixed(0)}Lac',
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold), // Using bodyText1
                                  ),const SizedBox(width: 5,),
                                  Image.asset("assets/increase.png",width: 20,color: Colors.green,)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width:15,),
            Expanded(
              child: Container(
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
                 border: Border.all(color:const Color(0xFFbdcfff),width: 2 ),
                 borderRadius: BorderRadius.circular(10),
               ),

                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'NCA',
                        style: Theme.of(context).textTheme.titleLarge,  // Using subtitle1 from the text theme
                      ),
                      const SizedBox(height: 26),
                      SimpleCircularProgressBar(
                        animationDuration: 1,
                        size: 100,
                        progressStrokeWidth: 20,
                        backStrokeWidth: 15,
                        mergeMode: true,
                        progressColors: [Colors.blue],
                        backColor: Colors.grey.shade200,
                        valueNotifier: ValueNotifier(progress),
                        onGetText: (double value) {
                          return Text(
                            textAlign: TextAlign.center,
                            '${value.toStringAsFixed(0)}%\nCompleted',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold), // Using subtitle1
                          );
                        },
                      ),
                      SizedBox(height: 26),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Target', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)), // Using bodyText2
                              Text(
                                '${(data.goalsheetContributionGoal / 100000).toStringAsFixed(0)}Lac',

                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold), // Using bodyText1
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const FadingLineSeperator(),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Achieved', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)), // Using bodyText2
                              Row(
                                children: [
                                  Text(
                                    '${(data.currentContribution / 100000).toStringAsFixed(0)}Lac',
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold), // Using bodyText1
                                  ),
                                  const SizedBox(width: 5,),
                                  Transform.rotate(angle: 45,
                                  child: Image.asset("assets/increase.png",width: 20))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

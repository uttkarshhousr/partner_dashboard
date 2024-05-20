import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/partner_model.dart';

class PartnerCountSection extends StatelessWidget {
  final PartnerModel data;

  PartnerCountSection({required this.data});

  @override
  Widget build(BuildContext context) {
    double activeRatio = data.activeExistingPartners / data.totalExistingPartners;
    double inactiveRatio = data.inactiveExistingPartners / data.totalExistingPartners;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Partner Count',
          style: Theme.of(context).textTheme.headlineSmall, // Using headline5
        ),
       const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 10, // Blur radius
                offset: const Offset(0, 3), // Offset in x and y direction
              ),
            ],
            color: Colors.white,
           
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Total Partners',
                      style: Theme.of(context).textTheme.subtitle1, // Using subtitle1
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${data.totalExistingPartners}',
                      style: Theme.of(context).textTheme.titleLarge, // Using bodyText1
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        spreadRadius: 2, // Spread radius
                        blurRadius: 10, // Blur radius
                        offset: const Offset(0, 3), // Offset in x and y direction
                      ),
                    ],
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(20),
                      value: activeRatio,
                      backgroundColor: Colors.red,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      minHeight: 10,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(radius: 5, backgroundColor: Colors.green),
                        SizedBox(width: 5,),
                        Text('Active', style: Theme.of(context).textTheme.bodyText2), // Using bodyText2
                        SizedBox(width: 20,),
                        Text(
                          data.activeExistingPartners.toString(),
                          style: Theme.of(context).textTheme.titleLarge, // Using.titleLarge
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(radius: 5, backgroundColor: Colors.red),
                        const SizedBox(width: 5,),
                        Text('Inactive', style: Theme.of(context).textTheme.bodyText2), // Using bodyText2
                        const SizedBox(width: 20,),
                        Text(
                          data.inactiveExistingPartners.toString(),
                          style: Theme.of(context).textTheme.titleLarge, // Using bodyText1
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

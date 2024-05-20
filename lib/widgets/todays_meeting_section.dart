import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../models/partner_model.dart';

class TodaysMeetingSection extends StatelessWidget {
  final PartnerModel data;

  TodaysMeetingSection({required this.data});

  @override
  Widget build(BuildContext context) {
    double activePartnerRatio = data.activeExistingPartners.toDouble();
    double inactivePartnerRatio = data.inactiveExistingPartners.toDouble();
    double partnerLeadsRatio = data.totalProspectivePartners.toDouble();
    double potentialPartnersRatio = data.todayCustomerMeetings.toDouble();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today\'s Meeting',
                  style: Theme.of(context).textTheme.headline5, // Using headline5
                ),
                SfRadialGauge(

                  enableLoadingAnimation: true,
                  axes: <RadialAxis>[
                    RadialAxis(

                      minimum: 0,
                      maximum: activePartnerRatio+inactivePartnerRatio+partnerLeadsRatio+potentialPartnersRatio,
                      showLabels: false,
                      showTicks: false,
                      startAngle: 180,
                      endAngle: 0,
                      radiusFactor: 0.8,
                      canScaleToFit: true,
                      ranges: <GaugeRange>[
                        GaugeRange(

                          startValue: 0,
                          endValue: activePartnerRatio,
                          color: Colors.green,
                          startWidth: 10,
                          endWidth: 10,
                        ),
                        GaugeRange(
                          startValue: activePartnerRatio,
                          endValue: activePartnerRatio + inactivePartnerRatio,
                          color: Colors.red,
                          startWidth: 10,
                          endWidth: 10,
                        ),
                        GaugeRange(
                          startValue: activePartnerRatio + inactivePartnerRatio,
                          endValue: activePartnerRatio + inactivePartnerRatio + partnerLeadsRatio,
                          color: Colors.blue,
                          startWidth: 10,
                          endWidth: 10,
                        ),
                        GaugeRange(
                          startValue: activePartnerRatio + inactivePartnerRatio + partnerLeadsRatio,
                          endValue: activePartnerRatio + inactivePartnerRatio + partnerLeadsRatio + potentialPartnersRatio,
                          color: Colors.yellow,
                          startWidth: 10,
                          endWidth: 10,
                        ),

                      ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Padding(
                        padding: const EdgeInsets.fromLTRB(0,80,0,0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Scheduled\n Meeting',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey,fontSize:20), // Using subtitle1
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              textAlign: TextAlign.center,
                              '${(activePartnerRatio+inactivePartnerRatio+partnerLeadsRatio+potentialPartnersRatio).toInt()}',
                              style: Theme.of(context).textTheme.headlineLarge, // Using subtitle1
                            ),
                          ],
                        ),
                      ),
                      angle: 90,
                      positionFactor: 0, // Adjust as necessary to position the text correctly
                    ),
  ]
                    ),
                  ],
                ),
                GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 2,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(radius: 5, backgroundColor: Colors.green),
                            const SizedBox(width: 5),
                  Text('Active Partners', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ), // Using bodyText2
                        Text(
                          data.activeExistingPartners.toString(),
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold), // Using bodyText1
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(radius: 5, backgroundColor: Colors.red),
                            const SizedBox(width: 5),
                            Text('Inactive Partners', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ), // Using bodyText2
                        Text(
                          data.inactiveExistingPartners.toString(),
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold), // Using bodyText1
                        ),
                      ],
                    ),
                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(radius: 5, backgroundColor: Colors.blue),
                            const SizedBox(width: 5),
                           Text('Partner Leads', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ), // Using bodyText2
                        Text(
                          data.totalProspectivePartners.toString(),
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold), // Using bodyText1
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(radius: 5, backgroundColor: Colors.yellow),
                            const SizedBox(width: 5,),
                            Text('Potential Partners', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ), // Using bodyText2
                        Text(
                          data.todayCustomerMeetings.toString(),
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold), // Using bodyText1
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMeetingStatusContainer('Completed', data.todayTotalMeetings,"assets/loading.png",65, context),
                   const SizedBox(width: 20,),
                    _buildMeetingStatusContainer('Pending', data.todayInactiveExistingMeetings,"assets/pending.png", 40, context),
                    const SizedBox(width: 20,),
                    _buildMeetingStatusContainer('Postponed', data.todayInactiveExistingMeetings,"assets/postponed.png",45,  context),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(10), // Set the desired border radius here
                      ),
                    ),
                    onPressed: () {
                      // Your onPressed function
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(

                          'ADD MEETING',
                          style: Theme.of(context).textTheme.button?.copyWith(color: Colors.white),
                        ),
                        SizedBox(width: 8), // Add some space between the text and the icon
                        Icon(Icons.add,color: Colors.white,),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMeetingStatusContainer(String title, int value,String iconName,double? width, BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color:const Color(0xFFbdcfff),width: 2 ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 10, // Blur radius
              offset: const Offset(0, 3), // Offset in x and y direction
            ),
          ],
          color: Colors.white,

          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            children: [
              Image.asset(iconName,width: width,),
              const SizedBox(height: 10,),
              Text(
                value.toString(),
                style: Theme.of(context).textTheme.titleLarge, // Using bodyText1
              ),
              const SizedBox(height: 10,),
              Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),), // Using bodyText2

            ],
          ),
        ),
      ),
    );
  }
}

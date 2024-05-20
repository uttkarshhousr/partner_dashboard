import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_dashboard/blocs/partner_bloc.dart';
import 'package:partner_dashboard/blocs/partner_event.dart';
import 'package:partner_dashboard/blocs/partner_state.dart';
import 'package:partner_dashboard/models/partner_model.dart';
import 'package:partner_dashboard/repositories/partner_repository.dart';
import 'package:partner_dashboard/widgets/greeting_section.dart';
import 'package:partner_dashboard/widgets/goal_sheet_section.dart';
import 'package:partner_dashboard/widgets/partner_count_section.dart';
import 'package:partner_dashboard/widgets/todays_meeting_section.dart';
import 'package:partner_dashboard/widgets/renewal_report_section.dart';
import 'package:partner_dashboard/widgets/top_performers_widget.dart';
import 'package:partner_dashboard/widgets/attendance_calendar_widget.dart';

class PartnerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(child: Image.asset("assets/appbar.png")),
        ],
        elevation: 5.0, // Set your desired elevation
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: BlocProvider(
        create: (context) => PartnerBloc(PartnerRepository())..add(FetchPartnerData()),
        child: PartnerView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle button press
        },
        child: Icon(Icons.calendar_month),
        backgroundColor: Colors.blue, // Set your desired color
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Container(
          height: 60.0,
          padding: EdgeInsets.symmetric(horizontal: 20.0), // Adjust the padding if needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Handle Home button press
                },
              ),
              IconButton(
                icon: Icon(Icons.business),
                onPressed: () {
                  // Handle Business button press
                },
              ),
              SizedBox(width: 48.0), // Space for the FloatingActionButton
              IconButton(
                icon: Icon(Icons.school),
                onPressed: () {
                  // Handle School button press
                },
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  // Handle Settings button press
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PartnerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnerBloc, PartnerState>(
      builder: (context, state) {
        if (state is PartnerInitial) {
          return Center(child: Text('Welcome to Partner Dashboard'));
        } else if (state is PartnerLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PartnerLoaded) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GreetingSection(),
                const SizedBox(height: 16.0),
                GoalSheetSection(data: state.partnerData),
                const SizedBox(height: 16.0),
                PartnerCountSection(data: state.partnerData),
                const SizedBox(height: 16.0),
                TodaysMeetingSection(data: state.partnerData),
                const SizedBox(height: 16.0),
                RenewalReportSection(renewalData: state.partnerData.renewalCountData),
                const SizedBox(height: 16.0),
                TopPerformersWidget(),
                const SizedBox(height: 16.0),
                AttendanceCalendarWidget(),
              ],
            ),
          );
        } else if (state is PartnerError) {
          return Center(child: Text('Failed to load partner data'));
        } else {
          return Container();
        }
      },
    );
  }
}

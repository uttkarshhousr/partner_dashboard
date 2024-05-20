import 'package:flutter/material.dart';

class TopPerformersWidget extends StatefulWidget {
  @override
  _TopPerformersWidgetState createState() => _TopPerformersWidgetState();
}

class _TopPerformersWidgetState extends State<TopPerformersWidget> {
  String selectedToggle = 'All';

  final Map<String, List<Map<String, String>>> topPerformersData = {
    'All': [
      {'rank': '1st', 'name': 'Rahul Sharma', 'city': 'Mumbai', 'earning': '₹5000'},
      {'rank': '2nd', 'name': 'Priya Singh', 'city': 'Delhi', 'earning': '₹4500'},
      {'rank': '3rd', 'name': 'Amit Patel', 'city': 'Ahmedabad', 'earning': '₹4000'},
      {'rank': '4th', 'name': 'Sneha Reddy', 'city': 'Hyderabad', 'earning': '₹3500'},
      {'rank': '5th', 'name': 'Vikram Gupta', 'city': 'Bengaluru', 'earning': '₹3000'},
    ],
    'This Week': [
      {'rank': '1st', 'name': 'Arjun Rao', 'city': 'Pune', 'earning': '₹1500'},
      {'rank': '2nd', 'name': 'Neha Mehta', 'city': 'Jaipur', 'earning': '₹1300'},
      {'rank': '3rd', 'name': 'Karan Malhotra', 'city': 'Kolkata', 'earning': '₹1200'},
      {'rank': '4th', 'name': 'Anita Desai', 'city': 'Chennai', 'earning': '₹1100'},
      {'rank': '5th', 'name': 'Ravi Verma', 'city': 'Chandigarh', 'earning': '₹1000'},
    ],
    'This Month': [
      {'rank': '1st', 'name': 'Siddharth Kulkarni', 'city': 'Nagpur', 'earning': '₹3000'},
      {'rank': '2nd', 'name': 'Pooja Iyer', 'city': 'Coimbatore', 'earning': '₹2800'},
      {'rank': '3rd', 'name': 'Vivek Nair', 'city': 'Thiruvananthapuram', 'earning': '₹2600'},
      {'rank': '4th', 'name': 'Ritika Jain', 'city': 'Lucknow', 'earning': '₹2400'},
      {'rank': '5th', 'name': 'Manish Bhatt', 'city': 'Surat', 'earning': '₹2200'},
    ],
  };


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Performers',
            style: Theme.of(context).textTheme.headline5, // Using headline5
          ),
          SizedBox(height: 16.0),
          Container(
            decoration: BoxDecoration(

              color: Colors.grey.withOpacity(0.2),

              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildToggleButton('All', context),
                _buildToggleButton('This Week', context),
                _buildToggleButton('This Month', context),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Column(
            children: topPerformersData[selectedToggle]!.map((performer) {
              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    performer['rank']!,
                    style: Theme.of(context).textTheme.button?.copyWith(color: Colors.white), // Using button
                  ),
                ),
                title: Text(
                  performer['name']!,
                  style: Theme.of(context).textTheme.subtitle1, // Using subtitle1
                ),
                subtitle: Text(performer['city']!, style: Theme.of(context).textTheme.bodyText2), // Using bodyText2
                trailing: Text(performer['earning']!, style: Theme.of(context).textTheme.bodyText1), // Using bodyText1
              );
            }).toList(),
          ),
          SizedBox(height: 16.0),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child:const Text(
                'View all ->',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String label, BuildContext context) {
    bool isSelected = selectedToggle == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedToggle = label;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blueAccent : Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Image.asset("assets/crown.png",width: 20,color:isSelected ? Colors.white : Colors.black, ),
              const SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

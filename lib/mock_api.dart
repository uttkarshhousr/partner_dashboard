// lib/mock_api.dart

// Mock Attendance API Response
List<Map<String, dynamic>> getMockAttendanceData() {
  return [
    {
      "date": "2024-05-01T00:00:00.000Z",
      "physical_count": 14,
      "on_call_count": 10,
      "active_existing_count": 1,
      "inactive_existing_count": 10,
      "prospective_count": 2,
      "total_count": 24,
      "condition": true
    },
    {
      "date": "2024-05-02T00:00:00.000Z",
      "physical_count": 0,
      "on_call_count": 0,
      "active_existing_count": 0,
      "inactive_existing_count": 0,
      "prospective_count": 0,
      "total_count": 0,
      "condition": false
    },
    {
      "date": "2024-05-03T00:00:00.000Z",
      "physical_count": 0,
      "on_call_count": 0,
      "active_existing_count": 0,
      "inactive_existing_count": 0,
      "prospective_count": 0,
      "total_count": 0,
      "condition": false
    },
    {
      "date": "2024-05-04T00:00:00.000Z",
      "physical_count": 0,
      "on_call_count": 0,
      "active_existing_count": 0,
      "inactive_existing_count": 0,
      "prospective_count": 0,
      "total_count": 0,
      "condition": false
    },
    {
      "date": "2024-05-05T00:00:00.000Z",
      "physical_count": 0,
      "on_call_count": 5,
      "active_existing_count": 0,
      "inactive_existing_count": 0,
      "prospective_count": 2,
      "total_count": 5,
      "condition": true
    }
  ];
}

// Mock Partner API Response
Map<String, dynamic> getMockPartnerData() {
  return {
    "total_existing_partners": 170,
    "active_existing_partners": 120,
    "inactive_existing_partners": 50,
    "total_prospective_partners": 130,
    "total_assigned_partners": 60,
    "total_potential_partners": 23,
    "total_partners": 360,
    "total_customers": 149,
    "today_total_meetings": 12,
    "today_existing_meetings": 12,
    "today_active_existing_meetings": 12,
    "today_inactive_existing_meetings": 12,
    "today_prospective_meetings": 12,
    "today_assigned_meetings": 12,
    "today_potential_meetings": 12,
    "today_customer_meetings": 12,
    "contests": [
      {
        "id": 253,
        "contest_name": "sabka contest",
        "start_date": "2023-07-25T12:00:00+05:30",
        "end_date": "2024-07-28T13:00:00+05:30",
        "contest_file":
        "https://rb-rms-dev.s3.amazonaws.com/media/rb-gallery/contest/None/b7281c5c-f0d2-4bf9-805b-a95bf1a6b7f0.png",
        "is_active": true,
        "verticals_list": [
          {"id": 9, "vertical": "North"},
          {"id": 3, "vertical": "Himalayan"}
        ],
        "accessible_by": [2, 5]
      },
      // Add more contests here if needed
    ],
    "banners": [
      {
        "banner_image":
        "https://rb-rms-dev.s3.amazonaws.com/media/rb-gallery/banner/images/879fe4aa-cf5b-493d-8092-e661cdfbc6db.jpg",
        "banner_type": "banner",
        "is_active": true
      },
      // Add more banners here if needed
    ],
    "meeting_impact_analysis": {
      "inactive_to_active_conversion": {"inactive": 12, "converted": 0},
      "new_partners_added": {"total_partners": 3, "new_partners": 0},
      "additional_business": {"amount": 1000.0, "growth": 5.0}
    },
    "messages": [
      {
        "id": 214,
        "heading": "message 21 Feb",
        "sender": "Test",
        "accessible_by": [2],
        "vertical_list": [
          {"id": 3, "vertical": "Himalayan"},
          {"id": 9, "vertical": "North"}
        ],
        "start_date": "2023-08-01T00:00:00+05:30",
        "end_date": "2024-08-03T00:00:00+05:30",
        "message": "RM msg",
        "reputation_count": 10,
        "created_at": "2024-02-21T12:25:31.705634+05:30",
        "url_link": "http://www.abc.com",
        "image":
        "https://rb-rms-dev.s3.amazonaws.com/media/rb-gallery/message/None/dd6ad34c-fa19-4054-afe6-0f8c07dee3c0.png",
        "image_url": "https://www.google.com"
      }
    ],
    "renewal_count_data": {
      "total_rm_renewals_TWO_WHEELER": 20,
      "total_rm_renewals_FOUR_WHEELER": 15,
      "total_rm_renewals_CV": 5,
      "total_rm_renewals_health": 10,
      "total_rm_pending_renewals_TWO_WHEELER": 8,
      "total_rm_pending_renewals_FOUR_WHEELER": 7,
      "total_rm_pending_renewals_CV": 2,
      "total_rm_pending_renewals_health": 3,
      "total_rm_done_renewals_TWO_WHEELER": 12,
      "total_rm_done_renewals_FOUR_WHEELER": 8,
      "total_rm_done_renewals_CV": 3,
      "total_rm_done_renewals_health": 7,
      "total_premium_TWO_Wheeler_percentage": 60.0,
      "total_premium_Four_Wheeler_percentage": 53.3,
      "total_premium_Cv_percentage": 40.0,
      "total_premium_health_percentage": 70.0,
      "total_rm_Tw_premium": 20000.0,
      "total_rm_Fw_premium": 15000.0,
      "total_rm_cv_premium": 5000.0,
      "total_rm_health_premium": 10000.0
    },
    "goalsheet_contribution_goal": 10000000.0,
    "current_contribution": 7000000.0
  };
}

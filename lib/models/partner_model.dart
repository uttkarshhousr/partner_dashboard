import 'package:equatable/equatable.dart';

class PartnerModel extends Equatable {
  final int totalExistingPartners;
  final int activeExistingPartners;
  final int inactiveExistingPartners;
  final int totalProspectivePartners;
  final int totalAssignedPartners;
  final int totalPotentialPartners;
  final int totalPartners;
  final int totalCustomers;
  final double goalsheetContributionGoal;
  final double currentContribution;
  final int todayTotalMeetings;
  final int todayExistingMeetings;
  final int todayActiveExistingMeetings;
  final int todayInactiveExistingMeetings;
  final int todayProspectiveMeetings;
  final int todayAssignedMeetings;
  final int todayPotentialMeetings;
  final int todayCustomerMeetings;
  final RenewalCountData renewalCountData;
  final List<Contest> contests;
  final List<CustomBanner> banners;

  const PartnerModel({
    required this.totalExistingPartners,
    required this.activeExistingPartners,
    required this.inactiveExistingPartners,
    required this.totalProspectivePartners,
    required this.totalAssignedPartners,
    required this.totalPotentialPartners,
    required this.totalPartners,
    required this.totalCustomers,
    required this.goalsheetContributionGoal,
    required this.currentContribution,
    required this.todayTotalMeetings,
    required this.todayExistingMeetings,
    required this.todayActiveExistingMeetings,
    required this.todayInactiveExistingMeetings,
    required this.todayProspectiveMeetings,
    required this.todayAssignedMeetings,
    required this.todayPotentialMeetings,
    required this.todayCustomerMeetings,
    required this.renewalCountData,
    required this.contests,
    required this.banners,
  });

  factory PartnerModel.fromJson(Map<String, dynamic> json) {
    var contestList = json['contests'] as List;
    var bannerList = json['banners'] as List;

    List<Contest> contests = contestList.map((i) => Contest.fromJson(i)).toList();
    List<CustomBanner> banners = bannerList.map((i) => CustomBanner.fromJson(i)).toList();

    return PartnerModel(
      totalExistingPartners: json['total_existing_partners'] ?? 0,
      activeExistingPartners: json['active_existing_partners'] ?? 0,
      inactiveExistingPartners: json['inactive_existing_partners'] ?? 0,
      totalProspectivePartners: json['total_prospective_partners'] ?? 0,
      totalAssignedPartners: json['total_assigned_partners'] ?? 0,
      totalPotentialPartners: json['total_potential_partners'] ?? 0,
      totalPartners: json['total_partners'] ?? 0,
      totalCustomers: json['total_customers'] ?? 0,
      goalsheetContributionGoal: (json['goalsheet_contribution_goal'] ?? 0).toDouble(),
      currentContribution: (json['current_contribution'] ?? 0).toDouble(),
      todayTotalMeetings: json['today_total_meetings'] ?? 0,
      todayExistingMeetings: json['today_existing_meetings'] ?? 0,
      todayActiveExistingMeetings: json['today_active_existing_meetings'] ?? 0,
      todayInactiveExistingMeetings: json['today_inactive_existing_meetings'] ?? 0,
      todayProspectiveMeetings: json['today_prospective_meetings'] ?? 0,
      todayAssignedMeetings: json['today_assigned_meetings'] ?? 0,
      todayPotentialMeetings: json['today_potential_meetings'] ?? 0,
      todayCustomerMeetings: json['today_customer_meetings'] ?? 0,
      renewalCountData: RenewalCountData.fromJson(json['renewal_count_data']),
      contests: contests,
      banners: banners,
    );
  }

  @override
  List<Object?> get props => [
    totalExistingPartners,
    activeExistingPartners,
    inactiveExistingPartners,
    totalProspectivePartners,
    totalAssignedPartners,
    totalPotentialPartners,
    totalPartners,
    totalCustomers,
    goalsheetContributionGoal,
    currentContribution,
    todayTotalMeetings,
    todayExistingMeetings,
    todayActiveExistingMeetings,
    todayInactiveExistingMeetings,
    todayProspectiveMeetings,
    todayAssignedMeetings,
    todayPotentialMeetings,
    todayCustomerMeetings,
    renewalCountData,
    contests,
    banners,
  ];
}

class RenewalCountData extends Equatable {
  final double totalRmRenewalsTwoWheeler;
  final double totalRmPendingRenewalsTwoWheeler;
  final double totalRmDoneRenewalsTwoWheeler;
  final double totalRmTwPremium;
  final double totalPremiumTwoWheelerPercentage;
  final double totalRmRenewalsFourWheeler;
  final double totalRmPendingRenewalsFourWheeler;
  final double totalRmDoneRenewalsFourWheeler;
  final double totalRmFwPremium;
  final double totalPremiumFourWheelerPercentage;
  final double totalRmRenewalsCv;
  final double totalRmPendingRenewalsCv;
  final double totalRmDoneRenewalsCv;
  final double totalRmCvPremium;
  final double totalPremiumCvPercentage;
  final double totalRmRenewalsHealth;
  final double totalRmPendingRenewalsHealth;
  final double totalRmDoneRenewalsHealth;
  final double totalRmHealthPremium;
  final double totalPremiumHealthPercentage;

  const RenewalCountData({
    required this.totalRmRenewalsTwoWheeler,
    required this.totalRmPendingRenewalsTwoWheeler,
    required this.totalRmDoneRenewalsTwoWheeler,
    required this.totalRmTwPremium,
    required this.totalPremiumTwoWheelerPercentage,
    required this.totalRmRenewalsFourWheeler,
    required this.totalRmPendingRenewalsFourWheeler,
    required this.totalRmDoneRenewalsFourWheeler,
    required this.totalRmFwPremium,
    required this.totalPremiumFourWheelerPercentage,
    required this.totalRmRenewalsCv,
    required this.totalRmPendingRenewalsCv,
    required this.totalRmDoneRenewalsCv,
    required this.totalRmCvPremium,
    required this.totalPremiumCvPercentage,
    required this.totalRmRenewalsHealth,
    required this.totalRmPendingRenewalsHealth,
    required this.totalRmDoneRenewalsHealth,
    required this.totalRmHealthPremium,
    required this.totalPremiumHealthPercentage,
  });

  factory RenewalCountData.fromJson(Map<String, dynamic> json) {
    return RenewalCountData(
      totalRmRenewalsTwoWheeler: (json['total_rm_renewals_TWO_WHEELER'] ?? 0).toDouble(),
      totalRmPendingRenewalsTwoWheeler: (json['total_rm_pending_renewals_TWO_WHEELER'] ?? 0).toDouble(),
      totalRmDoneRenewalsTwoWheeler: (json['total_rm_done_renewals_TWO_WHEELER'] ?? 0).toDouble(),
      totalRmTwPremium: (json['total_rm_Tw_premium'] ?? 0).toDouble(),
      totalPremiumTwoWheelerPercentage: (json['total_premium_TWO_Wheeler_percentage'] ?? 0).toDouble(),
      totalRmRenewalsFourWheeler: (json['total_rm_renewals_FOUR_WHEELER'] ?? 0).toDouble(),
      totalRmPendingRenewalsFourWheeler: (json['total_rm_pending_renewals_FOUR_WHEELER'] ?? 0).toDouble(),
      totalRmDoneRenewalsFourWheeler: (json['total_rm_done_renewals_FOUR_WHEELER'] ?? 0).toDouble(),
      totalRmFwPremium: (json['total_rm_Fw_premium'] ?? 0).toDouble(),
      totalPremiumFourWheelerPercentage: (json['total_premium_Four_Wheeler_percentage'] ?? 0).toDouble(),
      totalRmRenewalsCv: (json['total_rm_renewals_CV'] ?? 0).toDouble(),
      totalRmPendingRenewalsCv: (json['total_rm_pending_renewals_CV'] ?? 0).toDouble(),
      totalRmDoneRenewalsCv: (json['total_rm_done_renewals_CV'] ?? 0).toDouble(),
      totalRmCvPremium: (json['total_rm_cv_premium'] ?? 0).toDouble(),
      totalPremiumCvPercentage: (json['total_premium_Cv_percentage'] ?? 0).toDouble(),
      totalRmRenewalsHealth: (json['total_rm_renewals_health'] ?? 0).toDouble(),
      totalRmPendingRenewalsHealth: (json['total_rm_pending_renewals_health'] ?? 0).toDouble(),
      totalRmDoneRenewalsHealth: (json['total_rm_done_renewals_health'] ?? 0).toDouble(),
      totalRmHealthPremium: (json['total_rm_health_premium'] ?? 0).toDouble(),
      totalPremiumHealthPercentage: (json['total_premium_health_percentage'] ?? 0).toDouble(),
    );
  }

  @override
  List<Object?> get props => [
    totalRmRenewalsTwoWheeler,
    totalRmPendingRenewalsTwoWheeler,
    totalRmDoneRenewalsTwoWheeler,
    totalRmTwPremium,
    totalPremiumTwoWheelerPercentage,
    totalRmRenewalsFourWheeler,
    totalRmPendingRenewalsFourWheeler,
    totalRmDoneRenewalsFourWheeler,
    totalRmFwPremium,
    totalPremiumFourWheelerPercentage,
    totalRmRenewalsCv,
    totalRmPendingRenewalsCv,
    totalRmDoneRenewalsCv,
    totalRmCvPremium,
    totalPremiumCvPercentage,
    totalRmRenewalsHealth,
    totalRmPendingRenewalsHealth,
    totalRmDoneRenewalsHealth,
    totalRmHealthPremium,
    totalPremiumHealthPercentage,
  ];
}

class Contest extends Equatable {
  final int id;
  final String contestName;
  final String startDate;
  final String endDate;
  final String contestFile;

  const Contest({
    required this.id,
    required this.contestName,
    required this.startDate,
    required this.endDate,
    required this.contestFile,
  });

  factory Contest.fromJson(Map<String, dynamic> json) {
    return Contest(
      id: json['id'],
      contestName: json['contest_name'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      contestFile: json['contest_file'],
    );
  }

  @override
  List<Object?> get props => [id, contestName, startDate, endDate, contestFile];
}

class CustomBanner extends Equatable {
  final String bannerImage;
  final String bannerType;
  final bool isActive;

  const CustomBanner({
    required this.bannerImage,
    required this.bannerType,
    required this.isActive,
  });

  factory CustomBanner.fromJson(Map<String, dynamic> json) {
    return CustomBanner(
      bannerImage: json['banner_image'],
      bannerType: json['banner_type'],
      isActive: json['is_active'],
    );
  }

  @override
  List<Object?> get props => [bannerImage, bannerType, isActive];
}

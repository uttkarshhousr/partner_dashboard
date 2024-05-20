import 'package:equatable/equatable.dart';
import 'package:partner_dashboard/models/partner_model.dart';

abstract class PartnerState extends Equatable {
  const PartnerState();

  @override
  List<Object> get props => [];
}

class PartnerInitial extends PartnerState {}

class PartnerLoading extends PartnerState {}

class PartnerLoaded extends PartnerState {
  final PartnerModel partnerData;

  const PartnerLoaded(this.partnerData);

  @override
  List<Object> get props => [partnerData];
}

class PartnerError extends PartnerState {
  final String message;

  const PartnerError(this.message);

  @override
  List<Object> get props => [message];
}

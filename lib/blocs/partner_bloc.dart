// lib/blocs/partner_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_dashboard/blocs/partner_event.dart';
import 'package:partner_dashboard/blocs/partner_state.dart';
import 'package:partner_dashboard/repositories/partner_repository.dart';

class PartnerBloc extends Bloc<PartnerEvent, PartnerState> {
  final PartnerRepository repository;

  PartnerBloc(this.repository) : super(PartnerInitial()) {
    on<FetchPartnerData>(_onFetchPartnerData);
  }

  void _onFetchPartnerData(FetchPartnerData event, Emitter<PartnerState> emit) async {
    emit(PartnerLoading());
    try {
      final partnerData = await repository.fetchPartnerData();
      emit(PartnerLoaded(partnerData));
    } catch (e) {
      emit(PartnerError(e.toString()));
    }
  }
}

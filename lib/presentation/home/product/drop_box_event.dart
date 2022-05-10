import 'package:freezed_annotation/freezed_annotation.dart';

part 'drop_box_event.freezed.dart';

@freezed
class DropBoxEvent with _$DropBoxEvent {
  const factory DropBoxEvent.tapped(String type) = Tapped;
}

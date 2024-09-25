// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.4.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

// Static analysis wrongly picks the IO variant, thus ignore this
// ignore_for_file: argument_type_not_assignable

import 'api/hotkey.dart';
import 'api/init.dart';
import 'api/listen.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_web.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_ShortcutListenerPtr => wire
          .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener;

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_FnStringPtr => wire
      .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerfnString;

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw);

  @protected
  ShortcutListener
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
          dynamic raw);

  @protected
  FnString
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerfnString(
          dynamic raw);

  @protected
  ShortcutListener
      dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
          dynamic raw);

  @protected
  FutureOr<String> Function(String)
      dco_decode_DartFn_Inputs_String_Output_String_AnyhowException(
          dynamic raw);

  @protected
  FutureOr<void> Function(RawEventType)
      dco_decode_DartFn_Inputs_raw_event_type_Output_unit_AnyhowException(
          dynamic raw);

  @protected
  Object dco_decode_DartOpaque(dynamic raw);

  @protected
  ShortcutListener
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
          dynamic raw);

  @protected
  FnString
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerfnString(
          dynamic raw);

  @protected
  RustStreamSink<RawEventType> dco_decode_StreamSink_raw_event_type_Sse(
      dynamic raw);

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  RawButton dco_decode_box_autoadd_raw_button(dynamic raw);

  @protected
  RawKey dco_decode_box_autoadd_raw_key(dynamic raw);

  @protected
  double dco_decode_f_64(dynamic raw);

  @protected
  PlatformInt64 dco_decode_i_64(dynamic raw);

  @protected
  PlatformInt64 dco_decode_isize(dynamic raw);

  @protected
  List<String> dco_decode_list_String(dynamic raw);

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw);

  @protected
  RawButton dco_decode_raw_button(dynamic raw);

  @protected
  RawEventType dco_decode_raw_event_type(dynamic raw);

  @protected
  RawKey dco_decode_raw_key(dynamic raw);

  @protected
  int dco_decode_u_32(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  BigInt dco_decode_usize(dynamic raw);

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer);

  @protected
  ShortcutListener
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
          SseDeserializer deserializer);

  @protected
  FnString
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerfnString(
          SseDeserializer deserializer);

  @protected
  ShortcutListener
      sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
          SseDeserializer deserializer);

  @protected
  Object sse_decode_DartOpaque(SseDeserializer deserializer);

  @protected
  ShortcutListener
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
          SseDeserializer deserializer);

  @protected
  FnString
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerfnString(
          SseDeserializer deserializer);

  @protected
  RustStreamSink<RawEventType> sse_decode_StreamSink_raw_event_type_Sse(
      SseDeserializer deserializer);

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  RawButton sse_decode_box_autoadd_raw_button(SseDeserializer deserializer);

  @protected
  RawKey sse_decode_box_autoadd_raw_key(SseDeserializer deserializer);

  @protected
  double sse_decode_f_64(SseDeserializer deserializer);

  @protected
  PlatformInt64 sse_decode_i_64(SseDeserializer deserializer);

  @protected
  PlatformInt64 sse_decode_isize(SseDeserializer deserializer);

  @protected
  List<String> sse_decode_list_String(SseDeserializer deserializer);

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer);

  @protected
  RawButton sse_decode_raw_button(SseDeserializer deserializer);

  @protected
  RawEventType sse_decode_raw_event_type(SseDeserializer deserializer);

  @protected
  RawKey sse_decode_raw_key(SseDeserializer deserializer);

  @protected
  int sse_decode_u_32(SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  BigInt sse_decode_usize(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
          ShortcutListener self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerfnString(
          FnString self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
          ShortcutListener self, SseSerializer serializer);

  @protected
  void sse_encode_DartFn_Inputs_String_Output_String_AnyhowException(
      FutureOr<String> Function(String) self, SseSerializer serializer);

  @protected
  void sse_encode_DartFn_Inputs_raw_event_type_Output_unit_AnyhowException(
      FutureOr<void> Function(RawEventType) self, SseSerializer serializer);

  @protected
  void sse_encode_DartOpaque(Object self, SseSerializer serializer);

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
          ShortcutListener self, SseSerializer serializer);

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerfnString(
          FnString self, SseSerializer serializer);

  @protected
  void sse_encode_StreamSink_raw_event_type_Sse(
      RustStreamSink<RawEventType> self, SseSerializer serializer);

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_raw_button(
      RawButton self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_raw_key(RawKey self, SseSerializer serializer);

  @protected
  void sse_encode_f_64(double self, SseSerializer serializer);

  @protected
  void sse_encode_i_64(PlatformInt64 self, SseSerializer serializer);

  @protected
  void sse_encode_isize(PlatformInt64 self, SseSerializer serializer);

  @protected
  void sse_encode_list_String(List<String> self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer);

  @protected
  void sse_encode_raw_button(RawButton self, SseSerializer serializer);

  @protected
  void sse_encode_raw_event_type(RawEventType self, SseSerializer serializer);

  @protected
  void sse_encode_raw_key(RawKey self, SseSerializer serializer);

  @protected
  void sse_encode_u_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);

  @protected
  void sse_encode_usize(BigInt self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);
}

// Section: wire_class

class RustLibWire implements BaseWire {
  RustLibWire.fromExternalLibrary(ExternalLibrary lib);

  void rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
          int ptr) =>
      wasmModule
          .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
              ptr);

  void rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
          int ptr) =>
      wasmModule
          .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
              ptr);

  void rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerfnString(
          int ptr) =>
      wasmModule
          .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerfnString(
              ptr);

  void rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerfnString(
          int ptr) =>
      wasmModule
          .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerfnString(
              ptr);
}

@JS('wasm_bindgen')
external RustLibWasmModule get wasmModule;

@JS()
@anonymous
extension type RustLibWasmModule._(JSObject _) implements JSObject {
  external void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
          int ptr);

  external void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerShortcutListener(
          int ptr);

  external void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerfnString(
          int ptr);

  external void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerfnString(
          int ptr);
}

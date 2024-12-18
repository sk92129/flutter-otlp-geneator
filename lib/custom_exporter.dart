



import 'dart:async';

import 'package:opentelemetry/api.dart';
import 'package:opentelemetry/sdk.dart';

class CustomExporter extends CollectorExporter 
{
  CustomExporter(super.uri);

  @override
  void export(List<ReadOnlySpan> spans) {


    if (spans.isEmpty) {
      return;
    }

    unawaited(sendData(uri, spans));
  }



  Future<void> sendData(
    Uri uri,
    List<ReadOnlySpan> spans,
  ) async {
    try {

//      final body = pb_trace_service.ExportTraceServiceRequest(resourceSpans: _spansToProtobuf(spans));\
      var body ='';
      final headers = {'Content-Type': 'application/x-protobuf'}
        ..addAll(this.headers);

      //var result = await client.post(uri, body: body.writeToBuffer(), headers: headers);

      var result = await client.post(uri, body: body, headers: headers);
      
    } catch (e) {
      print('Failed to export ${spans.length} spans. $e');
    }
  }

}
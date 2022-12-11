// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipdata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IpData _$$_IpDataFromJson(Map<String, dynamic> json) => _$_IpData(
      country: json['country'] as String?,
      regionName: json['regionName'] as String?,
      ip: json['query'] as String?,
    );

Map<String, dynamic> _$$_IpDataToJson(_$_IpData instance) => <String, dynamic>{
      'country': instance.country,
      'regionName': instance.regionName,
      'query': instance.ip,
    };

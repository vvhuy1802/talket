class ConversionArgs {
  ConversionArgs({
    String? from,
    String? to,
  }) {
    _from = from;
    _to = to;
  }

  ConversionArgs.fromJson(dynamic json) {
    _from = json['from'];
    _to = json['to'];
  }

  String? _from;
  String? _to;

  ConversionArgs copyWith({
    String? from,
    String? to,
  }) =>
      ConversionArgs(
        from: from ?? _from,
        to: to ?? _to,
      );

  String? get from => _from;
  String? get to => _to;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_from != null) {
      map['from'] = _from;
    }
    if (_to != null) {
      map['to'] = _to;
    }
    return map;
  }
}
class CounterResponseDto {
  CounterResponseDto({
    this.sysId,
    required this.counterValue,
    this.createdAt,
    this.updatedAt,
  });

  final int counterValue;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final String? sysId;
}

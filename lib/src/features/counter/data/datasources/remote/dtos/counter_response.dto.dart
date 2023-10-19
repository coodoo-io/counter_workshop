class CounterResponseDto {
  CounterResponseDto({
    required this.sysId,
    required this.counterValue,
    this.createdAt,
    this.updatedAt,
  });

  final String sysId;
  final int counterValue;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}

class SnapshotData<T> {
  final T data;
  final bool isLoading;
  final dynamic error;

  const SnapshotData({
    required this.data,
    required this.isLoading,
    required this.error,
  });

  factory SnapshotData.initial({
    required T data,
  }) {
    return SnapshotData(
      data: data,
      isLoading: false,
      error: null,
    );
  }

  SnapshotData<T> copyWith({
    T? data,
    bool? isLoading,
    dynamic error,
  }) {
    return SnapshotData(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

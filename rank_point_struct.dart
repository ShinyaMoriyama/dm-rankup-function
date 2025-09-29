/// ランクポイント計算結果を格納するデータ構造
class RankPointStruct {
  /// 現在交換回数
  final int? currentExchangeCount;

  /// 獲得予定ポイント（ボーナス込み）
  final int? expectedPoints;

  /// 獲得予定ポイント（ボーナスを除く）
  final int? expectedBasePoints;

  /// 獲得予定ランクアップポイント
  final int? expectedRankUpPoints;

  /// 現在ランク
  final int? currentRank;

  /// 次のランクまでの残り（基本）ポイント
  final int? remainingPointsToNextRank;

  /// 次のランクまでの残り（基本）ポイント（交換後）
  final int? remainingPointsToNextRankAfterExchange;

  /// 獲得後の現在ポイント
  final int? currentPointsAfterExchange;

  /// 獲得後の現在ランク
  final int? currentRankAfterExchange;

  /// 獲得後の現在交換回数
  final int? currentExchangeCountAfterExchange;

  /// 次のランクまであと何回のポイント交換が必要か
  final int? remainingExchangesToNextRank;

  /// 次のランクまであと何回のポイント交換が必要か（交換後）
  final int? remainingExchangesToNextRankAfterExchange;

  /// 次のランクまでに必要な交換回数（12回or24回）
  final int? totalExchangesForNextRank;

  /// 次のランクまでに必要な交換回数（12回or24回）（交換後）
  final int? totalExchangesForNextRankAfterExchange;

  const RankPointStruct({
    this.currentExchangeCount,
    this.expectedPoints,
    this.expectedBasePoints,
    this.expectedRankUpPoints,
    this.currentRank,
    this.remainingPointsToNextRank,
    this.remainingPointsToNextRankAfterExchange,
    this.currentPointsAfterExchange,
    this.currentRankAfterExchange,
    this.currentExchangeCountAfterExchange,
    this.remainingExchangesToNextRank,
    this.remainingExchangesToNextRankAfterExchange,
    this.totalExchangesForNextRank,
    this.totalExchangesForNextRankAfterExchange,
  });

  @override
  String toString() {
    return '''
RankPointStruct(
  currentExchangeCount: $currentExchangeCount,
  expectedPoints: $expectedPoints,
  expectedBasePoints: $expectedBasePoints,
  expectedRankUpPoints: $expectedRankUpPoints,
  currentRank: $currentRank,
  remainingPointsToNextRank: $remainingPointsToNextRank,
  remainingPointsToNextRankAfterExchange: $remainingPointsToNextRankAfterExchange,
  currentPointsAfterExchange: $currentPointsAfterExchange,
  currentRankAfterExchange: $currentRankAfterExchange,
  currentExchangeCountAfterExchange: $currentExchangeCountAfterExchange,
  remainingExchangesToNextRank: $remainingExchangesToNextRank,
  remainingExchangesToNextRankAfterExchange: $remainingExchangesToNextRankAfterExchange,
  totalExchangesForNextRank: $totalExchangesForNextRank,
  totalExchangesForNextRankAfterExchange: $totalExchangesForNextRankAfterExchange
)''';
  }
}
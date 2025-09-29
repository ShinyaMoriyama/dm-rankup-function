import 'rank_point_struct.dart';

/// ランクごとの基本ポイント
const Map<int, int> basePointsByRank = {
  0: 50,
  1: 60,
  2: 70,
  3: 80,
  4: 100,
  5: 200,
};

/// ランクアップ時のボーナスポイント
const Map<int, int> rankUpBonuses = {
  1: 200,
  2: 500,
  3: 700,
  4: 1000,
  5: 2000,
};

/// 炭酸水メーカーのガスシリンダー交換におけるランクアッププログラムの計算関数
RankPointStruct calculateRankPoint({
  int? currentRank,
  int? currentExchangeCount,
  DateTime? lastPointAcquiredDate,
  int? highestBonusReceivedRank,
  int? currentTotalPoints,
}) {
  // パラメータのnull対応
  currentRank ??= 0;
  currentExchangeCount ??= 0;
  highestBonusReceivedRank ??= 0;
  currentTotalPoints ??= 0;

  // 最大ランクのチェック
  const maxRank = 5;
  
  // ランクダウン判定
  int actualCurrentRank = currentRank;
  int actualCurrentExchangeCount = currentExchangeCount;
  
  if (lastPointAcquiredDate != null) {
    final now = DateTime.now();
    
    // 日付のみで判定するため、時刻を00:00:00に正規化
    // 例：2024-07-20 15:30:00 → 2024-07-20 00:00:00
    // これにより時刻に関係なく純粋な日数差を計算できる
    final lastDate = DateTime(
      lastPointAcquiredDate.year, 
      lastPointAcquiredDate.month, 
      lastPointAcquiredDate.day
    );
    final today = DateTime(now.year, now.month, now.day);
    
    // 日付の差分を経過日数とする
    // 当日: 0日、前日: 1日、前々日: 2日...
    final daysSinceLastExchange = today.difference(lastDate).inDays;
    
    // 180日間交換がない場合（181日以上経過）でランクダウン
    if (daysSinceLastExchange > 180 && actualCurrentRank > 0) {
      actualCurrentRank -= 1;
      actualCurrentExchangeCount = 0;
    }
  }
  
  // 交換後の状態を計算
  final exchangeCountAfter = actualCurrentExchangeCount + 1;
  
  // 現在のランクでの必要交換回数
  final totalExchangesRequired = actualCurrentRank == 0 ? 12 : 24;
  
  // ランクアップ判定
  int rankAfterExchange = actualCurrentRank;
  int exchangeCountAfterExchange = exchangeCountAfter;
  
  if (exchangeCountAfter >= totalExchangesRequired && actualCurrentRank < maxRank) {
    rankAfterExchange = actualCurrentRank + 1;
    exchangeCountAfterExchange = 0;
  }
  
  // ポイント計算
  final basePoints = basePointsByRank[actualCurrentRank] ?? 0;
  int rankUpPoints = 0;
  
  // ランクアップボーナスの判定
  if (rankAfterExchange > actualCurrentRank && 
      rankAfterExchange > highestBonusReceivedRank) {
    rankUpPoints = rankUpBonuses[rankAfterExchange] ?? 0;
  }
  
  final totalPoints = basePoints + rankUpPoints;
  
  // 交換前の次のランクまでの残り計算
  int? remainingExchangesToNext;
  int? totalExchangesForNext;
  int? remainingPointsToNext;
  
  if (actualCurrentRank < maxRank) {
    totalExchangesForNext = actualCurrentRank == 0 ? 12 : 24;
    remainingExchangesToNext = totalExchangesForNext - actualCurrentExchangeCount;
    remainingPointsToNext = remainingExchangesToNext * (basePointsByRank[actualCurrentRank] ?? 0);
  }
  
  // 交換後の次のランクまでの残り計算
  int? remainingExchangesToNextAfter;
  int? totalExchangesForNextAfter;
  int? remainingPointsToNextAfter;
  
  if (rankAfterExchange < maxRank) {
    totalExchangesForNextAfter = rankAfterExchange == 0 ? 12 : 24;
    remainingExchangesToNextAfter = totalExchangesForNextAfter - exchangeCountAfterExchange;
    remainingPointsToNextAfter = remainingExchangesToNextAfter * (basePointsByRank[rankAfterExchange] ?? 0);
  }
  
  // 現在の累計ポイント（これまでの累計＋今回獲得分）
  final currentPointsAfter = currentTotalPoints + totalPoints;
  
  return RankPointStruct(
    currentExchangeCount: actualCurrentExchangeCount,
    expectedPoints: totalPoints,
    expectedBasePoints: basePoints,
    expectedRankUpPoints: rankUpPoints,
    currentRank: actualCurrentRank,
    remainingPointsToNextRank: remainingPointsToNext,
    remainingPointsToNextRankAfterExchange: remainingPointsToNextAfter,
    currentPointsAfterExchange: currentPointsAfter,
    currentRankAfterExchange: rankAfterExchange,
    currentExchangeCountAfterExchange: exchangeCountAfterExchange,
    remainingExchangesToNextRank: remainingExchangesToNext,
    remainingExchangesToNextRankAfterExchange: remainingExchangesToNextAfter,
    totalExchangesForNextRank: totalExchangesForNext,
    totalExchangesForNextRankAfterExchange: totalExchangesForNextAfter,
  );
}
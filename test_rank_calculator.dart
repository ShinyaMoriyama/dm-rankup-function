import 'rank_calculator.dart';

void main() {
  print('=== ランクアッププログラムのテスト開始 ===\n');

  // テスト1: 初回交換（全項目の検証）
  print('【テスト1】初回交換 - 全項目検証');
  final result1 = calculateRankPoint(
    currentRank: null,
    currentExchangeCount: null,
    lastPointAcquiredDate: null,
    highestBonusReceivedRank: null,
    currentTotalPoints: null,
  );
  print('検証結果:');
  print('  currentExchangeCount: ${result1.currentExchangeCount} (期待値: 0)');
  print('  expectedPoints: ${result1.expectedPoints} (期待値: 50)');
  print('  expectedBasePoints: ${result1.expectedBasePoints} (期待値: 50)');
  print('  expectedRankUpPoints: ${result1.expectedRankUpPoints} (期待値: 0)');
  print('  currentRank: ${result1.currentRank} (期待値: 0)');
  print('  remainingPointsToNextRank: ${result1.remainingPointsToNextRank} (期待値: 550)');
  print('  currentPointsAfterExchange: ${result1.currentPointsAfterExchange} (期待値: 50)');
  print('  currentRankAfterExchange: ${result1.currentRankAfterExchange} (期待値: 0)');
  print('  currentExchangeCountAfterExchange: ${result1.currentExchangeCountAfterExchange} (期待値: 1)');
  print('  remainingExchangesToNextRank: ${result1.remainingExchangesToNextRank} (期待値: 11)');
  print('  totalExchangesForNextRank: ${result1.totalExchangesForNextRank} (期待値: 12)');
  
  assert(result1.currentExchangeCount == 0);
  assert(result1.expectedPoints == 50);
  assert(result1.expectedBasePoints == 50);
  assert(result1.expectedRankUpPoints == 0);
  assert(result1.currentRank == 0);
  assert(result1.remainingPointsToNextRank == 600); // 12回 × 50ポイント
  assert(result1.remainingPointsToNextRankAfterExchange == 550); // 11回 × 50ポイント
  assert(result1.currentPointsAfterExchange == 50);
  assert(result1.currentRankAfterExchange == 0);
  assert(result1.currentExchangeCountAfterExchange == 1);
  assert(result1.remainingExchangesToNextRank == 12);
  assert(result1.remainingExchangesToNextRankAfterExchange == 11);
  assert(result1.totalExchangesForNextRank == 12);
  assert(result1.totalExchangesForNextRankAfterExchange == 12);
  print('✅ テスト1 成功\n');

  // テスト2: ランク0→1へのランクアップ（全項目の検証）
  print('【テスト2】ランク0→1へのランクアップ - 全項目検証');
  // これまでに11回交換済み（11 * 50 = 550ポイント獲得済み）
  final result2 = calculateRankPoint(
    currentRank: 0,
    currentExchangeCount: 11,
    lastPointAcquiredDate: DateTime.now().subtract(Duration(days: 30)),
    highestBonusReceivedRank: 0,
    currentTotalPoints: 550,
  );
  print('検証結果:');
  print('  currentExchangeCount: ${result2.currentExchangeCount} (期待値: 11)');
  print('  expectedPoints: ${result2.expectedPoints} (期待値: 250)');
  print('  expectedBasePoints: ${result2.expectedBasePoints} (期待値: 50)');
  print('  expectedRankUpPoints: ${result2.expectedRankUpPoints} (期待値: 200)');
  print('  currentRank: ${result2.currentRank} (期待値: 0)');
  print('  remainingPointsToNextRank: ${result2.remainingPointsToNextRank} (期待値: 1440)');
  print('  currentPointsAfterExchange: ${result2.currentPointsAfterExchange} (期待値: 800)');
  print('  currentRankAfterExchange: ${result2.currentRankAfterExchange} (期待値: 1)');
  print('  currentExchangeCountAfterExchange: ${result2.currentExchangeCountAfterExchange} (期待値: 0)');
  print('  remainingExchangesToNextRank: ${result2.remainingExchangesToNextRank} (期待値: 24)');
  print('  totalExchangesForNextRank: ${result2.totalExchangesForNextRank} (期待値: 24)');
  
  assert(result2.currentExchangeCount == 11);
  assert(result2.expectedPoints == 250);
  assert(result2.expectedBasePoints == 50);
  assert(result2.expectedRankUpPoints == 200);
  assert(result2.currentRank == 0);
  assert(result2.remainingPointsToNextRank == 50); // 1回 × 50ポイント
  assert(result2.remainingPointsToNextRankAfterExchange == 1440); // 24回 × 60ポイント
  assert(result2.currentPointsAfterExchange == 800); // 550 + 250
  assert(result2.currentRankAfterExchange == 1);
  assert(result2.currentExchangeCountAfterExchange == 0);
  assert(result2.remainingExchangesToNextRank == 1);
  assert(result2.remainingExchangesToNextRankAfterExchange == 24);
  assert(result2.totalExchangesForNextRank == 12);
  assert(result2.totalExchangesForNextRankAfterExchange == 24);
  print('✅ テスト2 成功\n');

  // テスト3: ランク1での通常交換（全項目の検証）
  print('【テスト3】ランク1での通常交換 - 全項目検証');
  // ランク0で12回（600+200ボーナス）、ランク1で10回（600）= 1400ポイント獲得済み
  final result3 = calculateRankPoint(
    currentRank: 1,
    currentExchangeCount: 10,
    lastPointAcquiredDate: DateTime.now().subtract(Duration(days: 60)),
    highestBonusReceivedRank: 1,
    currentTotalPoints: 1400,
  );
  print('検証結果:');
  print('  currentExchangeCount: ${result3.currentExchangeCount} (期待値: 10)');
  print('  expectedPoints: ${result3.expectedPoints} (期待値: 60)');
  print('  expectedBasePoints: ${result3.expectedBasePoints} (期待値: 60)');
  print('  expectedRankUpPoints: ${result3.expectedRankUpPoints} (期待値: 0)');
  print('  currentRank: ${result3.currentRank} (期待値: 1)');
  print('  remainingPointsToNextRank: ${result3.remainingPointsToNextRank} (期待値: 780)');
  print('  currentPointsAfterExchange: ${result3.currentPointsAfterExchange} (期待値: 1460)');
  print('  currentRankAfterExchange: ${result3.currentRankAfterExchange} (期待値: 1)');
  print('  currentExchangeCountAfterExchange: ${result3.currentExchangeCountAfterExchange} (期待値: 11)');
  print('  remainingExchangesToNextRank: ${result3.remainingExchangesToNextRank} (期待値: 13)');
  print('  totalExchangesForNextRank: ${result3.totalExchangesForNextRank} (期待値: 24)');
  
  assert(result3.currentExchangeCount == 10);
  assert(result3.expectedPoints == 60);
  assert(result3.expectedBasePoints == 60);
  assert(result3.expectedRankUpPoints == 0);
  assert(result3.currentRank == 1);
  assert(result3.remainingPointsToNextRank == 840); // 14回 × 60ポイント
  assert(result3.remainingPointsToNextRankAfterExchange == 780); // 13回 × 60ポイント
  assert(result3.currentPointsAfterExchange == 1460); // 1400 + 60
  assert(result3.currentRankAfterExchange == 1);
  assert(result3.currentExchangeCountAfterExchange == 11);
  assert(result3.remainingExchangesToNextRank == 14);
  assert(result3.remainingExchangesToNextRankAfterExchange == 13);
  assert(result3.totalExchangesForNextRank == 24);
  assert(result3.totalExchangesForNextRankAfterExchange == 24);
  print('✅ テスト3 成功\n');

  // テスト4: 180日経過でランクダウンしない（全項目の検証）
  print('【テスト4】180日経過でランクダウンしない - 全項目検証');
  // ランク2で15回交換済み（過去の累計: 2500ポイント）
  final result4 = calculateRankPoint(
    currentRank: 2,
    currentExchangeCount: 15,
    lastPointAcquiredDate: DateTime.now().subtract(Duration(days: 180)),
    highestBonusReceivedRank: 2,
    currentTotalPoints: 2500,
  );
  print('検証結果:');
  print('  currentExchangeCount: ${result4.currentExchangeCount} (期待値: 15)');
  print('  expectedPoints: ${result4.expectedPoints} (期待値: 70)');
  print('  expectedBasePoints: ${result4.expectedBasePoints} (期待値: 70)');
  print('  expectedRankUpPoints: ${result4.expectedRankUpPoints} (期待値: 0)');
  print('  currentRank: ${result4.currentRank} (期待値: 2)');
  print('  remainingPointsToNextRank: ${result4.remainingPointsToNextRank} (期待値: 630)');
  print('  currentPointsAfterExchange: ${result4.currentPointsAfterExchange} (期待値: 2570)');
  print('  currentRankAfterExchange: ${result4.currentRankAfterExchange} (期待値: 2)');
  print('  currentExchangeCountAfterExchange: ${result4.currentExchangeCountAfterExchange} (期待値: 16)');
  print('  remainingExchangesToNextRank: ${result4.remainingExchangesToNextRank} (期待値: 9)');
  print('  totalExchangesForNextRank: ${result4.totalExchangesForNextRank} (期待値: 24)');
  
  assert(result4.currentExchangeCount == 15);  // ランクダウンしない
  assert(result4.expectedPoints == 70);
  assert(result4.expectedBasePoints == 70);
  assert(result4.expectedRankUpPoints == 0);
  assert(result4.currentRank == 2);  // ランク2のまま
  assert(result4.remainingPointsToNextRank == 630); // 9回 × 70ポイント
  assert(result4.remainingPointsToNextRankAfterExchange == 560); // 8回 × 70ポイント
  assert(result4.currentPointsAfterExchange == 2570); // 2500 + 70
  assert(result4.currentRankAfterExchange == 2);
  assert(result4.currentExchangeCountAfterExchange == 16);
  assert(result4.remainingExchangesToNextRank == 9);
  assert(result4.remainingExchangesToNextRankAfterExchange == 8);
  assert(result4.totalExchangesForNextRank == 24);
  assert(result4.totalExchangesForNextRankAfterExchange == 24);
  print('✅ テスト4 成功\n');

  // テスト5: 最大ランク（ランク5）での交換（全項目の検証）
  print('【テスト5】最大ランク（ランク5）での交換 - 全項目検証');
  // ランク5で50回交換済み（過去の累計: 15000ポイント）
  final result5 = calculateRankPoint(
    currentRank: 5,
    currentExchangeCount: 50,
    lastPointAcquiredDate: DateTime.now().subtract(Duration(days: 30)),
    highestBonusReceivedRank: 5,
    currentTotalPoints: 15000,
  );
  print('検証結果:');
  print('  currentExchangeCount: ${result5.currentExchangeCount} (期待値: 50)');
  print('  expectedPoints: ${result5.expectedPoints} (期待値: 200)');
  print('  expectedBasePoints: ${result5.expectedBasePoints} (期待値: 200)');
  print('  expectedRankUpPoints: ${result5.expectedRankUpPoints} (期待値: 0)');
  print('  currentRank: ${result5.currentRank} (期待値: 5)');
  print('  remainingPointsToNextRank: ${result5.remainingPointsToNextRank} (期待値: null)');
  print('  currentPointsAfterExchange: ${result5.currentPointsAfterExchange} (期待値: 15200)');
  print('  currentRankAfterExchange: ${result5.currentRankAfterExchange} (期待値: 5)');
  print('  currentExchangeCountAfterExchange: ${result5.currentExchangeCountAfterExchange} (期待値: 51)');
  print('  remainingExchangesToNextRank: ${result5.remainingExchangesToNextRank} (期待値: null)');
  print('  totalExchangesForNextRank: ${result5.totalExchangesForNextRank} (期待値: null)');
  
  assert(result5.currentExchangeCount == 50);
  assert(result5.expectedPoints == 200);
  assert(result5.expectedBasePoints == 200);
  assert(result5.expectedRankUpPoints == 0);
  assert(result5.currentRank == 5);
  assert(result5.remainingPointsToNextRank == null);
  assert(result5.remainingPointsToNextRankAfterExchange == null);
  assert(result5.currentPointsAfterExchange == 15200); // 15000 + 200
  assert(result5.currentRankAfterExchange == 5);
  assert(result5.currentExchangeCountAfterExchange == 51);
  assert(result5.remainingExchangesToNextRank == null);
  assert(result5.remainingExchangesToNextRankAfterExchange == null);
  assert(result5.totalExchangesForNextRank == null);
  assert(result5.totalExchangesForNextRankAfterExchange == null);
  print('✅ テスト5 成功\n');

  // テスト6: ランクダウン後の再ランクアップ（ボーナスなし）- 全項目検証
  print('【テスト6】ランクダウン後の再ランクアップ（ボーナスなし）- 全項目検証');
  // ランク1で23回交換済み（過去の累計: 3000ポイント）
  final result6 = calculateRankPoint(
    currentRank: 1,
    currentExchangeCount: 23,
    lastPointAcquiredDate: DateTime.now().subtract(Duration(days: 30)),
    highestBonusReceivedRank: 2,
    currentTotalPoints: 3000,
  );
  print('検証結果:');
  print('  currentExchangeCount: ${result6.currentExchangeCount} (期待値: 23)');
  print('  expectedPoints: ${result6.expectedPoints} (期待値: 60)');
  print('  expectedBasePoints: ${result6.expectedBasePoints} (期待値: 60)');
  print('  expectedRankUpPoints: ${result6.expectedRankUpPoints} (期待値: 0)');
  print('  currentRank: ${result6.currentRank} (期待値: 1)');
  print('  remainingPointsToNextRank: ${result6.remainingPointsToNextRank} (期待値: 1680)');
  print('  currentPointsAfterExchange: ${result6.currentPointsAfterExchange} (期待値: 3060)');
  print('  currentRankAfterExchange: ${result6.currentRankAfterExchange} (期待値: 2)');
  print('  currentExchangeCountAfterExchange: ${result6.currentExchangeCountAfterExchange} (期待値: 0)');
  print('  remainingExchangesToNextRank: ${result6.remainingExchangesToNextRank} (期待値: 24)');
  print('  totalExchangesForNextRank: ${result6.totalExchangesForNextRank} (期待値: 24)');
  
  assert(result6.currentExchangeCount == 23);
  assert(result6.expectedPoints == 60);
  assert(result6.expectedBasePoints == 60);
  assert(result6.expectedRankUpPoints == 0);
  assert(result6.currentRank == 1);
  assert(result6.remainingPointsToNextRank == 60); // 1回 × 60ポイント
  assert(result6.remainingPointsToNextRankAfterExchange == 1680); // 24回 × 70ポイント
  assert(result6.currentPointsAfterExchange == 3060); // 3000 + 60
  assert(result6.currentRankAfterExchange == 2);
  assert(result6.currentExchangeCountAfterExchange == 0);
  assert(result6.remainingExchangesToNextRank == 1);
  assert(result6.remainingExchangesToNextRankAfterExchange == 24);
  assert(result6.totalExchangesForNextRank == 24);
  assert(result6.totalExchangesForNextRankAfterExchange == 24);
  print('✅ テスト6 成功\n');

  // テスト7: ランク4→5へのランクアップ（ボーナス2000ポイント）
  print('【テスト7】ランク4→5へのランクアップ - 2000ポイントボーナス検証');
  // ランク4で23回交換済み（過去の累計: 5000ポイント）
  final result7 = calculateRankPoint(
    currentRank: 4,
    currentExchangeCount: 23,
    lastPointAcquiredDate: DateTime.now().subtract(Duration(days: 10)),
    highestBonusReceivedRank: 4,
    currentTotalPoints: 5000,
  );
  print('検証結果:');
  print('  currentExchangeCount: ${result7.currentExchangeCount} (期待値: 23)');
  print('  expectedPoints: ${result7.expectedPoints} (期待値: 2100)');
  print('  expectedBasePoints: ${result7.expectedBasePoints} (期待値: 100)');
  print('  expectedRankUpPoints: ${result7.expectedRankUpPoints} (期待値: 2000)');
  print('  currentRank: ${result7.currentRank} (期待値: 4)');
  print('  currentPointsAfterExchange: ${result7.currentPointsAfterExchange} (期待値: 7100)');
  print('  currentRankAfterExchange: ${result7.currentRankAfterExchange} (期待値: 5)');
  print('  currentExchangeCountAfterExchange: ${result7.currentExchangeCountAfterExchange} (期待値: 0)');
  
  assert(result7.currentExchangeCount == 23);
  assert(result7.expectedPoints == 2100); // 100 + 2000
  assert(result7.expectedBasePoints == 100);
  assert(result7.expectedRankUpPoints == 2000);
  assert(result7.currentRank == 4);
  assert(result7.currentPointsAfterExchange == 7100); // 5000 + 2100
  assert(result7.currentRankAfterExchange == 5);
  assert(result7.currentExchangeCountAfterExchange == 0);
  assert(result7.remainingPointsToNextRank == 100); // 1回 × 100ポイント
  assert(result7.remainingPointsToNextRankAfterExchange == null);
  assert(result7.remainingExchangesToNextRank == 1);
  assert(result7.remainingExchangesToNextRankAfterExchange == null);
  assert(result7.totalExchangesForNextRank == 24);
  assert(result7.totalExchangesForNextRankAfterExchange == null);
  print('✅ テスト7 成功\n');

  // テスト8: ランク0での3回目の交換（累計ポイントの検証）
  print('【テスト8】ランク0での3回目の交換 - 累計ポイント検証');
  // これまでに2回交換済み（2 * 50 = 100ポイント獲得済み）
  final result8 = calculateRankPoint(
    currentRank: 0,
    currentExchangeCount: 2,
    lastPointAcquiredDate: DateTime.now().subtract(Duration(days: 10)),
    highestBonusReceivedRank: 0,
    currentTotalPoints: 100,
  );
  print('検証結果:');
  print('  currentPointsAfterExchange: ${result8.currentPointsAfterExchange} (期待値: 150)');
  
  assert(result8.currentPointsAfterExchange == 150); // 100 + 50
  print('✅ テスト8 成功\n');

  // テスト9: 181日前の23時に交換した場合（時刻に関係なくランクダウン）
  print('【テスト9】181日前23時の交換 - 時刻に関係なくランクダウン検証');
  // 181日前の23時に最後の交換
  final lastExchangeTime = DateTime.now().subtract(Duration(days: 181));
  final lastExchangeAt23 = DateTime(
    lastExchangeTime.year,
    lastExchangeTime.month,
    lastExchangeTime.day,
    23, // 23時
    0,
    0
  );
  
  final result9 = calculateRankPoint(
    currentRank: 3,
    currentExchangeCount: 20,
    lastPointAcquiredDate: lastExchangeAt23,
    highestBonusReceivedRank: 3,
    currentTotalPoints: 4000,
  );
  
  print('検証結果:');
  print('  最後の交換日時: ${lastExchangeAt23}');
  print('  現在の日時: ${DateTime.now()}');
  print('  currentExchangeCount: ${result9.currentExchangeCount} (期待値: 0)');
  print('  expectedPoints: ${result9.expectedPoints} (期待値: 70)');
  print('  expectedBasePoints: ${result9.expectedBasePoints} (期待値: 70)');
  print('  expectedRankUpPoints: ${result9.expectedRankUpPoints} (期待値: 0)');
  print('  currentRank: ${result9.currentRank} (期待値: 2)');
  print('  remainingPointsToNextRank: ${result9.remainingPointsToNextRank} (期待値: 1610)');
  print('  currentPointsAfterExchange: ${result9.currentPointsAfterExchange} (期待値: 4070)');
  print('  currentRankAfterExchange: ${result9.currentRankAfterExchange} (期待値: 2)');
  print('  currentExchangeCountAfterExchange: ${result9.currentExchangeCountAfterExchange} (期待値: 1)');
  print('  remainingExchangesToNextRank: ${result9.remainingExchangesToNextRank} (期待値: 23)');
  print('  totalExchangesForNextRank: ${result9.totalExchangesForNextRank} (期待値: 24)');
  
  assert(result9.currentExchangeCount == 0);  // 交換回数リセット
  assert(result9.expectedPoints == 70);
  assert(result9.expectedBasePoints == 70);  // ランク2の基本ポイント
  assert(result9.expectedRankUpPoints == 0);
  assert(result9.currentRank == 2);  // ランク3→2にダウン
  assert(result9.remainingPointsToNextRank == 1680);  // 24回 × 70ポイント
  assert(result9.remainingPointsToNextRankAfterExchange == 1610);  // 23回 × 70ポイント
  assert(result9.currentPointsAfterExchange == 4070);  // 4000 + 70
  assert(result9.currentRankAfterExchange == 2);
  assert(result9.currentExchangeCountAfterExchange == 1);
  assert(result9.remainingExchangesToNextRank == 24);
  assert(result9.remainingExchangesToNextRankAfterExchange == 23);
  assert(result9.totalExchangesForNextRank == 24);
  assert(result9.totalExchangesForNextRankAfterExchange == 24);
  print('✅ テスト9 成功\n');

  print('=== すべてのテストが成功しました！ ===');
}
import 'rank_calculator.dart';

void main() {
  final results = <Map<String, dynamic>>[];

  int currentRank = 0;
  int currentExchangeCount = 0;
  int highestBonusReceivedRank = 0;
  int currentTotalPoints = 0;
  DateTime lastPointAcquiredDate = DateTime.now();

  // ランク5の5回目まで = 12 + 24 + 24 + 24 + 24 + 5 = 113回
  for (int i = 1; i <= 113; i++) {
    final result = calculateRankPoint(
      currentRank: currentRank,
      currentExchangeCount: currentExchangeCount,
      lastPointAcquiredDate: lastPointAcquiredDate,
      highestBonusReceivedRank: highestBonusReceivedRank,
      currentTotalPoints: currentTotalPoints,
    );

    results.add({
      'exchangeNumber': i,
      'rankBefore': result.currentRank,
      'exchangeCountBefore': result.currentExchangeCount,
      'basePoints': result.expectedBasePoints,
      'rankUpBonus': result.expectedRankUpPoints,
      'totalPointsThisExchange': result.expectedPoints,
      'cumulativePoints': result.currentPointsAfterExchange,
      'rankAfter': result.currentRankAfterExchange,
      'exchangeCountAfter': result.currentExchangeCountAfterExchange,
    });

    // 次の交換のために状態を更新
    currentRank = result.currentRankAfterExchange!;
    currentExchangeCount = result.currentExchangeCountAfterExchange!;
    currentTotalPoints = result.currentPointsAfterExchange!;
    lastPointAcquiredDate = DateTime.now();

    // ランクアップがあった場合、highestBonusReceivedRankを更新
    if (result.expectedRankUpPoints! > 0) {
      highestBonusReceivedRank = currentRank;
    }
  }

  // マークダウン形式で出力
  final buffer = StringBuffer();
  buffer.writeln('# ランク0からランク5の5回目交換までの獲得ポイント一覧');
  buffer.writeln();
  buffer.writeln('## 概要');
  buffer.writeln();
  buffer.writeln('- 初期状態: ランク0、交換回数0');
  buffer.writeln('- 対象範囲: ランク0の1回目からランク5の5回目まで（合計113回）');
  buffer.writeln('- 前提条件: すべての交換が180日以内に実施される');
  buffer.writeln();
  buffer.writeln('## 獲得ポイント詳細');
  buffer.writeln();
  buffer.writeln('| 交換回数 | 交換前ランク | ランク内交換回数 | 基本ポイント | ランクアップボーナス | 今回獲得ポイント | 累計獲得ポイント | 交換後ランク |');
  buffer.writeln('|---------|------------|----------------|------------|-------------------|----------------|----------------|------------|');

  for (final result in results) {
    buffer.writeln('| ${result['exchangeNumber']} | '
        'ランク${result['rankBefore']} | '
        '${result['exchangeCountBefore']}回目 | '
        '${result['basePoints']} | '
        '${result['rankUpBonus']} | '
        '${result['totalPointsThisExchange']} | '
        '${result['cumulativePoints']} | '
        'ランク${result['rankAfter']} |');
  }

  buffer.writeln();
  buffer.writeln('## ランクアップポイント');
  buffer.writeln();

  final rankUps = results.where((r) => r['rankUpBonus'] > 0).toList();
  for (final rankUp in rankUps) {
    buffer.writeln('- **第${rankUp['exchangeNumber']}回交換**: '
        'ランク${rankUp['rankBefore']}→ランク${rankUp['rankAfter']} '
        '(ボーナス: ${rankUp['rankUpBonus']}ポイント)');
  }

  buffer.writeln();
  buffer.writeln('## 最終結果');
  buffer.writeln();
  final lastResult = results.last;
  buffer.writeln('- **総交換回数**: ${lastResult['exchangeNumber']}回');
  buffer.writeln('- **最終ランク**: ランク${lastResult['rankAfter']}');
  buffer.writeln('- **累計獲得ポイント**: ${lastResult['cumulativePoints']}ポイント');

  print(buffer.toString());
}

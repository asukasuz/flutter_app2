class CalculateBMI {
  CalculateBMI(this.height, this.weight);

  final int height;
  final int weight;
  double bmi = 0;

  // voidを使うのはreturnがないとき。
  // BMIを計算
  String calculateBmi() {
    bmi = weight / (height * height) * 10000;
    return bmi.toStringAsFixed(1);
  }

  String calculateMsg() {
    if (bmi >= 25){
      return "Too FAT! ちょっと太りすぎです。";
    } else if (bmi > 18.5){
      return "Keep it up! 理想的な体形です！";
    } else return "Too Thin. 痩せすぎです！";
  }
}

#!/usr/bin/env alice

include("../utilities/math.ice");

using Alice.Math;
using Alice.Random;
using Commons.Utilities.Math;

const MAX = 100;        //生成する乱数の最大値
const MIN = 0;          //生成する乱数の最小値
const CHANCE = 10;      //この数だけチャレンジできる
const RATHER_DIFF = 30; //正解と入力数値の差がこれより大きい場合「かなり～」判定
const NEAR_DIFF = 5;    //正解と入力数値の差がこれより小きい場合「ちょっと～」判定

readonly number answer = rand(MIN,MAX); //ゲームの答えになる乱数

print("==数当てゲーム==");
print($"{MIN}以上{MAX}以下の数字を{CHANCE}回以内に当ててみてください");

for(number i = 0;i < CHANCE;i++;)
{
    print($"残りチャンス：{CHANCE-i}回");
    number input = InputNumber("数字を入力", x => x > 0 && IsInteger(x)); //入力された自然数
    
    number diff = answer - input;
    
    if(diff == 0)
    {
        //正解を当てたとき
        print("正解です！");
        write("エンターキーを押すと終了します...");
        read();//エンターキーが押されるのを待つ
        exit;//プログラムを終了
    }
    string sign = "大きい";
    if(diff < 0)
    {
        sign = "小さい";
    }

    diff = math_abs(diff);
    //どのくらい離れているかを判断
    string degree = "は";
    if(diff > RATHER_DIFF)
    {
        degree = "かなり";
    }
    else if(diff < NEAR_DIFF)
    {
        degree = "ちょっと";
    }

    print($"{input}より{degree}{sign}です");
}
print("ゲームオーバー！");
write("エンターキーを押すと終了します...");
read();//エンターキーが押されるのを待つ

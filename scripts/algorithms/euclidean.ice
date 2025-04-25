#!/usr/bin/env alice

include("../utilities/math.ice");

using Commons.Utilities.Math;

// ユークリッドの互除法を用いて、最大公約数を取得します。
// また、計算過程を画面に出力します。
// 事前条件: a,b は0以上の自然数、a,b のどちらかは0でない
number GetGCM(number a,number b)
    requires(IsInteger(a) && IsInteger(b) && a >= 0 && b >= 0 && (a != 0 || b != 0))
    ensures(IsInteger(return))
{
    number mod = a % b;
    print($"{a} / {b} = {a/b} ... {mod}");
    
    if(mod == 0)
    {
        return b;
    }

    //割り切れない時は再帰的に計算を続ける
    return GetGCM(b,mod);
}

print("ユークリッドの互除法を使って、最大公約数を計算します。");
print("最大公約数を求めたい数を入力してください。");

number x = InputNumber("1つ目の数", x => x != 0 && IsInteger(x));
number y = InputNumber("2つ目の数", x => x != 0 && IsInteger(x));

number result = GetGCM(x,y);

print($"{x}と{y}の最大公約数は、{result}です。");
write("エンターキーを押すと終了します...");
read();

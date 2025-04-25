using Alice.Math;

namespace Commons.Utilities.Math;

// 自然数かどうか判定する関数
public bool IsNaturalNumber(number num)
{
    return num >= 0;
}

// 整数かどうか判定する関数
public bool IsInteger(number num)
{
    return num == math_floor(num);
}

public number InputNumber(string prompt, delegate func, string? errorMsg = null)
{
    write(prompt);

    number? num = read() as number;
    print("fu");
    if(!num.HasValue) {
        print(errorMsg ?? "無効な入力です。");
        return InputNumber(prompt, filter, errorMsg);
    }
    if(filter != null && !filter(num.Value)) {
        print(errorMsg ?? "無効な入力です。");
        return InputNumber(prompt, filter, errorMsg);
    }
    return num.Value;
}

using Alice.Math;

const MAX_COUNT = 10000;

print($"0から数えて{MAX_COUNT}個の素数を表示します");

number i = 0;
number count = 0;
while(count < MAX_COUNT)
{
    if(math_isPrime(i++))
    {
        write($"{i} ");
        count++;
    }
}
read();

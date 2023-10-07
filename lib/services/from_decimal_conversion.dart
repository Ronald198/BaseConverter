class FromDecimalConversion {
  static Map<int, String> decToHexDigit = {
    0: "0",
    1: "1",
    2: "2",
    3: "3",
    4: "4",
    5: "5",
    6: "6",
    7: "7",
    8: "8",
    9: "9",
    10: "A",
    11: "B",
    12: "C",
    13: "D",
    14: "E",
    15: "F",
  };

  static String decToBin(double dec)
  {
    int decInt = dec.floor();
    double decFractionalPart = dec - decInt;

    String binReversed = "";
    String bin = "";

    while (decInt != 0) 
    {
      binReversed += (decInt % 2).toString();
      decInt = (decInt / 2).floor();
    }

    for (int i = binReversed.length - 1; i >= 0; i--)
    {
      bin += binReversed[i];
    }

    if (decFractionalPart != 0)
    {
      bin += ".";

      for (int i = 0; i < 10; i++)
      {
        decFractionalPart *= 2;

        if (decFractionalPart >= 1)
        {
          decFractionalPart--;
          bin += "1";
        }
        else
        {
          bin += "0";
        }

        if (decFractionalPart == 0)
        {
          break;
        }
      }
    }
    else
    {
      bin += ".0";
    }

    return bin;
  }

  static String decToHex(double dec)
  {
    int decInt = dec.floor();
    double decFractionalPart = dec - decInt;

    String hexReversed = "";
    String hex = "";

    while (decInt != 0) 
    {
      int modulus = decInt %16;
      hexReversed += FromDecimalConversion.decToHexDigit[modulus]!;

      decInt = (decInt / 16).floor();
    }

    for (int i = hexReversed.length - 1; i >= 0; i--)
    {
      hex += hexReversed[i];
    }

    if (decFractionalPart != 0)
    {
      hex += ".";
      
      for (int i = 0; i < 10; i++)
      {
        decFractionalPart *= 16;

        int toAdd = decFractionalPart.floor();
        hex += FromDecimalConversion.decToHexDigit[toAdd]!;

        decFractionalPart = decFractionalPart - toAdd;
      }
    }
    else
    {
      hex += ".0";
    }

    return hex;
  }

  static String decToOct(double dec)
  {
    int decInt = dec.floor();
    double decFractionalPart = dec - decInt;

    String octReversed = "";
    String oct = "";

    while (decInt != 0) 
    {
      octReversed += (decInt % 8).toString();
      decInt = (decInt / 8).floor();
    }

    for (int i = octReversed.length - 1; i >= 0; i--)
    {
      oct += octReversed[i];
    }

    if (decFractionalPart != 0)
    {
      oct += ".";
      
      for (int i = 0; i < 10; i++)
      {
        decFractionalPart *= 8;

        int toAdd = decFractionalPart.floor();
        oct += toAdd.toString();

        decFractionalPart = decFractionalPart - toAdd;

        if (decFractionalPart == 0)
        {
          break;
        }
      }
    }
    else
    {
      oct += ".0";
    }

    return oct;
  }
}
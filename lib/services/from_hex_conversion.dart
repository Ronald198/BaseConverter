class FromHexConversion {
  static Map<String, int> hexToDecDigit = {
    "0": 0,
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
    "9": 9,
    "A": 10,
    "B": 11,
    "C": 12,
    "D": 13,
    "E": 14,
    "F": 15,
  };

  static String hexToDec(String hex)
  {
    double dec = 0;
    int magnitude = 1;

    String hexWholePart = hex.split(".")[0];

    for (int i = hexWholePart.length - 1; i >= 0; i--)
    {
      dec += FromHexConversion.hexToDecDigit[hexWholePart[i]]! * magnitude;
      magnitude *= 16;
    }

    if (hex.contains("."))
    {
      magnitude = 16;
      String hexFractionalPart = hex.split(".")[1];

      for (int i = 0; i < hexFractionalPart.length; i++)
      {
        dec += FromHexConversion.hexToDecDigit[hexFractionalPart[i]]! / magnitude;
        magnitude *= 16;
      }
    }

    return dec.toString();
  }
}
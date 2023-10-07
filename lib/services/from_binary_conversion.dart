class FromBinaryConversion {
  static String binToDec(String bin)
  {
    double dec = 0;
    int magnitude = 1;

    String binWholePart = bin.split(".")[0];

    for (int i = binWholePart.length - 1; i >= 0; i--)
    {
      dec += int.parse(binWholePart[i]) * magnitude;
      magnitude *= 2;
    }

    if (bin.contains("."))
    {
      magnitude = 2;
      String binFractionalPart = bin.split(".")[1];

      for (int i = 0; i < binFractionalPart.length; i++)
      {
        dec += int.parse(binFractionalPart[i]) / magnitude;
        magnitude *= 2;
      }
    }

    return dec.toString();
  }
}
class FromOctalConversion {
  static String octToDec(String oct)
  {
    double dec = 0;
    int magnitude = 1;

    String octWholePart = oct.split(".")[0];

    for (int i = octWholePart.length - 1; i >= 0; i--)
    {
      dec += int.parse(octWholePart[i]) * magnitude;
      magnitude *= 8;
    }

    if (oct.contains("."))
    {
      magnitude = 8;
      String octFractionalPart = oct.split(".")[1];

      for (int i = 0; i < octFractionalPart.length; i++)
      {
        dec += int.parse(octFractionalPart[i]) / magnitude;
        magnitude *= 8;
      }
    }

    return dec.toString();
  }
}
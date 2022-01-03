//this file is for... translating into different scripts.
//it does not add to the functionality of the code in any meaningful way.
//and was mostly intended as a joke.

String translateStringtoBinary(String input) {
  String text = "";
  for (int i = 0; i < input.length; i++) {
    String toBin = input.codeUnitAt(i).toRadixString(2) + " ";
    while (toBin.length < 9) {
      toBin = "0"+toBin;
    }
    text += toBin;
  }
  return text.trim();
}

String translateStringToMoseCode(String input) {
  String text = "";
  for (int i = 0; i < input.length; i++) {
    text += morseCodeOf(input[i].toLowerCase());
  }
  return text.trim();
}

String morseCodeOf(String letter) {
  switch (letter) {
    case "a":
      return ".- ";
    case "b":
      return "-... ";
    case "c":
      return "-.-. ";
    case "d":
      return "-.. ";
    case "e":
      return ". ";
    case "f":
      return "..-. ";
    case "g":
      return "--. ";
    case "h":
      return ".... ";
    case "i":
      return ".. ";
    case "j":
      return ".--- ";
    case "k":
      return "-.- ";
    case "l":
      return ".-.. ";
    case "m":
      return "-- ";
    case "n":
      return "-. ";
    case "o":
      return "--- ";
    case "p":
      return ".--. ";
    case "q":
      return "--.- ";
    case "r":
      return ".-. ";
    case "s":
      return "... ";
    case "t":
      return "- ";
    case "u":
      return "..- ";
    case "v":
      return "...- ";
    case "w":
      return ".-- ";
    case "x":
      return "-..- ";
    case "y":
      return "-.-- ";
    case "z":
      return "--.. ";
    case "0":
      return "----- ";
    case "1":
      return ".---- ";
    case "2":
      return "..--- ";
    case "3":
      return "...-- ";
    case "4":
      return "....- ";
    case "5":
      return "..... ";
    case "6":
      return "-.... ";
    case "7":
      return "--... ";
    case "8":
      return "---.. ";
    case "9":
      return "----. ";
    case " ":
      return "/ ";
    case ",":
      return "--..-- ";
    case ".":
      return ".-.-.- ";
    default:
      return letter;
  }
}

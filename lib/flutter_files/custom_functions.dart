bool? subStringBool(
  String? str,
  String? substr,
) {
  // takes a string str argument and checks if it contains substring substr argument and if true, returns true boolean argument
// Takes a string str argument and checks if it contains substring substr argument and if true, returns true boolean argument
  if (str == null || substr == null) {
    return null;
  }
  return str.contains(substr);
}

String? subStringFromIndex(
  String? str,
  int? index,
) {
  // takes string srt argument and returns the substring at the index argument
// takes string str argument and returns the substring at the index argument
  if (str == null || index == null || index >= str.length) {
    return null;
  }

  return str.substring(index);
}

int? subStringIndex(
  String? str,
  String? substr,
) {
  // takes string str argument and returns the index of substring substr argument
// takes string str argument and returns the index of substring substr argument
  if (str == null || substr == null) {
    return null;
  }
  return str.indexOf(substr);
}

int? indexOfLastCharOfSubStr(
  String? str,
  String? substr,
) {
  // takes string str argument and returns the index of last character of the sub string substr argument
  if (str == null || substr == null) {
    return null;
  }
  int index = str.lastIndexOf(substr);
  if (index == -1) {
    return null;
  }
  return index + substr.length - 1;
}

String? returnInputValue(
  String? str,
  int? index1,
) {
  // Takes a string str argument and returns substring from a given index index1 argument until a blank space has been found
  if (str == null || index1 == null || index1 >= str.length) {
    return null;
  }
  int index2 = str.indexOf(' ', index1);
  if (index2 == -1) {
    return str.substring(index1);
  }
  return str.substring(index1, index2);
}

String? returnInputValue2(
  String? str,
  int? index1,
) {
  //  Takes a string str argument and returns substring from a given index index1 argument until 2 blank spaces have been found
  if (str == null || index1 == null) {
    return null;
  }
  int count = 0;
  int index2 = index1;
  while (count < 2 && index2 < str.length) {
    if (str[index2] == ' ') {
      count++;
    }
    index2++;
  }
  return str.substring(index1, index2 - 1);
}

String? strToLowerCase(String? str) {
  // takes string argument str and returns with all the characters in it to lower case
  if (str == null) return null;
  return str.toLowerCase();
}

String? toMSExcelFunc(String? label1) {
  // export text label1 to microsoft excel
// This function cannot export text to Microsoft Excel directly, as it is a programming language and not a spreadsheet software. However, it can generate a CSV file that can be opened in Excel.

  // Create a list of data to export
  List<List<String>> data = [
    [label1 ?? ''],
  ];

  // Convert the data to CSV format
  String csv = data.map((row) => row.join(',')).join('\n');

  // Return the CSV data
  return csv;
}

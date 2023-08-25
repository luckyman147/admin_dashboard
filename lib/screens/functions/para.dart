String extractUsername(String email) {
  int atIndex = email.indexOf('@');
  if (atIndex != -1) {
    return email.substring(0, atIndex);
  } else {
    return email; // Return the whole email if "@" is not found
  }
}

String limitParagraphLength(String paragraph, int maxLength) {
  if (paragraph.length <= maxLength) {
    return paragraph; // Return unchanged if length is within limit
  }

  // Find the last space before the maxLength to preserve whole words
  int lastSpaceIndex = paragraph.lastIndexOf(' ', maxLength);

  if (lastSpaceIndex == -1) {
    // If there's no space within maxLength, truncate the text
    return paragraph.substring(0, maxLength);
  } else {
    return paragraph.substring(0, lastSpaceIndex);
  }
}

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}

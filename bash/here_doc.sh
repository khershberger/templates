#!/bin/bash
# Allows a block of text to be treated as a file

## Example 1
# Super basic
echo "Example 1:"
cat <<BASIC
Line 1
Line 2
BASIC

## Example 2
# From https://stackoverflow.com/a/1655389
# Reads multi-line text into single variable
echo "Example 2:"
read -r -d '' VAR <<-EOF
    Line1
	Line2
	EOF
echo "$VAR"

## Example 3
# From https://linuxhint.com/bash-heredoc-tutorial/
echo "Example 3:"
#Declare the function which will retrieve data from Here Document
BookInfo ()
{
  read ISBN
  read bookName
  read authorName
  read edition
  read publication
  read price
}
# Declare here document part to send data into the function
BookInfo <<ADDTEXT5
ISBN-78633567809
Easy Laravel 5
W. Jason Gilmore
9th Edition
Learpub
100
ADDTEXT5
# Print the value of the function variables after calculating price value with 10% discount
((price=$price-$price*10/100))
echo "$bookName"
echo "$authorName"
echo "$edition, $publication"
echo "$"$price
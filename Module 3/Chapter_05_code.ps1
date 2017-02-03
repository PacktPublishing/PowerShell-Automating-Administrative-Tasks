###################################################################
# Chapter 5 - Code File
###################################################################

###################################################################
# Example On How to use the "." and "\." expressions
###################################################################
# Match any character in string
"This Matches Any Character" –cmatch "."
# Match any character in string that is $null
"" –cmatch "."
# Match the Period in string
"This Matches Just The Period." –cmatch "\."
# Match the period – no periods exist.
"This Matches Nothing" –cmatch "\."


###################################################################
# Example On How to Replace leveraging a Regular Expression
###################################################################
"This is PowerShell." –replace "Power","a Turtle"


###################################################################
# Example On How to match a variety of different types of data in strings
###################################################################
# Match to Digit Characters
"0132465789" –cmatch "\d"
# Match to Non-Digit Characters
"This String Contains Word Characters" –cmatch "\D"
# Match to Word Characters
"This String Contains Words" –cmatch "\w"
# Match to Non-word Characters
"!!@#@##$" –cmatch "\W"
# Match to Space Characters
"This String Contains A Space" –cmatch "\s"
# Match to Non Space Characters
"ThisCannotContainSpaces" –cmatch "\S"


###################################################################
# Example On How to use ranges and the OR comparison to evaluate a string
###################################################################
# Match Uppercase O OR Lowercase u
"Domain\User23" –cmatch "(O|u)"
# Match Uppercase O OR Uppercase U
"Domain\User23" –cmatch "(O|U)"
# Match Lowercase a-u or Uppercase A-U
"Domain\User23" –cmatch "[a-uA-U]"
# Match Lowercase a-u or Uppercase A-U or numbers 2-3
"Domain\User23" –cmatch "[a-uA-U2-3]"


###################################################################
# Example On How to properly use the * metacharacter in an expression
###################################################################
# Match the Word "Domain" and a backslash
"Domain\User23" –cmatch "Domain.*\\.*"
# Match the Word "Domain" and a backslash
"Domain.com\User23" –cmatch "Domain.*\\.*"
# Match the Word "Domain" and a backslash 
"User23.Domain.com" –cmatch "Domain.*\\.*"


###################################################################
# Example On How touse the “+” metacharacter in an expression
###################################################################
# Match the Word "Domain" at least once. 
"Domain\User23" –cmatch "Domain+"
# Match the Word ".com" at least once.
"Domain\User23" –cmatch "\.com+"
# Match the Word "Domain.com" at least once and a backslash
"Domain.com\User23" –cmatch "Domain\.com+.*\\"


###################################################################
# Example On How to use the “?” metacharacter in an expression
###################################################################
# Match "Domain", optional "com", and a backslash
"Domain.com\User23" –cmatch "Domain.*(com)?\\"
# Match "Domain", optional "com", and a backslash
"Domain\User23" –cmatch "Domain.*(com)?\\"
# Match "Domain", optional "com", and a backslash
"Domain.comUser23" –cmatch "Domain.*(com)?\\"


###################################################################
# Example On How to use the { } quantifier in an expression
###################################################################
# Match exactly one "Domain” and exactly one backslash
"Domain\User23" –cmatch "Domain{1}.*\\{1}"
# Match exactly one "Domain” and exactly two backslashes
"Domain\User23" –cmatch "Domain{1}.*\\{2}"
# Match exactly one "Domain” and exactly one backslash
"User32.Domain.com" –cmatch "Domain{1}.*\\{1}"


###################################################################
# Example On How to use the ^ and $ metacharacters in an expression
###################################################################
# Match at the beginning, if the string contains a word.
"Successfully connected to Active Directory." –cmatch "^\w"
# Match at the end, if the string contains a word. (does not)
"Successfully connected to Active Directory." –cmatch "\w$"
# Match at the end, if the string doesn’t contain a word. 
"Successfully connected to Active Directory." –cmatch "\W$"
# Match at the beginning, it contains a word, match any characters in between, and match at the end, it doesn’t contain a word.
"Successfully connected to Active Directory." –cmatch "^\w.*\W$"


###################################################################
# Example On How to use the whole word evaluators in an expression
###################################################################
# Matches the whole word "to".
"Error communicating to Active Directory." –cmatch "\bto\b"
# Matches the whole word "to".
"Error communicating with Active Directory." –cmatch "\bto\b"
# Matches where the whole word "to" does not exist.
"Error communicating with Active Directory." –cmatch "\Bto\B"
# Matches where the whole word "to" does not exist.
"Error communicating with AD." –cmatch "\Bto\B"

###################################################################
# Example On How to Validate a MAC Address
###################################################################
"00:a0:f8:12:34:56" -match "^([0-9a-f]{2}:){5}[0-9a-f]{2}$"

###################################################################
# Example On How to Validate a UNC Path
###################################################################
"\\servername\Public\" -match "^\\{2}\w+\\{1}\w+"

###################################################################
# Example On How to Validate an ICANN US Phone Number
###################################################################
"+1.4141231234" –cmatch "^\+{1}[1]{1}\.{1}\d{10}$"
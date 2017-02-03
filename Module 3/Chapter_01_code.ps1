###################################################################
# Chapter 1 - Code File
###################################################################

###################################################################
#  Example On How to store a string in an array
###################################################################
$myString = "My String Has Multiple Words"
$myString 

###################################################################
#  Example On How to store a number in an array
###################################################################
$myNumber = 1
$myNumber

###################################################################
#  Example On How to Combine Two Strings
###################################################################
$a = "1"
$b = "2"
$c = $a + $b

###################################################################
#  Example On How to Add two numbers
###################################################################
$a = 1
$b = 2
$c = $a + $b

###################################################################
#  Example On storing an object in a variable, getting the object properties
###################################################################
$date = get-date
$date
$date | get-member

###################################################################
#  Example On How to View Object Properties and Invoke Methods
###################################################################
$date = get-date
$date.Year
$date.addyears("5")


###################################################################
#  Example On How to Create an Array
###################################################################
$myArray = "Example 1", "Example 2", "Example 3", "Example 4", "Example 5"
$myArray


###################################################################
#  Example On How to Obtain a single (first) value in an Array
###################################################################
$myArray = "Example 1", "Example 2", "Example 3", "Example 4", "Example 5"
$myArray[0]


###################################################################
#  Example On How to Create A Jagged Array and search the array
###################################################################
$myArray = ("Example 1","Red"), ("Example 2","Orange"), ("Example 3", "Yellow"), ("Example 4", "Green"), ("Example 5", "Blue")
$myArray[0][0]
$myArray[4][1]


###################################################################
#  Example On How to Update Array Values
###################################################################
$myArray = ("John","Doe"), ("Jane","Smith")
$myArray
$myArray[1][1] = "Doe"
$myArray


###################################################################
#  Example On How to Append data to an array
###################################################################
# Create the Array
$myArray = ("John","Doe"), ("Jane","Smith")
$myArray
# Append Data to the Array
$myArray += ("Sam","Smith")
$myArray


###################################################################
#  Example On How to Create a Hash Table
###################################################################
$users = @{"john.doe" = "jdoe"; "jane.doe" = "jdoe1"}
$users


###################################################################
#  Example On How to find a specific value in a Hash Table
###################################################################
$users = @{"john.doe" = "jdoe"; "jane.doe" = "jdoe1"}
$users["john.doe"]


###################################################################
#  Example On How to Add Values to A Hash table
###################################################################
$users = @{"john.doe" = "jdoe"; " jane.doe" = "jdoe1"}
$users
$users.add("John.Smith", "jsmith")
$users


###################################################################
#  Example On How to Update a Hash Value
###################################################################
$users = @{"john.doe" = "jdoe"; "jane.doe" = "jdoe1"}
$users
$users["jane.doe"] = "jadoe"
$users


###################################################################
#  Example On How to Remove A Hash Value
###################################################################
$users = @{"john.doe" = "jdoe"; "jane.doe" = "jdoe1"}
$users
$users.remove("Jane.Doe")
$users
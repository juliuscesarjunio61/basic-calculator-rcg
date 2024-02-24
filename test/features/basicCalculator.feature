@calculator
Feature: Basic Calculator

Scenario Outline: Calculating 2 numbers for each build "<Build>" and operation "<Operator>"
  Given I navigate to "https://testsheepnz.github.io/BasicCalculator.html#main-body"
  Then the homepage is displayed
  And I select "<Build>" in the build dropdown list
  And I enter "<number1NotValid>" in the first number textfield
  And I enter "<number2>" in the second number textfield
  And I select "<Operator>" in the operations dropwdown list
  And I click the calculate button
  And error message for number "1" is displayed
  And I enter "<number1>" in the first number textfield
  And I enter "<number2NotValid>" in the second number textfield
  And I click the calculate button
  And I enter "<number1>" in the first number textfield
  And I enter "<number2>" in the second number textfield
  And I click the calculate button
  And the integer checkbox is enabled
  And the answer is correct as "integer" for "<Operator>" operation of "<number1>" and "<number2>"
  And I click the calculate button
  And the answer is correct as "float" for "<Operator>" operation of "<number1>" and "<number2>"

Examples:
|Build    |Operator   |number1|number2|number1NotValid|number2NotValid|
|Prototype|Add        |1.1    |1      |qwerty         |asdf           |
|Prototype|Subtract   |2.1    |1      |qwerty         |asdf           |
|Prototype|Multiply   |2.1    |1      |qwerty         |asdf           |
|Prototype|Divide     |2.1    |1      |qwerty         |asdf           |
|1        |Add        |1.1    |1      |qwerty         |asdf           |
|1        |Subtract   |2.1    |1      |qwerty         |asdf           |
|1        |Multiply   |2.1    |1      |qwerty         |asdf           |
|1        |Divide     |2.1    |1      |qwerty         |asdf           |
|2        |Add        |1.1    |1      |qwerty         |asdf           |
|2        |Subtract   |2.1    |1      |qwerty         |asdf           |
|2        |Multiply   |2.1    |1      |qwerty         |asdf           |
|2        |Divide     |2.1    |1      |qwerty         |asdf           |
|3        |Add        |1.1    |1      |qwerty         |asdf           |
|3        |Subtract   |2.1    |1      |qwerty         |asdf           |
|3        |Multiply   |2.1    |1      |qwerty         |asdf           |
|3        |Divide     |2.1    |1      |qwerty         |asdf           |
|4        |Add        |1.1    |1      |qwerty         |asdf           |
|4        |Subtract   |2.1    |1      |qwerty         |asdf           |
|4        |Multiply   |2.1    |1      |qwerty         |asdf           |
|4        |Divide     |2.1    |1      |qwerty         |asdf           |
|5        |Add        |1.1    |1      |qwerty         |asdf           |
|5        |Subtract   |2.1    |1      |qwerty         |asdf           |
|5        |Multiply   |2.1    |1      |qwerty         |asdf           |
|5        |Divide     |2.1    |1      |qwerty         |asdf           |
|6        |Add        |1.1    |1      |qwerty         |asdf           |
|6        |Subtract   |2.1    |1      |qwerty         |asdf           |
|6        |Multiply   |2.1    |1      |qwerty         |asdf           |
|6        |Divide     |2.1    |1      |qwerty         |asdf           |
|7        |Add        |1.1    |1      |qwerty         |asdf           |
|7        |Subtract   |2.1    |1      |qwerty         |asdf           |
|7        |Multiply   |2.1    |1      |qwerty         |asdf           |
|7        |Divide     |2.1    |1      |qwerty         |asdf           |
|8        |Add        |1.1    |1      |qwerty         |asdf           |
|8        |Subtract   |2.1    |1      |qwerty         |asdf           |
|8        |Multiply   |2.1    |1      |qwerty         |asdf           |
|8        |Divide     |2.1    |1      |qwerty         |asdf           |

Scenario Outline: Calculating 2 numbers for each build "<Build>" and operation "<Operator>"
  Given I navigate to "https://testsheepnz.github.io/BasicCalculator.html#main-body"
  Then the homepage is displayed
  And I select "<Build>" in the build dropdown list
  And I select "<Operator>" in the operations dropwdown list
  And I enter "<number1>" in the first number textfield
  And I enter "<number2>" in the second number textfield
  And the integer checkbox is not displayed
  And I click the calculate button
  And the answer is correct for concatenation of "<number1>" and "<number2>"

Examples:
|Build    |Operator   |number1 |number2|number1NotValid|number2NotValid|
|Prototype|Concatenate|2.1aaa  |1bb    |qwerty         |asdf           |
|1        |Concatenate|2.1aaa  |1bb    |qwerty         |asdf           |
|2        |Concatenate|2.1aaa  |1bb    |qwerty         |asdf           |
|3        |Concatenate|2.1aaa  |1bb    |qwerty         |asdf           |
|4        |Concatenate|2.1aaa  |1bb    |qwerty         |asdf           |
|5        |Concatenate|2.1aaa  |1bb    |qwerty         |asdf           |
|6        |Concatenate|2.1aaa  |1bb    |qwerty         |asdf           |
|7        |Concatenate|2.1aaa  |1bb    |qwerty         |asdf           |
|8        |Concatenate|2.1aaa  |1bb    |qwerty         |asdf           |
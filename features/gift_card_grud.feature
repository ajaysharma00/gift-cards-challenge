# encoding: utf-8

Feature: Gift Cards GRUD
   
  Scenario: Create a gift card
    Given the user on the homepage
    When click on "Gift Cards"
      And click on "New Gift card"
      And type "Igor" on "Sender" label field
      And type "Paulo" on "Receiver" label field
      And type "Birthday gif" on "Description" label field
      And type "3.00" on "Value" label field
      And click on "Create Gift card" button
    Then must have a message "Gift card was successfully created."

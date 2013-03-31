# encoding: utf-8

Feature: Gift Cards GRUD
   
  Scenario: Create a gift card
    Given a user on the homepage
    When click on "Gift Carda"
      And click on "New Gift card"
      And type "Igor" on "Sender" field
      And type "Paulo" on "Receiver" field
      And type "Birthday gif" on "Description" field
      And type "3.00" on "Value" field
      And click on "Create Gift card" button
    Then must have a message "Gift card was successfully created."

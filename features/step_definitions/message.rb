# encoding: utf-8

Then /^must have a message "([^\"]*)"$/ do |message|
  GC.check_message @driver, message
end

module GC

  def self.check_message driver, message
    Message.new.check driver, message
  end

  class Message

    def check driver, message
      element = find driver
      fail(ArgumentError.new('Message invalid')) unless message.eql? inner_html( driver, element )
    end

    private

    def find driver
      driver.find_element(:id, 'notice')
    end

    def inner_html driver, selenium_element
      driver.execute_script("return arguments[0].innerHTML;", selenium_element)
    end

  end

end

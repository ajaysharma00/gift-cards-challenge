# encoding: utf-8

And /^click on "([^\"]*)" button$/ do |button_name|
  GC.click_on_button @driver, button_name
end

module GC

  def self.click_on_button driver, button_name
    Button.new.click driver, button_name
  end

  class Button

    def click driver, button_name
      button = find( driver, button_name )
      button.click
    end

    private

    def find driver, button_name
      button_found = nil

      inputs = driver.find_elements(:tag_name, "input")
      inputs.each do |input|
        button_found = input if button_name.eql? value( driver, input )
      end

      button_found
    end

    def value driver, selenium_element
      driver.execute_script("return arguments[0].value;", selenium_element)
    end

  end

end

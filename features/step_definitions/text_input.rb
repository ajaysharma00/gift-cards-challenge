# encoding: utf-8

And /^type "([^\"]*)" on "([^\"]*)" label field$/ do |content, label|
  GC.type_on_label @driver, content, label
end

module GC

  def self.type_on_label driver, content, label
    TextInput.new.type driver, content, label
  end

  class TextInput

    def type driver, content, label_name
      text_input = find_text_input driver, label_name
      text_input.send_keys content
    end

    private

    def find_text_input driver, label_name
      label = find_label driver, label_name
      driver.execute_script("el = arguments[0]; while (el.tagName != 'INPUT') { el = el.nextSibling }; return el;", label)
    end

    def find_label driver, label_name
      label_found = nil

      labels = driver.find_elements(:tag_name, "label")
      labels.each do |label|
        label_found = label if label_name.eql? inner_html( driver, label )
      end

      label_found
    end

    def inner_html driver, selenium_element
      driver.execute_script("return arguments[0].innerHTML;", selenium_element)
    end

  end

end

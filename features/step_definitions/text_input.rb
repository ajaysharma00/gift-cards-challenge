# encoding: utf-8

And /^type "([^\"]*)" on "([^\"]*)" field$/ do |content, label|
  GC.type_on_label @driver, content, label
end

module GC

  def self.type_on_label driver, content, text_input_label
    TextInput.new.type driver, content, text_input_label
  end

  class TextInput

    def type driver, content, text_input_label
      text_input = find_text_input driver, text_input_label
      text_input.send_keys content
    end

    private

    def find_text_input driver, text_input_label
      label = find_label driver, text_input_label
      driver.execute_script("el = arguments[0]; while (el.tagName != 'INPUT') { el = el.nextSibling }; return el;", label)
    end

    def find_label driver, label_name
      label_found = nil

      labels = driver.find_elements(:tag_name, "label")
      labels.each do |label|
        label_found = label if label_name.eql? Util.inner_html( driver, label )
      end

      label_found
    end

  end

end

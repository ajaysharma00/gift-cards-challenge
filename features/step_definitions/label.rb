# encoding: utf-8

And /^type "([^\"]*)" on "([^\"]*)" label field$/ do |content, label|
  GC.type_on_label @driver, content, label
end

module GC

  def self.type_on_label driver, content, label
    Label.new.type driver, content, label
  end

  class Label

    def type driver, content, label_name
      field = find driver, label_name
      field.send_keys content
    end

    private

    def find driver, label_name
      label_found = nil

      labels = driver.find_elements(:tag_name, "label")
      labels.each do |label|
        label_found = label if label_name.eq? inner_html (driver, label)
      end

      label_found
    end

    def inner_html driver, selenium_element
      driver.execute_script("return arguments[0].innerHTML;", selenium_element)
    end

  end

end

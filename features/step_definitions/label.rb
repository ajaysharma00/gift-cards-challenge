# encoding: utf-8

And /^type "([^\"]*)" on "([^\"]*)" label field$/ do |content, label|
  GC.type_on_label @driver, content, label
end

module GC

  def self.type_on_label driver, content, label
    Label.new.type driver, content, label
  end

  class Label

    def type driver, content, label
      field = find driver, label
      field.send_keys content
    end

    private

    def find driver, label
      nil
    end

  end

end

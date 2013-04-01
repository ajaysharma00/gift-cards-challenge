# encoding: utf-8

When /^click on "([^\"]*)"$/ do |link_name|
  sleep 1
  GC.click_on_link @driver, link_name
end

module GC

  def self.click_on_link driver, link_name
    Link.new.click driver, link_name
  end

  class Link

    def click driver, link_name
      link = find( driver, link_name )
      link.click
    end

    private

    def find driver, link_name
      driver.find_element(:link_text, link_name)
    end

  end

end

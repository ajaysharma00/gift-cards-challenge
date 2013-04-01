# encoding: utf-8

module GC

  class Util

    def self.inner_html driver, selenium_element
      driver.execute_script("return arguments[0].innerHTML;", selenium_element)
    end

  end

end

# encoding: utf-8

When /^ click on "([^\"]*)"$/ do |link_name|

end

module GC

  def self.link link_name
    Link.new.find link_name
  end

  class Link

    def find link_name

    end

  end

end

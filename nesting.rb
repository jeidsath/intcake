#!/usr/bin/env ruby

class NestError
end

class NestChecker
  @@matches = {
    "(" => ")",
    "{" => "}",
    "[" => "]",
  }

  def self.check_input(ss)
    begin
      check_input_internal ss
    rescue
      return false
    end
    true
  end

  def self.check_input_internal(ss)
    check = ""
    ii = 0
    while ii < ss.length do
      character = ss[ii]
      return [character, ii+1] if @@matches.values.include? character

      if @@matches.keys.include? character
        right_match, churned = check_input_internal ss[ii+1..ss.length]
        if @@matches[character] == right_match
          ii += churned
        else
          raise "NestError"
        end
      end

      ii = ii + 1
    end
  end

end

TESTS = ["{ [ ] ( ) }", "{ [ ( ] ) }", "{ [ }",  "{ [ ( ] ) }"]
TESTS.each{ |tt| puts "#{tt} result: #{NestChecker.check_input tt}" }

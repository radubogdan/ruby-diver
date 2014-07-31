require "diver/version"

# Add two new methods to the Hash class that will allow ad-hoc accesses
# of deeply nested structures
#
# Author: Radu-Bogdan Croitoru (mailto:croitoruradubogdan@gmail.com)
#
# License: MIT License. See LICENSE file.
#

class Hash

  # This function will pull out one value from a nested data structure.
  #
  # Example:
  #
  # x = {"a" => {"b" => "c"}}
  #
  # x.dive('a')
  #
  # Return: {"b" => "c"}
  #
  def dive(*args)
    args_list = args.flatten
    key = args_list.shift

    if key
      new_hash = self[key]
      new_hash.class == Hash ? new_hash.dive(args_list) : new_hash
    else
      self
    end
  end

  # This function will create a nested hash
  #
  # Example:
  #
  # x = {}
  #
  # x.diveSet('a','b','c')
  #
  # p x # {"a" => {"b" => "c"}}
  #
  def diveSet(*args)
    args_list = args.flatten
    return self if args_list.length == 0 || args_list[0] == "" || args_list.length == 1
    key = args_list.shift
    return self[key] = args_list[0] if args_list.length == 1
    self[key] = {} unless self.has_key?(key)
    self[key].diveSet(args_list)
  end
end

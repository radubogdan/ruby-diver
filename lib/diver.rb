require "diver/version"

class Hash
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

  def diveSet(*args)
    args_list = args.flatten
    return self if args_list.length == 0 || args_list[0] == "" || args_list.length == 1
    key = args_list.shift
    return self[key] = args_list[0] if args_list.length == 1
    self[key] = {} unless self.has_key?(key)
    self[key].diveSet(args_list)
  end

end

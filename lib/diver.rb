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
end

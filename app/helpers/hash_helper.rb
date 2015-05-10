module HashHelper

  # -------- #
  # - Hash - #
  # -------- #

  # Returns a specific value from the given hash (or the default value if not set).
  def get_value(key, hash, default_value = nil)
    value = hash.delete key
    value = default_value if value.nil? and !default_value.nil?
    value
  end

  # Removes and returns a specific value from the given hash (or the default value if not set).
  def pop_value(key, hash, default_value = nil)
    symbolize_keys hash unless hash.empty?
    get_value key.to_sym, hash, default_value
  end

  # all keys of the given hash symbolize.
  def symbolize_keys(hash)
    result = {}
    hash.each { |key, value| result[key.to_sym] = value }
    hash.replace result
  end
end

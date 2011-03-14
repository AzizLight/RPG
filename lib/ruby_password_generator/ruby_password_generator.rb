module RPG
  $algorithms = {}

  # -Class-Methods----------------------------------------------------------------
  def self.register(candidate, filepath = "")
    # apocalyse
    raise TypeError unless candidate.is_a?(Symbol) || candidate.is_a?(Hash)
    raise TypeError if candidate.is_a?(Symbol) && !filepath.is_a?(String)

    if candidate.is_a?(Hash)
      candidate.each do |c, f|
        raise ArgumentError unless File.exists?(File.join("lib", "ruby_password_generator", "algo", f) + ".rb")

        # NOTE: I should test the three lines below but I don't know how to
        load_algo(c, f)

        klass = get_class(c)
        unless klass.public_method_defined?(:generate) && klass.respond_to?(:identity)
          raise RuntimeError, "The #{c.to_s} algorithm needs a generate instance method and an identity class method!"
        end

        $algorithms[c] = c.to_s
      end
    elsif candidate.is_a?(Symbol)
      raise ArgumentError unless File.exists?(File.join("lib", "ruby_password_generator", "algo", filepath) + ".rb")
      load_algo(candidate, filepath)

      klass = get_class(candidate)
      unless klass.public_method_defined?(:generate) && klass.respond_to?(:identity)
        raise RuntimeError, "The #{candidate.to_s} algorithm needs a generate instance method and an identity class method!"
      end

      $algorithms[candidate] = candidate.to_s
    end

  end

  def self.registered?(algorithm)
    return $algorithms.include?(algorithm)
  end

  def self.list
    $algorithms
  end

  # -Instance-Methods---------------------------------------------------------------
  def self.version
    VERSION
  end

  private

  def self.load_algo(classname, filepath)
    RPG.autoload(classname, File.join("lib", "ruby_password_generator", "algo", filepath))
  end

  def self.get_class(klass)
    RPG.const_get(klass)
  end


end

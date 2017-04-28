class Definition
  attr_accessor(:meaning, :id)

  @@definitions = []

  define_method(:initialize) do |attributes|
    @meaning = attributes.fetch(:meaning)
    @id = @@definitions.length.+(1)
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:find) do |identification|
    matched_definition = nil
    @@definitions.each() do |definition|
      if definition.id() == identification.to_i
        matched_definition = definition
      end
    end
    matched_definition
  end
end

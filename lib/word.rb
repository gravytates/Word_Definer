class Word
  attr_accessor(:spelling, :id, :definitions)
  @@words = []

  define_method(:initialize) do |attributes|
    @spelling = attributes.fetch(:spelling)
    @id = @@words.length().+(1)
    @definitions = []
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_singleton_method(:find) do |identification|
    matched_word = nil
    @@words.each() do |word|
      if word.id() == identification.to_i
        matched_word = word
      end
    end
    matched_word
  end

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end
end

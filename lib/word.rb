class Word
  attr_accessor(:spelling, :picture, :id, :definitions)
  @@words = []
  @@just_words = []

  define_method(:initialize) do |attributes|
    @spelling = attributes.fetch(:spelling)
    @picture = attributes.fetch(:picture)
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

  define_singleton_method(:shuffle) do
    @@words.shuffle()
  end

  define_singleton_method(:sort) do |word|
    @@words.each() do |word|
      @@just_words.push(word.spelling())
    end
    @@just_words.sort!()
  end
end

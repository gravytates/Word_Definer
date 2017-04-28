require('rspec')
require('word')

describe(Word) do
  before() do
    Word.clear()
  end

  describe("#spelling") do
    it("will display a word") do
      test_word = Word.new({:spelling => 'frazzles'})
      expect((test_word.spelling)).to(eq("frazzles"))
    end
  end

  describe("#save") do
    it("adds a word to the array of saved words") do
      test_word = Word.new({:spelling => 'frazzles'})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved words") do
      Word.new({:spelling => 'frazzles'}).save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#id") do
    it('returns word id') do
      test_word = Word.new({:spelling => 'frazzles'})
      test_word.save()
      expect(test_word.id()).to(eq(1))
    end
  end

  describe(".find") do
    it('returns word by id') do
      test_word = Word.new({:spelling => 'frazzles'})
      test_word.save()
      test_word2 = Word.new({:spelling => 'jargon'})
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end
end

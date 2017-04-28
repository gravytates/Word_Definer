require('rspec')
require('definition')

describe(Definition) do
  before() do
    Definition.clear()
  end

  describe("#meaning") do
    it("will initialize a definition") do
      test_definition = Definition.new({:meaning => 'a state of mind where someone is disoriented and potentially hyper aware of their surroundings'})
      expect((test_definition.meaning)).to(eq("a state of mind where someone is disoriented and potentially hyper aware of their surroundings"))
    end
  end

  describe("#save") do
    it("will add a new definition to definitions array") do
     test_definition = Definition.new({:meaning => 'a state of mind where someone is disoriented and potentially hyper aware of their surroundings'})
     test_definition.save()
     expect((Definition.all)).to(eq([test_definition]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved definitions") do
      Definition.new({:meaning => 'a state of mind where someone is disoriented and potentially hyper aware of their surroundings'})
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns definition id') do
      test_definition = Definition.new({:meaning => 'a state of mind where someone is disoriented and potentially hyper aware of their surroundings'})
      test_definition.save()
      expect(test_definition.id()).to(eq(1))
    end
  end
end

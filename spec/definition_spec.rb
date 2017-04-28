require('rspec')
require('definition')

describe(Definition) do

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
end

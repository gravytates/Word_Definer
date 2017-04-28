require('rspec')
require('definition')

describe(Definition) do

  describe("#meaning") do
    it("will initialize a definition") do
      test_contact = Definition.new({:meaning => 'a state of mind where someone is disoriented and potentially hyper aware of their surroundings'})
      expect((test_contact.meaning)).to(eq("a state of mind where someone is disoriented and potentially hyper aware of their surroundings"))
    end
  end
end

require"rspec"
require_relative '../pizza'

describe Pizza do
  it "exists" do
    expect(Pizza).to be_a(Class)
  end

  describe '.initialize' do
    it 'records all of the toppings' do
      toppings = [
        Topping.new("mushrooms", vegetarian: true),
        Topping.new("pepperoni")
      ]
      pizza = Pizza.new(toppings)

      expect(pizza.toppings).to eq(toppings)
    end

    it 'defaults the toppings to cheese only, if the pizza has no toppings' do
      pizza = Pizza.new

      expect(pizza.toppings.size).to eq(1)
      expect(pizza.toppings.first.name).to eq('cheese')
    end
  end

  describe ".vegetarian?" do
    let(:toppings){[
        Topping.new("mushrooms", vegetarian: true),
        Topping.new("pepperoni")
      ]}
    let(:pizza){Pizza.new(toppings)}
    it "checks to see that all the toppings are vegetarian" do

      expect(pizza.vegetarian?).to eq(false)
    end
  end

  describe "add_topping" do
    let(:toppings){[
        Topping.new("mushrooms", vegetarian: true),
        Topping.new("pepperoni")
    ]}
    let(:pizza){Pizza.new(toppings)}
    it "accepts a topping and adds it to @toppings array" do
      new_topping = Topping.new("onions", vegetarian: true)
      pizza.add_topping(new_topping)

      expect(pizza.toppings.last).to eq(new_topping)
      expect(pizza.toppings.count).to eq(3)
    end
  end

end

describe Topping do
  it "exists" do
    expect(Topping).to be_a(Class)
  end

  describe '.initialize' do

    let(:topping) { Topping.new('olives') }
    it "sets the name of the topping" do
      # topping = Topping.new('olives')

      expect(topping.name).to eq('olives')
    end

    let(:vegetarian_topping) { Topping.new("bell peppers", vegetarian: true) }
    it "sets whether or not the topping is vegetarian" do
      # topping = Topping.new("bell peppers", vegetarian: true)

      expect(vegetarian_topping.vegetarian).to eq(true)
    end
  end
end

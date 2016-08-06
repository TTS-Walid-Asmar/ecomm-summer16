FactoryGirl.define do
  factory :product do
    sequence(:name) {|num| "##{num} Macbook"}
    price 1009.99
    description "Great laptop"
    stock 30
    promoted false
  end
end

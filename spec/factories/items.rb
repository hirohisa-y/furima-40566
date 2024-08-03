FactoryBot.define do
  factory :item do
    name                 {'test'}
    description          {'describe'} 
    category_id          {2} 
    condition_id         {3}
    delivery_charge_id   {3}
    prefecture_id        {3} 
    number_of_day_id     {2}
    price                {500}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

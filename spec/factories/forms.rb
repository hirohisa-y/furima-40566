FactoryBot.define do
  factory :form do
    post_code           {'123-4567'}
    prefecture_id       {3}
    municipality        {'test'}
    street_address      {4}
    telephone_number    {'11122223333'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end

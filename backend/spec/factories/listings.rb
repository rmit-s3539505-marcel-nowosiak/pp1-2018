FactoryGirl.define do
  factory :listing do
    title "MyString"
    body "MyText"
    published false
    min_salary ""
    max_salary 1.5
    location "MyString"
    req_skill_set nil
    add_skill_set nil
    hours "MyString"
    industry nil
    employer nil
  end
end

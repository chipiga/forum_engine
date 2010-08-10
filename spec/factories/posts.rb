# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :post do |f|
  f.topic nil
  f.user nil
  f.body "MyText"
  f.state "MyString"
end

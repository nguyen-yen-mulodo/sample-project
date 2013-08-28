#require 'faker'

FactoryGirl.define do 
  factory :user do |f| 
  f.name "User Test" 
  f.email "nguyen.yen@muludo.com"
  f.password "123456"
  f.password_confirm "123456" 
end 
end 
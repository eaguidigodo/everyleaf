FactoryBot.define do
  factory :user do
    username { "eaguidigodo" }
    email { "eaguidigodo@gmail.com" }
    password { "anicetenselme" }
  end

  factory :second_user, class: User do 
    username { "wunderkind" }
    email { "wunderkind@gmail.com" }
    password { "anicetenselme" }
    is_admin {"true"}
  end

  factory :third_user, class: User do 
    username { "nuxlikage" }
    email { "nuxlikage@gmail.com" }
    password { "anicetenselme" }
    is_admin {"false"}
  end
end

FactoryBot.define do
  factory :user do
    email {'test@gmail.com'}
    password {'password'}
    encrypted_password {Devise::Encryptor.digest(User, 'password')}
  end
end
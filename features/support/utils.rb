module Utils
  def first_name
    Faker::Name.first_name
  end

  def last_name
    Faker::Name.last_name
  end

  def birthdate
    Faker::Date.birthday
  end

  def numbers
    Faker::Number.between(from: 100, to: 150)
  end
end
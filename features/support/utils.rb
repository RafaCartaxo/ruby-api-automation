module Utils
  def first_name
    Faker::Name.first_name
  end

  def last_name
    Faker::Name.last_name
  end

  def numbers
    Faker::Number.between(from: 1, to: 2)
  end

end
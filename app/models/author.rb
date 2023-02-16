class Author < ApplicationRecord
  def coordinates
    [rand(90), rand(90)]
  end
  def full_name
    "#{first_name} #{last_name}"
  end
  def publication_years
    (1..rand(10)).to_a.map{ 1980 - rand(100) }
  end
end

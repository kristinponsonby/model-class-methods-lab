class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    # includes(boats: :classifications).where(classifications: {name: "Catamaran"})
    catamaran_operators = Captain.includes(boats: :classifications).where(classifications: {name: "Catamaran"})
  end

  def self.sailors
    # includes(boats: :classifications).where(classifications: {name: "Sailboat"}).distinct
    sailors = Captain.includes(boats: :classifications).where(classifications: {name: "Sailboat"}).distinct
  end

  def self.motorboat_operators
    # includes(boats: :classifications).where(classifications: {name: "Motorboat"})
    motorboat_operators = Captain.includes(boats: :classifications).where(classifications: {name: "Motorboat"})
  end

  def self.talented_seafarers
    # where("id IN (?)", self.sailors.pluck(:id) & self.motorboat_operators.pluck(:id))
    talented_seafarers = Captain.where("id IN (?)", self.sailors.pluck(:id) & self.motorboat_operators.pluck(:id))
  end

  def self.non_sailors
    # where.not("id IN (?)", self.sailors.pluck(:id))
    non_sailors = Captain.where.not("id IN (?)", self.sailors.pluck(:id))
  end

end

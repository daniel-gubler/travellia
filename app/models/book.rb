class Book
  include Mongoid::Document

  field :name
  has_many :jobs
end

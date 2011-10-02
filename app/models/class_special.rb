class ClassSpecial
  include Mongoid::Document

  field :level, :type => Integer
  
  embedded_in :job
  belongs_to :special
  accepts_nested_attributes_for :special
end

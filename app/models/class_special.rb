class ClassSpecial
  include Mongoid::Document

  field :level, :type => Integer
  
  embedded_in :job
  belongs_to :special
end

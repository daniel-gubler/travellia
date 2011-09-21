class Column
  include Mongoid::Document

  field :name
  embeds_many :rows
  embedded_in :job
  accepts_nested_attributes_for :rows
end

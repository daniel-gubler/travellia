class Row
  include Mongoid::Document

  field :value
  embedded_in :column
end

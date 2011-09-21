class Skill
  include Mongoid::Document

  ABILITIES = [ :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma ]

  field :name
  field :key_ability
  field :check_penalty, :type => Boolean
  field :untrained, :type => Boolean
  has_many :sub_skills, class_name: "Skill", inverse_of: :parent
  belongs_to :parent, class_name: "Skill", inverse_of: :sub_skills
  has_and_belongs_to_many :jobs, inverse_of: :class_skills
end

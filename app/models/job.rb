class Job
  include Mongoid::Document
  include Mongoid::Paperclip
  SAVES = [ :good, :average, :poor ]

  field :name
  field :prestige, :type => Boolean
  field :description
  field :hp, :type => Integer
  field :base_attack
  field :fortitude
  field :reflex
  field :will
  field :psionic, :type => Boolean
  field :divine, :type => Boolean
  field :arcane, :type => Boolean
  field :skill_points, :type => Integer
  field :max_level, :type => Integer
  has_mongoid_attached_file :avatar
  # has_mongoid_attached_file :avatar,
  # :path => ':avatar/:id/:style.:extension'
  # :styles => {
  #   :small => ['100x100#', :jpg]
  # }

  embeds_many :columns
  belongs_to :book, :inverse_of => :jobs
  has_and_belongs_to_many :class_skills, class_name: "Skill"
  embeds_many :class_specials
  accepts_nested_attributes_for :class_specials
  accepts_nested_attributes_for :columns

  def friendly_class_specials_for(i)
    specials = class_specials
      .where(:level => i)
      .map { |s| s.special.name }
    specials.join(', ')
  end

  def friendly_base_attack(i)
    base = 0
    if base_attack == :good.to_s
      base = i
    elsif base_attack == :average.to_s
      base = i*3/4
    else
      base = i/2
    end
    res = base.to_s
    while base >= 6
      base -= 5
      res += "/#{base}"
    end
    res
  end

  def friendly_save(talent, i)
    if(talent == :good.to_s)
      i/2 + 2
    else
      i/3
    end
  end
end

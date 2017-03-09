class User < ActiveRecord::Base
	has_one :account
  has_one :account_history, through: :account
  has_one :course
  accepts_nested_attributes_for :course 
  
  has_many :comments, as: :commentable

  # validates :name, presence: true
  # validates :mob_no, presence: true
  scope :active, -> { where(:status=> true) }
  scope :inactive, -> { where(:status=> false) }
  
  def self.to_csv
    CSV.generate do |csv|
      csv << ["User name", "User address"]
      all.each do |user|
        csv << [user.name, user.address]
      end
    end
  end
  
end

class User < ActiveRecord::Base
	has_one :account
  has_one :account_history, through: :account
  has_one :course
  accepts_nested_attributes_for :course, :allow_destroy => true, :reject_if  => :all_blank 
  
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


  def self.to_excel
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{ name address }
    all.each_with_index do |val, index|
      sheet1.row(index + 1).push val.name, val.address
    end
    book.write '/home/ror/Downloads/test123.xls'
  end

  
end

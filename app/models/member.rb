class Member < ActiveRecord::Base
  include EmailAddressChecker

  has_many :reservations, dependent: :destroy
  has_many :reviews

  attr_accessor :password, :password_confirmation
  attr_accessible :name, :address, :phone, :email, :login_id, :administrator, :password, :password_confirmation

  validates :name, presence: true
  validates :address, presence: true
  validates :phone, :format=>{:with=>/^[0-9-]/, :message=>"は半角数値と「-」だけ入力できます。", :allow_blank=>true}, uniqueness: true, presence: true
  validates :email, presence: true, uniqueness: true
  validates :login_id, presence: true, uniqueness: true
  validates :password, presence: { on: :create }, confirmation: { allow_blank: true }
  validate :check_email

  def check_email
    if email.present?
      errors.add(:email, :invalid) unless well_formed_as_email_address(email)
    end
  end

  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

  class << self
    def authenticate(login_id, password)
      member = find_by_login_id(login_id)
      if member && member.hashed_password.present? && BCrypt::Password.new(member.hashed_password) == password
        member
      else
        nil
      end
    end
  end
end

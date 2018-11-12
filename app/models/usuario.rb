class Usuario < ActiveRecord::Base
  has_many :protocolos

  has_many :tipo_vinculos, dependent: :destroy
  has_many :logs, :dependent => :destroy

  has_many :permitidos
  has_many :perfils, through: :permitidos

















=begin
  has_secure_password

  def self.authenticate(email, password)

    find_by(login: email).
        try(:authenticate, password)

  end

=end

end

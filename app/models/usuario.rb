class Usuario < ActiveRecord::Base
  has_many :protocolos

  has_many :tipo_vinculos
  has_many :logs

  has_many :permitidos, dependent: :destroy
  has_many :perfils, through: :permitidos

















=begin
  has_secure_password

  def self.authenticate(email, password)

    find_by(login: email).
        try(:authenticate, password)

  end

=end

end

class Usuario < ActiveRecord::Base
  has_many :protocolos

  has_secure_password

  def self.authenticate(email, password)

    find_by(login: email).
        try(:authenticate, password)

  end

end

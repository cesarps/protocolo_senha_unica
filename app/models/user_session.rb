class UserSession
  include ActiveModel::Model

  attr_accessor :login, :password
  validates_presence_of :login, :password

  def initialize(session, attributes={})
    @session = session
    @login = attributes[:login]
    @password = attributes[:password]
  end

  def authenticate!
    puts @login
    puts @password

    user = Usuario.authenticate(@login, @password)

    if user.present?
      store(user)
    else
      errors.add(:base, "Login ou senha inválida")
      false
    end
  end

  def store(user)
    @session[:user_id] = user.id
    @session[:user_nome] = user.nome
  end

  def current_user
    Usuario.find(@session[:user_id])
  end

  def user_signed_in?
    @session[:user_id].present?
  end

  def destroy
    @session[:user_id] = nil
  end

end

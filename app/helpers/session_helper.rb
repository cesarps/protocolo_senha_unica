module SessionHelper

  #cria uma sessão para o usuário
  def log_in(usuario)
    session[:usuario_id] = usuario.id
    session[:usuario_nome] = usuario.nome


  end

  #destroi a sessão criada na def anterior
  def log_out
    session.delete(:usuario_id)
    @current_user = nil
  end

  #busca um usuário cuja sessão não seja nula (ou seja, tem uma sessão marcada pelo usuario.id)
  def current_usuario
    @current_usuario ||= Usuario.find_by(id: session[:usuario_id])
  end

  # esta verifica se o usuario está logado, verificando se a função anterior está gerando um valor nulo, se estiver, é por que não está logado)
  def logged_in?
    !current_usuario.nil?
  end

end
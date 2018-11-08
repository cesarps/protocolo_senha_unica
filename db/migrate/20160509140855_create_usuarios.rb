class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :login
      t.string :password_digest

      t.timestamps null: false
    end
  end
end


=begin
Perfis → Admin, Professor, Pesquisador
Data da emissão da licença
Pdf (cópia do doc. de licença)
Data da validade
Login
Senha
Nome
Instituição
=end
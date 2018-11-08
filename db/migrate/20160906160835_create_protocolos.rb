class CreateProtocolos < ActiveRecord::Migration
  def change
    create_table :protocolos do |t|
      t.text :enviar_para
      t.text :observacao
      t.date :dt_expedicao
      t.integer :ano
      t.integer :codigo_protocolo

      t.timestamps null: false
    end
  end
end






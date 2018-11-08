class AddToUsuario < ActiveRecord::Migration
    def change
      add_column :protocolos, :usuario_id, :integer



    end


end

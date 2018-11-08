class Protocolo < ActiveRecord::Base
  belongs_to :usuario
  validates_presence_of :enviar_para
  validates_presence_of :observacao
end

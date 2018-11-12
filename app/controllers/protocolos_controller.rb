class ProtocolosController < ApplicationController
  before_action :set_protocolo, only: [:show, :edit, :update, :destroy]

  before_filter 'autenticado?'

  # GET /protocolos
  # GET /protocolos.json
  def index
    @protocolos = Protocolo.all
    respond_to do |format|
      format.html
      format.pdf { render_protocolos_list(@protocolos) }
      end
  end


  # GET /protocolos/1
  # GET /protocolos/1.json
  def show
  end

  # GET /protocolos/new
  def new
    @protocolo = Protocolo.new

  end

  # GET /protocolos/1/edit
  def edit
  end


  # POST /protocolos
  # POST /protocolos.json
  def create

    @protocolo = Protocolo.new(protocolo_params)

    @protocolo.usuario_id = current_user.id

    if Protocolo.all.count == 0
      @protocolo.codigo_protocolo = 1
    else
        lastprotocolo = Protocolo.last!

         if lastprotocolo.created_at.year < Date.today.year
            @protocolo.codigo_protocolo = 1
          else
            @protocolo.codigo_protocolo = lastprotocolo.codigo_protocolo + 1
          end
    end

    @protocolo.ano = Date.today.year
    @protocolo.dt_expedicao = Date.today

    respond_to do |format|
      if @protocolo.save
        format.html { redirect_to @protocolo, notice: 'Protocolo foi criado.' }
        format.json { render :show, status: :created, location: @protocolo }
      else
        format.html { render :new }
        format.json { render json: @protocolo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /protocolos/1
  # PATCH/PUT /protocolos/1.json
  def update
    respond_to do |format|
      if @protocolo.update(protocolo_params)
        format.html { redirect_to @protocolo, notice: 'Protocolo foi atualizado.' }
        format.json { render :show, status: :ok, location: @protocolo }
      else
        format.html { render :edit }
        format.json { render json: @protocolo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /protocolos/1
  # DELETE /protocolos/1.json
  def destroy
    @protocolo.destroy
    respond_to do |format|
      format.html { redirect_to protocolos_url, notice: 'Protocolo foi apagado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_protocolo
      @protocolo = Protocolo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def protocolo_params
      params.require(:protocolo).permit(:enviar_para, :observacao, :dt_expedicao, :ano, :codigo_protocolo)
    end

     def render_protocolos_list(protocolos)
    protoc = protocolos::Report.new layout: File.join(Rails.root, 'app', 'reports', 'protocolos.tlf')

    protocolos.each do |protocolos|
      report.list.add_row do |row|
        row.values name: protocolos.usuario.nome
        row.item(:name).style(:color, 'red') unless protocolos.done?
      end
    end

    send_data report.generate, filename: 'protoc.pdf',
              type: 'application/pdf',
              disposition: 'attachment'
  end
end


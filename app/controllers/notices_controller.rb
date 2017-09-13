class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

  # GET /notices
  # GET /notices.json
  def index
    Notice.crawling
    @notices = Notice.all.reverse
    
  end

  # GET /notices/1
  # GET /notices/1.json
  def show
  end

  # GET /notices/new
  def new
    @notices = Notice.new
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  # POST /notices.json
  def create
    @notices = Notice.new(params[:notices])

    respond_to do |format|
      if @notices.save
        format.html { redirect_to @notices, notice: 'Notice was successfully created.' }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new }
        format.json { render json: @notices.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if @notices.update(params[:notice])
        format.html { redirect_to @notices, notice: 'Notice was successfully updated.' }
        format.json { render :show, status: :ok, location: @notices }
      else
        format.html { render :edit }
        format.json { render json: @notices.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @notices.destroy
    respond_to do |format|
      format.html { redirect_to notices_url, notice: 'Notice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notices = Notice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notice_params
      params.require(:notice).permit(:title, :link, :writer, :created_on)
    end
end

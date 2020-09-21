class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
    @emails = Email.all
    @email = Email.find(params[:id])
    @email.update(read: true)
    respond_to do |format|
      format.html {
        render :index, notice: 'Email was successfully created.'
      }
      format.js { }
    end
  end

  # GET /emails/new
  def new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  # POST /emails.json
  def create
    @emails = Email.all
    @email = Email.new(object: Faker::Books::Dune.character, body: Faker::Lorem.paragraphs, read: false)
    if @email.save
      respond_to do |format|
        format.html {
          render :index, notice: 'Email was successfully created.'
        }
        format.js { }
      end
    else
      redirect_to root_path
    end
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    @emails = Email.all
    @email.update(read: !@email.read)
    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Email was successfully updated.' }
      format.js { }
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Email was successfully destroyed.' }
      format.js { }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_email
    @email = Email.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def email_params
    params.require(:email).permit(:object, :body, :read)
  end
end

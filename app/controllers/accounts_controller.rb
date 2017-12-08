require 'net/http'
require 'net/https'
require 'uri'
require 'mpesa_connect'
class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
     key = 'xqNsAltUrvvaC8hFas9x1Z8r83KbLDkS'
    secret = 'FRSQmM18JfSsnNs1'
    security_password = 'Safaricom583!'
    initiator = 'testapi'
    amount = 200
    party_a = '600583'
    party_b = '254708374149'
    client = MpesaConnect::Client.new(key, secret, security_password)
    client.b2c_transaction(initiator, amount, party_a, party_b)
      @notifications = current_user.notifications.order('created_at DESC').limit(3)
     @transactions = Transaction.where(to_id: current_user.id).order('created_at DESC').limit(5)
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   #Generate mpesa token
   def generateTokken

    uri = URI('https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials')

  http = Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https',
  :verify_mode => OpenSSL::SSL::VERIFY_NONE)



  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth 'xqNsAltUrvvaC8hFas9x1Z8r83KbLDkS', 'FRSQmM18JfSsnNs1'

  response = http.request request # Net::HTTPResponse object
 @token = JSON.parse(response.body)['access_token']
 puts @token
end
  #STK Push
  def sthpush
  @token = generateTokken
uri = URI('https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest')

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(uri)
request["accept"] = 'application/json'
request["content-type"] = 'application/json'
request["authorization"] ="Bearer @token"
request.body = "{\"BusinessShortCode\": \"970117\",
  \"Password\": \" \",
  \"Timestamp\": \"Time.now\",
  \"TransactionType\": \"CustomerPayBillOnline\",
  \"Amount\": \"200 \",
  \"PartyA\": \" 254714703966\",
  \"PartyB\": \" 970117\",
  \"PhoneNumber\": \"254714703966 \",
  \"CallBackURL\": \"https://ip_address:port/callback\",
  \"AccountReference\": \"1234 \",
  \"TransactionDesc\": \"pay \"}"

response = http.request(request)
puts response.read_body
    
  end
 
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:user_id, :balance, :meta, :meta_name)
    end
end

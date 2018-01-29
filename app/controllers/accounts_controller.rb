require 'net/http'
require 'net/https'
require 'uri'
require 'mpesa_connect'
require 'json'
class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end
def scrape

  
 tmobilenumber = "#{current_user.mobilenumber}".to_i
 password = "lostitems2017"
 code = 307522
uri = URI('https://api.safaricom.co.ke/mpesa/b2c/v1/paymentrequest')

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
request = Net::HTTP::Get.new(uri)
request["accept"] = 'application/json'
request["content-type"] = 'application/json'
request["authorization"] = "Bearer #{generateTokken}"
request.body = { "InitiatorName" => "#{current_user.first_name} #{current_user.second_name}",
 "SecurityCredential" => Base64.encode64(["#{code}", "#{password}"].join),
  "CommandID" => "SalaryPayment",
  "Amount" => "#{current_user.account.balance}",
  "PartyA" => "307522",
  "PartyB"=>  "254#{tmobilenumber}",
  "Remarks" => "ok",
  'QueueTimeOutURL' => 'http://lostitems.co.ke:5000/b2c/queue',
  'ResultURL' => 'http://lostitems.co.ke:5000/b2c/result',
  "Occasion" => "ok"}.to_json

response = http.request(request)
puts request.body

puts response.body
end
  # GET /accounts/1
  # GET /accounts/1.json
  def show
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
def generateTokken
  uri = URI('https://api.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials')
  http = Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https',
  :verify_mode => OpenSSL::SSL::VERIFY_NONE)



  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth 'PfLuMoTfVLgf6DGXb21fAD9J1O7Jjecc', 'Yxjer0vFxnBldjyZ'

  response = http.request request # Net::HTTPResponse object
 puts token = JSON.parse(response.body)['access_token']

end
  private
   #Generate mpesa token
   
  #STK Push
  def paybc

uri = URI('https://api.safaricom.co.ke/mpesa/b2c/v1/paymentrequest')

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(uri)
request["accept"] = 'application/json'
request["content-type"] = 'application/json'
request["authorization"] = "Bearer #{generateTokken}"
request.body = "{\"InitiatorName\":\" current_user.name\",
  \"SecurityCredential\":\" \",
  \"CommandID\":\"SalaryPayment \",
  \"Amount\":\"1000\",
  \"PartyA\":\"307552 \",
  \"PartyB\":\"@current_user.phone_number\",
  \"Remarks\":\" ok\",
  \"QueueTimeOutURL\":\"http://your_timeout_url\",
  \"ResultURL\":\"http://your_result_url\",
  \"Occasion\":\" ok\"}"

response = http.request(request)
puts response.body
    
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

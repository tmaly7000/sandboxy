class DatarequestController < ActionController::Base

  def test_auth

    _response = format_error("Not Authorized", 100)

    # credential string: user:pswd
    if valid_credentials(request.headers['Auth123'])
      _response = valid_request(request.raw_post)
    end
    respond_to do |format|
      format.xml { render :xml => "#{_response}" }
      format.any  {render :text => "Only JSON and XML are currently supported"}
    end

  end

  private

  def valid_request(xml)

    rv = format_error("Bad Request", 200)
    if xml && !xml.empty?
       rv = "Ok"
    end
    rv

  end

  def valid_credentials(cred_token)

    rv = false
    if cred_token && !cred_token.empty?
      creds = cred_token.split(':')
      if creds && creds.count == 2
        rv = true
      end
    end
    rv

  end

  def format_error(msg, code)
    xm = ::Builder::XmlMarkup.new
    xm.error("code" => "#{code}") { |x| msg }
  end
end

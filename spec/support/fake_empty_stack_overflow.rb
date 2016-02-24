require 'sinatra/base'

class FakeEmptyStackOverflow < Sinatra::Base
  get '/*' do
    xml_response 200, ""
  end
end

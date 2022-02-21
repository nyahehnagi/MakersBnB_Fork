# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
# Maker House a Home
class Mahah < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'OK LESSSS GOOOO'
  end

  run! if app_file == $PROGRAM_NAME
end

#!/usr/bin/env ruby
# encoding: utf-8
#

require 'rubygems'
require 'bundler/setup'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/cors'

class App < Sinatra::Application

    configure do
        set :public_folder, __dir__ + '/frontend/dist'
    end

    configure :development do
        register Sinatra::Reloader
        register Sinatra::Cors
        set :allow_origin, "*"
        set :allow_methods, "GET,HEAD,POST"
    end

    configure :production do
    end

    helpers do
    end

    before do
        content_type 'application/json'
    end

    error do
        { message: env['sinatra.error'].message }.to_json
    end

    get '/healthz' do
        'OK'
    end

    get '/api/hello' do
      { message: 'hello' }.to_json
    end


    get '*' do
        content_type 'html'
        send_file settings.public_folder + '/index.html'
    end
end

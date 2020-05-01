class SongsController < ApplicationController

    get "/songs/new" do 
        if !logged_in? 
            redirect to "users/login"
        end
        erb :"songs/new"
    end
end
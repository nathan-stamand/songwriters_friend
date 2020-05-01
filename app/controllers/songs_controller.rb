class SongsController < ApplicationController

    get "/songs/new" do 
        if !logged_in? 
            redirect to "users/login"
        end
        erb :"songs/new"
    end

    post "/songs/new" do 
        if !logged_in?
            redirect to "/users/login"
        end
        @user = current_user 
        @title = params[:title]
        @tempo = params[:tempo][:estimate_tempo]
        exact_tempo = params[:tempo][:exact_tempo]

        if @tempo.length == 0
            @tempo = exact_tempo 
        end

        @time_sig = params[:time_signature]
        @key_sig = params[:key_signature][:letter] + params[:key_signature][:sharp_flat] + ' ' + params[:key_signature][:maj_min]
        @co_authors = params[:co_authors]
        @lyrics = params[:lyrics].gsub("\r\n", ' / ')
        time = Time.new
        @date = time.ctime

        @song = Song.create(title: @title, tempo: @tempo, time_signature: @time_sig, key_signature: @key_sig, co_authors: @co_authors, lyrics: @lyrics, date_created: @date)
        @user.songs << @song 
        @user.save
        
        
    end

end
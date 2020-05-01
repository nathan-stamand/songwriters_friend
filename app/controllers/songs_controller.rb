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
        @lyrics = params[:lyrics]
        time = Time.new
        @date = time.ctime

        @song = Song.create(title: @title, tempo: @tempo, time_signature: @time_sig, key_signature: @key_sig, co_authors: @co_authors, lyrics: @lyrics)
        @user.songs << @song 
        @user.save
        
        redirect to "/songs/#{@song.id}"
    end

    delete "/songs/:id/delete" do
        @song = Song.find_by(id: params[:id])
        if !logged_in?
            redirect to "/users/login"
        elsif current_user.id != @song.user.id
            redirect to "/users/#{current_user.id}"
        end
        @song.destroy 
        redirect to "/users/#{current_user.id}"
    end

    get "/songs/:id" do 
        @song = Song.find_by(id: params[:id])
        @song_creator = @song.user 
        @user = current_user 
        @lyrics = @song.lyrics.split("\r\n")
        
        erb :"songs/show"
    end

    get "/songs/:id/edit" do 
        if !logged_in? 
            redirect to "/users/login"
        end
        @song = Song.find_by(id: params[:id])
        if current_user.id == @song.user.id
            erb :"songs/edit"
        else 
            redirect to "/users/#{current_user.id}" 
        end
    end

    patch "/songs/:id/edit" do 
        @song = Song.find_by(id: params[:id])
        if !logged_in? || current_user.id != @song.user.id
            redirect to "/users/login"
        end 
        @title = params[:title]
        @date = @song.date_created
        @tempo = params[:tempo][:estimate_tempo]
        exact_tempo = params[:tempo][:exact_tempo]

        if @tempo.length == 0
            @tempo = exact_tempo 
        end
        @time_sig = params[:time_signature]
        @key_sig = params[:key_signature][:letter] + params[:key_signature][:sharp_flat] + ' ' + params[:key_signature][:maj_min]
        @co_authors = params[:co_authors]
        @lyrics = params[:lyrics]

        @song.update(title: @title, tempo: @tempo, time_signature: @time_sig, key_signature: @key_sig, co_authors: @co_authors, lyrics: @lyrics, date_created: @date)
        @song.save
        
        redirect to "/songs/#{@song.id}"
    end

end
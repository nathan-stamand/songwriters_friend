class UsersController < ApplicationController

    get "/users/signup" do
        if !!current_user 
            redirect to "/users/#{current_user.id}"
        end
        erb :"users/new"
    end

    post "/users/signup" do 
        @username = params[:username]
        @email = params[:email]
        @password = params[:password]
        if !@username || !@email || !@password 
            redirect to '/users/signup'
        else 
            User.all.each do |user|
                if user.username == @username || user.email == @email 
                    redirect to '/users/login'
                end 
            end
            user = User.create(params)
            session[:user_id] = user.id
            redirect to "/users/#{@user.id}"
        end
    end 

    get "/users/login" do 

    end 

    post "/users/login" do 

    end

    get "/users/logout" do 

    end

    get "/users/:id" do 

    end

    post "/users/:id" do 

    end 

    patch "/users/:id/edit" do 

    end

    delete "/users/:id/delete" do 

    end

end
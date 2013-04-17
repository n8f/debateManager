class DebaterController < ApplicationController
    #except and only
    before_filter :handle_login_permissions, :except => [:login_form, :do_login]
    before_filter :handle_admin_permissions, :except => [:login_form, :do_login, :home, :edit_myself_form, :edit_myself, :logout]

    #Root Menus
    def home()
        #define debater
        @debater = session[:debater]
    end
    def display_all_debaters()
        @all_debaters = Debater.find(:all)
    end


    #Admin methods
    def edit_debater_form()
        @debater = Debater.find(params[:id])
    end
    def edit_debater()
        if(!handle_admin_permissions) then return;end
        @debater = Debater.find(params[:id])
        @debater.update_attributes(params[:debater])
        redirect_to(:controller => :debater, :action => :display_all_debaters)
    end
    def delete_debater()
        if(!handle_admin_permissions) then return;end
        Debater.delete(params[:id])
        redirect_to(:controller => :debater, :action => :display_all_debaters)
    end
    def toggle_admin()
        if(!handle_admin_permissions) then return;end
        @debater = Debater.find(params[:id])
        @debater.toggle_admin
        redirect_to(:action => :display_all_debaters)
    end
    def add_debater_form()
        #if(!handle_admin_permissions) then return;end
        #all in view
    end
    def add_debater()
        if(!handle_admin_permissions) then return;end
        @debater = Debater.create(params[:debater])
        DebaterAdmin.create(:debater_id => @debater.id, :admin => false) #add association
        redirect_to(:controller => :debater, :action => :display_all_debaters)
    end

    #user methods
    def edit_myself_form()
        if(!handle_login_permissions) then return;end
        @debater = session[:debater]
    end
    def edit_myself()
        @debater = session[:debater]
        @debater.update_attributes(params[:debater])
        redirect_to(:controller => :debater, :action => :home)
    end
    
    #check login
    def login_form()
        #everything in view except...
        @message = params[:message]
    end
    def do_login()
        @debater = Debater.find(:first, :conditions => ["email=? and password=?",params[:debater][:email],params[:debater][:password]])
        if(@debater != nil) #IF we found a row
            #save this logon as a data structure in the session.
            session[:debater] = @debater

            #send the user on their way
            if(@debater.is_admin)
                redirect_to(:controller => :debater, :action => :display_all_debaters)
            else
                redirect_to(:controller => :debater, :action => :home)
            end
        else
            redirect_to(:controller => :debater, :action => :login_form, :message => "Error: Invalid Login")
        end
    end
    def logout()
        session.delete
        redirect_to(:controller => :debater, :action => :login_form, :message => "Logged out successfully")
    end
end

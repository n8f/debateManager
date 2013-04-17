class CardController < ApplicationController
     before_filter :handle_login_permissions
    
    def handle()
        handle_login_permissions
    end
    
    def display_all_cards()
        @cards = Card.find(:all)
    end
    def add_card_form()
    end
    def add_card()
        @card = Card.create(params[:card])
        redirect_to(:action => :display_all_cards)
    end
    def edit_card_form()
        @card = Card.find(params[:id])
    end
    def edit_card()
        @card = Card.find(params[:id])
        @card.update_attributes(params[:card])
        @card.save
        redirect_to(:action => :display_all_cards)
    end
    def delete_card()
        Card.delete(params[:id])
        redirect_to(:action => :display_all_cards)
    end
end

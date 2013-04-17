class SectionController < ApplicationController
     before_filter :handle_login_permissions
    
    def display_all_sections()
        @sections = Section.find(:all)
    end

    def add_section()
        @section = Section.create(params[:section])
        redirect_to(:action => :display_all_sections)
    end

    def edit_section_form()
        @section = Section.find(params[:id])
    end
    def edit_section()
        @section = Section.find(params[:id])
        @section.update_attributes(params[:section])
        @section.save
        redirect_to(:action => :display_all_sections)
    end

    def delete_section()
        Section.delete(params[:id])
        redirect_to(:action => :display_all_sections)
    end

    def add_card_to_section_form()
        @section = Section.find(params[:id])

        all_cards = Card.find(:all)
        @card_select = all_cards.map do |card|
            [card.tag + " " + card.cite, card.id]
        end
    end
    def add_card_to_section()
        section_id = params[:id].to_i
        card_id    = params[:card_id].to_i

        SectionCard.create(:card_id => card_id, :section_id => section_id)
        redirect_to(:action => :display_all_sections)
    end
    def remove_card()
        section_id = params[:section_id].to_i
        card_id    = params[:card_id].to_i

        SectionCard.delete_all(["section_id=? and card_id=?",section_id,card_id])
        redirect_to(:action => :show_section_summary, :id => section_id)
    end

    def show_section_summary()
        @section = Section.find(params[:id])
        @file_id = nil
    end
    def show_section()
        @section = Section.find(params[:id])
        @file_id = nil
    end
end

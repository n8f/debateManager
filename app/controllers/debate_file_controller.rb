class DebateFileController < ApplicationController
    before_filter :handle_login_permissions
    #after_filter :to_home, :only => [:add_file, :edit_file, :delete_file, :add_section, :remove_section]

    def display_all_files
        @debate_files = DebateFile.find(:all)
    end
    def to_home
        redirect_to(:action => :display_all_files)
    end

    def add_file
        DebateFile.create(params[:debate_file])
        redirect_to(:action => :display_all_files)
    end
    def edit_file_form
        @debate_file = DebateFile.find(params[:id])
    end
    def edit_file
        @debate_file = DebateFile.find(params[:id])
        @debate_file.update_attributes(params[:debate_file])
        redirect_to(:action => :display_all_files)
    end
    def delete_file
        DebateFile.delete(params[:id])
         redirect_to(:action => :display_all_files)
    end

    def add_section_to_file_form
        all_sections = Section.find(:all)
        @debate_file = DebateFile.find(params[:id])

        all_sections = Section.find(:all)
        @section_select = all_sections.map do |section|
            [section.title, section.id]
        end
    end
    def add_section_to_file
        FileSection.create(:section_id => params[:section_id], :debate_file_id => params[:id])
        redirect_to(:action => :display_all_files)
    end
    def remove_section_from_file
        FileSection.delete_all(["section_id=? and debate_file_id=?",params[:section_id], params[:debate_file_id]])
        redirect_to(:action => :show_file_summary, :id => params[:debate_file_id])
    end


    def show_file_summary
        @debate_file = DebateFile.find(params[:id])
        @file_id = @debate_file.id
    end
    def show_file
        @debate_file = DebateFile.find(params[:id])
    end
end

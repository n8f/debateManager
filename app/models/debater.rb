class Debater < ActiveRecord::Base
    has_one(:debater_admin)

    def is_admin()
        return self.debater_admin.admin
    end

    def toggle_admin()
        self.debater_admin.admin = !self.debater_admin.admin
        self.debater_admin.save
    end
end

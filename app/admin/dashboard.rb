ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

    content title: proc{ I18n.t("active_admin.dashboard") } do
    

    section "Spinoffs" do
        table_for User.order("created_at desc").limit(10) do
            column :username
            column :email
            column :created_at
            column :subscribed, :sortable => :subscribed
    end
        strong { link_to "View All Users", admin_users_path }
        end
    end
end
 


ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Available DBs" do
          ul(class: "list-none") do
            li link_to("Categories", admin_categories_path)
            li link_to("Communities", admin_communities_path)
            li link_to("Contests", admin_contests_path)
            li link_to("Courses", admin_courses_path)
            li link_to("Dislikes", admin_dislikes_path)
            li link_to("Education Histories", admin_education_histories_path)
            li link_to("Employment Details", admin_employment_details_path)
            li link_to("Forum Polls", admin_forum_polls_path)
            li link_to("Forums", admin_forums_path)
            li link_to("Friendships", admin_friendships_path)
            li link_to("Groups", admin_groups_path)
            li link_to("Institutes", admin_institutes_path)
            li link_to("Meeting Rooms", admin_meeting_rooms_path)
            li link_to("Paypal Details", admin_paypal_details_path)
            li link_to("Posts", admin_posts_path)
            li link_to("Profiles", admin_profiles_path)
            li link_to("Replies", admin_replies_path)
            li link_to("Reveal Identities", admin_reveal_identities_path)
            li link_to("Specializations", admin_specializations_path)
            li link_to("Subscriptions", admin_subscriptions_path)
            li link_to("Topics", admin_topics_path)
            li link_to("Uploads", admin_uploads_path)
            li link_to("User Skills", admin_user_skills_path)
            li link_to("Users Categories", admin_users_categories_path)

          end
        end
      end
    end
  end
end
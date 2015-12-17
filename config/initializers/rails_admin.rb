RailsAdmin.config do |config|

  # config.authorize_with do
  #   authenticate_or_request_with_http_basic('Login required') do |username, password|      
  #     if current_user.nil? || !current_user.email.eql?("admin@example.com")
  #       username=''
  #       password=''
  #     else
  #       username == Rails.application.secrets.user &&
  #       password == Rails.application.secrets.password
  #     end
  #   end
  # end
   
  # config.current_user_method(&:current_admin) 
  
  ### Popular gems integration
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)
  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)
  #App name
  config.main_app_name = ["Community Forum"]
  ## == Cancan ==
  # config.authorize_with :cancan
  #Excluded Models
  config.excluded_models = ["Attachment","Authenticate","Categorable","Conversation","Following","Like","Message","Notification","Organisation","Skill","Vote"]
  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  
  config.model User do
    list do
      field :id
      field :email
      field :screen_name
      field :first_name
      field :last_name
    end
    edit do
      field :email
      field :password
      field :password_confirmation
      field :screen_name
      field :first_name
      field :last_name
    end
  end

  config.model Category do
    list do
      field :id
      field :name
      field :user
      field :image
    end
    edit do
      field :name
      field :user
      field :image
    end
  end

  config.model Profile do
    list do
      configure :created_at do
        hide
      end
      configure :updated_at do
        hide
      end
    end
    edit do
      configure :created_at do
        hide
      end
      configure :updated_at do
        hide
      end
    end
  end

  config.model Community do
    list do
      configure :members do
        hide
      end
    end
    edit do
      configure :members do
        hide
      end
    end
  end

  config.model Course do
    list do
      configure :education_histories do
        hide
      end
    end
    edit do
      configure :education_histories do
        hide
      end
    end
  end
  
  config.model Forum do
    list do
      configure :comments do
        hide
      end
      configure :topics do
        hide
      end
    end
    edit do
      configure :comments do
        hide
      end
      configure :topics do
        hide
      end
    end
  end

   config.model Group do
    list do
      configure :members do
        hide
      end
    end
    edit do
      configure :members do
        hide
      end
    end
  end

  config.model Institute do
    list do
      configure :education_histories do
        hide
      end
    end
    edit do
      configure :education_histories do
        hide
      end
    end
  end

  config.model MeetingRoom do
    list do
      configure :comments do
        hide
      end
    end
    edit do
      configure :comments do
        hide
      end
    end
  end

  config.model Post do
    list do
      configure :created_at do
        hide
      end
      configure :updated_at do
        hide
      end
      configure :dislikes do
        hide
      end
      configure :comments do
        hide
      end
    end
    edit do
      configure :created_at do
        hide
      end
      configure :updated_at do
        hide
      end
      configure :dislikes do
        hide
      end
      configure :comments do
        hide
      end
    end
  end

  config.model Specialization do
    list do
      field :id
      field :name
    end
    edit do
      field :name
    end
  end
  # config.model AdminUser do
  #   list do
  #     field :email
  #     field :current_sign_in_at
  #     field :sign_in_count
  #     field :created_at
  #   end
  #   edit do
  #     field :email
  #     field :password
  #     field :password_confirmation
  #   end
  # end

  # config.model Category do
  #   list do
  #     field :name
  #     field :created_at
  #     field :updated_at
  #   end
  #   edit do
  #     field :name
  #   end
  # end

  # config.model Course do
  #   list do
  #     field :name
  #     field :created_at
  #     field :updated_at
  #   end
  #   edit do
  #     field :education_history, :belongs_to_association
  #     field :name
  #   end
  # end

  # config.model EducationHistory do
  #   list do
  #     field :created_at
  #     field :updated_at
  #   end
  #   edit do
  #     field :name
  #   end
  # end

  # config.model EmploymentDetail do
  #   list do
  #     field :total_experience
  #     field :created_at
  #     field :updated_at
  #   end
  #   edit do
  #     field :user, :belongs_to_association
  #     field :total_experience
  #   end
  # end

  # config.model ForumPoll do
  #   list do
  #     field :topic
  #     field :body
  #     field :visibility
  #     field :start_date
  #     field :end_date
  #     field :created_at
  #     field :updated_at
  #     field :attachment
  #   end
  #   edit do
  #     field :category, :belongs_to_association
  #     field :topic, :belongs_to_association
  #     field :body
  #     field :visibility
  #     field :start_date
  #     field :end_date
  #     field :attachment
  #   end
  # end

  # config.model Forum do
  #   list do
  #     field :name
  #     field :created_at
  #     field :updated_at
  #     field :description
  #   end
  #   edit do
  #     field :user, :belongs_to_association
  #     field :name
  #     field :description
  #   end
  # end

  # config.model RevealIdentity do
  #   list do
  #     field :name
  #     field :created_at
  #     field :updated_at
  #   end
  #   edit do
  #     field :name
  #   end
  # end


end

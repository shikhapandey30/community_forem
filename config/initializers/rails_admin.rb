RailsAdmin.config do |config|

  config.main_app_name = ["Community Forum"]

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan
  #Excluded Models
  config.excluded_models = ["Attachment","Authenticate","Categorable","Conversation","Following","Institute","Like","Message","Notification","Organisation","Post","Skill","Vote"]
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

ActiveAdmin.register AccountBlock::Account do
  # top nav
  menu priority: 3

  # skip authentication for admin
  controller { skip_before_action :authenticate_account! }

  # params
  permit_params do
    permitted = [ :email, :password, :password_confirmation ]

    if params[:action] == 'update'
      permitted << [ :first_name, :last_name ]
    else
      permitted
    end
  end

  # form
  form do |f|
    f.inputs do
      f.input :email
      if !f.object.new_record?
        f.input :first_name
        f.input :last_name
      end
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  # index table
  config.sort_order = 'email_asc'
  index do
    selectable_column
    column :email
    column :first_name
    actions
  end

  # filter
  filter :email
  filter :first_name
  filter :last_name
end

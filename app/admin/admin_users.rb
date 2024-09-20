ActiveAdmin.register AdminUser do
  # skip authentication for admin
  controller { skip_before_action :authenticate_account! }

  # top nav
  menu priority: 2

  # whitelist attributes
  permit_params :email, :password, :password_confirmation

  # index table
  config.sort_order = 'email_asc'
  index do
    selectable_column
    column :email
    column :current_sign_in_at
    actions
  end

  # filter
  filter :email
  filter :created_at

  # form
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  # comments
  config.comments = false
end
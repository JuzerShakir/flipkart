ActiveAdmin.register ProductBlock::Product do
    # skip authentication for admin
    controller { skip_before_action :authenticate_account! }

  # top nav
  menu priority: 4

  # whitelist attributes
  permit_params :title, :description, :price


  # index table
  config.sort_order = 'title_asc'
  index do
    selectable_column
    column :title do
      truncate(_1.title, omission: "...", length: 30)
    end
    column :description do
      truncate(_1.description, omission: "...", length: 50)
    end
    column :price
    actions
  end

  # filter
  filter :title_cont, label: "Title"
  filter :description_cont, label: "Description"
  filter :price

  # form
  config.create_another = true
end

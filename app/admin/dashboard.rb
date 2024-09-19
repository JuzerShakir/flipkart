# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  # skip authentication for admin
  controller { skip_before_action :authenticate_account! }

  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    panel "Recent Products" do
      # ul do
      #   Product.order(created_at: :desc).limit(5).map do |product|
      #     li link_to(product.title, admin_product_path(product))
      #   end
      # end
    end
  end # content
end

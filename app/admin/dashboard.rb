# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  # skip authentication for admin
  controller { skip_before_action :authenticate_account! }

  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    panel "Recent Accounts" do
      ul do
        AccountBlock::Account.order(created_at: :desc).limit(5).map do |account|
          li link_to(account.email, admin_account_block_account_path(account))
        end
      end
    end

    panel "Recent Products" do
      ul do
        ProductBlock::Product.order(created_at: :desc).limit(5).map do |product|
          li link_to(product.title, admin_product_block_product_path(product))
        end
      end
    end
  end
end

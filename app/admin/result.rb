ActiveAdmin.register Result do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  index do
    id_column

    column :picture do |result|
      image_tag result.picture_url
    end

    column :brand do |result|
      result.shoe.brand.name
    end

    column :title
    column :size
    column :price

    column :store do |result|
      link_to result.store.name, result.url
    end

    column :created_at
    column :updated_at

    actions
  end
end

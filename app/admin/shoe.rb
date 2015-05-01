ActiveAdmin.register Shoe do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :brand_id, :name, :description, :picture

  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs "Details" do
      f.input :brand
      f.input :name
      f.input :description
      f.input :picture, :as => :file
    end
    f.actions
  end

end

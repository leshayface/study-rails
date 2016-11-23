ActiveAdmin.register Setting do

  actions :all, except: [:destroy]

  permit_params :name, :value

  index do
    column :id
    column :name
    column :updated_at
    actions defaults: true
  end

end

ActiveAdmin.register Highlight do



  index do
    column :image do |g|
      link_to "Open Image", g.image,  :target => '_blank'
    end
    column :title do |g|
      link_to g.title, g.image,  :target => '_blank'
    end
    column :active
    actions defaults: true
  end

  permit_params :title, :description,:image, :action_link,:action_text,:order,:active


end

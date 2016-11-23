ActiveAdmin.register Game do


  index do
    column :title do |g|
      link_to g.title, g.website,  :target => '_blank'
    end
    column :website do |g|
      link_to g.title, g.website,  :target => '_blank'
    end
    actions defaults: true
  end

  permit_params :title, :website,:image

end

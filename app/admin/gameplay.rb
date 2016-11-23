ActiveAdmin.register Gameplay do

  index do
    column :created_at
    column :title do |g|
      link_to g.title, gameplay_path(g),  :target => '_blank'
    end
    column :member do |g|
      link_to Member.find_by(id: g.member_id).psn_gamertag, member_path(Member.find_by(id: g.member_id)),  :target => '_blank'
    end
    actions defaults: true
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

end

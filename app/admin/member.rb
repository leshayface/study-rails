ActiveAdmin.register Member do

  actions :all, except: [:destroy]

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :psn_gamertag
    column :email
    column :last_sign_in_at
    column :status
    actions defaults: true
  end

  member_action :disable, method: 'get' do
    member = Member.friendly.find(params[:id])
    member.status = false
    member.save!
    redirect_to admin_member_path(member), notice: 'member disabled!'
  end
  member_action :enable, method: 'get' do
    member = Member.friendly.find(params[:id])
    member.status = true
    member.save!
    redirect_to admin_member_path(member), notice: 'member enabled!'
  end

  action_item :only => :show do
    if member.status == true
      link_to 'Disable', disable_admin_member_path(member)
    else
      link_to 'Enable', enable_admin_member_path(member)
    end
  end


  form do |f|
    f.inputs "Member Details" do

        if f.object.new_record?
            f.input :psn_gamertag
            f.input :email
            f.input :password
            f.input :password_confirmation
        end
    end
    f.button :Submit
  end

  permit_params :psn_gamertag, :email,:password, :password_confirmation,:status



end

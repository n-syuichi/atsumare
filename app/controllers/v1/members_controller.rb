module V1
  class MembersController < ApplicationController
    before_action :authenticate_user!

    def index
      if !user_signed_in?
        render json: { status: :bad_status, data: "ログインしてください" }
      else
        render json: { status: :ok, data: Member.all }
      end
    end

    def show
    end

    def new
    end



    def create
      member = Member.new(member_prams)
      if(member.save)
        render json: { status: :ok, data: "正常に終了しました" }
      else
        render json: { status: :ok, data: member.errors }
      end
    end

    private
    def member_prams
      params.require(:member).permit(:id,:name, :grade,:schoolname,:address,:homephonenumber,:phonenumber,:group,:part,:zone)
    end
  end
end



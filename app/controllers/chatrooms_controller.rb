class ChatroomsController < ApplicationController
    def show
      @chatroom = Chatroom.find(params[:id])
      @message = Message.new
      @profile = current_user.profile
    end
end

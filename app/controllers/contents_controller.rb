class ContentsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @contents = current_user.contents
    end
    def new
        @Content =  Content.new
    end
    def create
        @content = current_user.contents.buidl(content_params)

        if @content.save
            redirect_to contents_path, notice: 'Content successfully created'
        else
            render :new
        end
    end
    def edit
        @content = Content.find(params[:id])
    end


    private

    def content_params
        params.requere(:content).permit(:title, :description)
end

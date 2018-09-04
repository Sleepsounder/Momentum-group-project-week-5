class StoriesController < ApplicationController

    def index
        @stories = Story.all
    end

    def show
        @story = Story.find(params[:id])
    end

    def new
      redirect_to new_session_path, notice: 'You must be logged in to add a story' if !current_user
      @story = Story.new
    end

    def edit
        @story = Story.find(params[:id])
    end
    
    def create
        @story = Story.new(story_params)

        if @story.save
            redirect_to @story
        else
            render 'new'
        end
    end

    def update
        @story = Story.find(params[:id])

        if @story.update(story_params)

            redirect_to @story
        else
            render 'edit'
        end
    end

    def destroy
        @story = Story.find(params[:id])
        @story.destroy

        redirect_to stories_path
    end

    def upvote 
        @story_upvote = Story.find(params[:id])
        @story_upvote.upvote_by current_user
        redirect_to stories_path
      end

  private
    def story_params
        params.require(:story).permit(:title, :text, :user_id, :img_url, :username)
    end

end


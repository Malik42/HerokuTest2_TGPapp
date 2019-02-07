class CommentController < ApplicationController
  before_action :authenticate_user, only: [:new ,:edit , :destroy]

  def show
    @comment = Comment.all
  end

  def new
    @comment= Comment.new
  end

  def create

    c = City.create(name:"UNKNOWN", zip_code: "XXXXX")
    if current_user
      yolo =  current_user
    else
     yolo = User.create(first_name: "ANONYMOUS" , last_name: "USER", email: "UNKNOWN",  city: c )
   end
    c = Comment.new(content: params["content"], user: yolo , gossip_id: params["gossip_id"] )
    #params.permit(:title, :content)
    if c.save
      #flash[:notice] = "Comment successfully created"
      redirect_to commentsucces_path(params["gossip_id"])
      #redirect_to gossip_path(params["gossip_id"])
    else
      #flash[:notice] = "Comment fail"
      redirect_to commenterror_path(params["gossip_id"])
    end
    #yolo.reload.id # => 8888
    #yolo.save

    puts "$" * 60
    puts "ceci est le contenu de params content :"
    puts params
    puts params["content"]
    puts "yolo"
    puts "$" * 60

  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = @comment.gossip
  end

  def update
    @comment = Comment.find(params[:id])
      @gossip = @comment.gossip
    if @comment.update(comment_params)
      redirect_to gossip_path(params["gossip_id"])
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  redirect_to gossip_path(params["gossip_id"])
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

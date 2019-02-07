class CommentController < ApplicationController

  def show
    @comment = Comment.all
  end

  def new
    @comment= Comment.new
  end

  def create

    c = City.create(name:"UNKNOWN", zip_code: "XXXXX")
    yolo = User.create(first_name: "ANONYMOUS" , last_name: "USER", email: "UNKNOWN",  city: c )
    #yolo.id = 888888
    #yolo.save
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

  def comment_params
    params.require(:comment).permit(:content)
  end
end

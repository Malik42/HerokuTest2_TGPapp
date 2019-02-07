class GossipController < ApplicationController

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @grossip = Gossip.all
    @comment = Comment.all
  end

  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end


  def new
    @gossip= Gossip.new
    # Méthode qui crée un potin vide et l'envoie une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    c = City.create(name:"UNKNOWN", zip_code: "XXXXX")
    yolo = User.create(first_name: "ANONYMOUS" , last_name: "USER", email: "UNKNOWN",  city: c )
    #yolo.id = 888888
    #yolo.save
    g = Gossip.new(title: params["title"], content: params["content"], user: yolo )
    #params.permit(:title, :content)
    if g.save
      redirect_to '/static_pages/succes'
    else
      redirect_to '/static_pages/error'
    end
    #yolo.reload.id # => 8888
    #yolo.save

    puts "$" * 60
    puts "ceci est le contenu de params :"
    puts params
    puts params["title"]
    puts params["content"]
    puts "yolo"
    puts "$" * 60

    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
  end

  def edit
    @gossip = Gossip.find(params[:id])
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to '/static_pages/modified/'
    else
      render :edit
    end

  end

  def destroy

      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      redirect_to '/static_pages/delete'
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title , :content)
  end

end

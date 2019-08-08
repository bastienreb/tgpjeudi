class GossipController < ApplicationController

  def index # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @gossips = Gossip.all
  end

  def show # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip = Gossip.find(params[:id])
    @city = City.find(@gossip.user.city_id)
  end

  def new # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)

  end

# Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
# pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
# Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
  def create
    @gossip = Gossip.new(user: User.last, title: params[:title], content: params[:content])
    #@gossip.user = User.find_by(id: session[:user_id])
    if @gossip.save
      flash[:success] = "Your gossip has been submitted"
      redirect_to gossip_index_path
    else
      render new_gossip_path
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
  # pour info, le contenu de ce formulaire sera accessible dans le hash params
  # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.permit(:title, :content)
    if @gossip.update(gossip_params)
      flash[:success] = "Your gossip has been updated."
      redirect_to gossip_index_path
    else
    render :edit
    end
  end

  # Méthode qui récupère le potin concerné et le détruit en base
  # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossip_index_path
  end
end
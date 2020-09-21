require_relative './view'
require_relative './gossip'

class Controller
    attr_accessor :view
  
    def initialize
      @view = View.new
    end
  
    def create_gossip
      params = @view.create_gossip
      gossip = Gossip.new(params[:author], params[:content])
      gossip.save
    end
  
    def index_gossips
      all = Gossip.all
      @view.index_gossips(all)
    end

    def delete_gossip
      all = Gossip.all
      @view.index_gossips(all)
      index = @view.delete_gossip
      Gossip.delete_gossip(index)
    end

  end
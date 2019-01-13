class AtomsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @atoms = Atom.all
    render_json @atoms
  end
end

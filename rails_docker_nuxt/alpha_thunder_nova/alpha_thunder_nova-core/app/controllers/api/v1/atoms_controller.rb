class Api::V1::AtomsController < Api::V1::ApiController
  def index
    @atoms = Atom.all
    json_response(@atoms)
  end
end

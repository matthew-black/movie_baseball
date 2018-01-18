class Actor
  attr_reader :name, :image, :cast

  def initialize(actor_attributes)
    @name    = actor_attributes.fetch(:name)
    @image   = actor_attributes.fetch(:image)
    @credits = actor_attributes.fetch(:credits)
  end

end

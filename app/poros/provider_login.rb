class ProviderLogin
  attr_reader :id, :response

  def initialize(data)
    @response = data[:message]
    @id = data[:id]
  end
end
class Global::AlertComponent < ViewComponent::Base
  def initialize(text:, type:)
    @text = text
    @type = type.to_s
  end
end
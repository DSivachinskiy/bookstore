module ControllerMacros
 
  def login_costumer
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:costumer]
      costumer = FactoryGirl.create(:costumer)
      costumer.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in costumer
    end
  end
end
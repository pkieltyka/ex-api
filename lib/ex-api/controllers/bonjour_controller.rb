module ExApi
  class BonjourController < Goliath::API
    include ApiHelper
    
    def response(env)
      respond_ok({}, 'Salut!')
    end
    
  end
end

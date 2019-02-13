Rails.application.routes.draw do
  # Use for login and to authorize all resource
  use_doorkeeper do
    # No need to register client application
    skip_controllers :applications, :authorized_applications
  end

  scope module: :api, defaults: { format: :json }, path: 'api' do
    scope module: :v1 do #, constraints: ApiConstraints.new(version: 1, default: true) do
      devise_for :users, controllers: {
           registrations: 'api/v1/users/registrations',
       }, skip: [:sessions, :password]
    end
  end
end
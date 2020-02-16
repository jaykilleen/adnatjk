require "spec_helper"

describe UsersController do
  it('routes to #show') { expect(get('/users/1')).to route_to('users#show', id: '1') }
  it('routes to #edit') { expect(get('/users/1/edit')).to route_to('users#edit', id: '1') }
  it('routes to #update') { expect(patch('/users/1')).to route_to('users#update', id: '1') }

  it('routes to #index') { expect(get('/users')).to route_to('users#index') }
  it('routes to #new') { expect(get('/users/new')).to_not be_routable }
  it('routes to #create') { expect(post('/users')).to_not be_routable }
  it('routes to #destroy') { expect(delete('/users/1')).to_not be_routable }

  it 'renders the projects index template' do
    expect(get('/users/1/projects')).to be_routable
  end
end
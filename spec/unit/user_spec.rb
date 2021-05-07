require 'database_helpers'
require 'user'

describe User do
    describe '.create' do
        it 'creates a new user' do
            user = User.create(name: 'Joanna', username: 'jojobrigs', email: 'test@test.com', password: 'password123')

            persisted_data = persisted_data(id: user.id, table: :users)

            expect(user).to be_a User
            expect(user.id). to eq persisted_data['id']
            expect(user.name).to eq 'Joanna'
            expect(user.username).to eq 'jojobrigs'
            expect(user.email).to eq 'test@test.com'
        end
    end

end
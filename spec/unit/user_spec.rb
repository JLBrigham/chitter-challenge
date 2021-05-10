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

    # describe '.find' do
    #     it 'finds a user by ID' do
    #         user = User.create(name: 'Joanna', username: 'jojobrigs', email: 'test@test.com', password: 'password123')
    #         result = User.find(id: user)

    #         expect(result.id).to eq user.id
    #         expect(result.email).to eq user.email
    #     end

    #     it 'returns nil if there is no id given' do
    #         expect(User.find(nil)).to eq nil
    #     end
    # end

end
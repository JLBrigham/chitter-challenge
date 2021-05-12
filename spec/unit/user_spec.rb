require 'database_helpers'
require 'user'

describe User do
    describe '.create' do
        it 'creates a new user' do
            user = User.create(name: 'Joanna', username: 'jojobrigs', email: 'test@test.com', password: 'password123')

            persisted_data = persisted_data(id: user.id, table: 'users')

            expect(user).to be_a User
            expect(user.id). to eq persisted_data['id']
            expect(user.name).to eq 'Joanna'
            expect(user.username).to eq 'jojobrigs'
            expect(user.email).to eq 'test@test.com'
        end

        it 'hashes the password using bcrypt' do
            expect(BCrypt::Password).to receive(:create).with('password123')
            user = User.create(name: 'Joanna', username: 'jojobrigs', email: 'test@test.com', password: 'password123')
        end
    end

    #add a before each here

    describe '.authenticate' do
        it 'returns a user when given the correct username and password if one exists' do
            user = User.create(name: 'Joanna', username: 'jojobrigs', email: 'test@test.com', password: 'password123')
            authenticated_user = User.authenticate(username: 'jojobrigs', password: 'password123')

            expect(authenticated_user.id).to eq user.id
        end

        it 'returns nil given an incorrect username' do
            user = User.create(name: 'Joanna', username: 'jojobrigs', email: 'test@test.com', password: 'password123')

            expect(User.authenticate(username: 'notmyusername', password: 'password123')).to be_nil
        end

        it 'returns nil given an incorrect password' do
            user = User.create(name: 'Joanna', username: 'jojobrigs', email: 'test@test.com', password: 'password123')
            
            expect(User.authenticate(username: 'jojobrigs', password: 'notmypassword')).to be_nil
        end

    end



end
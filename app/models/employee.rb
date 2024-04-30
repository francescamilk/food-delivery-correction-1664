class Employee
    def initialize(attributes = {})
        @id       = attributes[:id]
        @username = attributes[:username]
        @password = attributes[:password]
        @role     = attributes[:role]   # rider || manager
    end

    attr_reader :id, :username, :password, :role
end
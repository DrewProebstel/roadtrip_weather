require 'securerandom'
class UsersSerializer

  def self.serialize(data)
    {
      data: {
        type: "users",
        id: data.id,
        attributes: {
          email: data.email,
          api_key: data.api_key
        }
      }
    }
  end
end

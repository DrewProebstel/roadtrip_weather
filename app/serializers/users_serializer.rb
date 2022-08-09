require 'securerandom'
class UsersSerializer

  def self.serialize(data)
    test = SecureRandom.base64(n=27)
    {
      data: {
        type: "users",
        id: data.id,
        attributes: {
          email: data.email,
          api_key: SecureRandom.base64(n=27)
        }
      }
    }
  end
end

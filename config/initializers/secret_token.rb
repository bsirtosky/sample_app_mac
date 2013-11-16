# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

#SampleAppMac::Application.config.secret_key_base = '140499ad6340ec3ca10ebf0b3b70bf82f8cf1a68d7711a4b8260209cb778def33315d3456873bde9b1a0bd68e93554ee0fc61c1d39e498d03814ffc6a7b8311f'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleAppMac::Application.config.secret_key_base = secure_token
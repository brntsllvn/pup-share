Rails.application.config.middleware.use OmniAuth::Builder do
  provider :paypal, "AZfYq0oomuRmdYp5fKt1e932Mrw3imDZDXq2HQE5NnAXgbX5hLsHob2DT1797fnWaKMkGJLByKc5Vwzg", "EDwIQd8bnsjqfBqfzrw1rTL430hkEEpqbnFDYlI3w4MvY6wbZwFBv7rydiAAZELbQxYSeRYB-E0ephxb", sandbox: true, scope: "openid"
end
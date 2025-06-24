module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', 'someSuperSecretValue'),
  },
  apiToken: {
    salt: env('API_TOKEN_SALT', 'ybB9yjzg3+FG3AXK85hXBw=='),
  },
});


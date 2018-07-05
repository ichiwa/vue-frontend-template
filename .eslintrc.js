module.exports = {
  root: true,
  env: {
    node: true
  },
  'extends': [
    'plugin:vue/recommended',
    '@vue/prettier'
  ],
  rules: {
    'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'prettier/prettier': 'error',
    'no-console': 0,
    'no-unused-vars': 0,
    'vue/name-property-casing': 0,
    'vue/max-attributes-per-line': 0,
  },
  parserOptions: {
    parser: 'babel-eslint'
  }
}
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CurrencyExchange.create(country_code: "en", currency: "£", rate: 0.8865)
CurrencyExchange.create(country_code: "es_us", currency: "$", rate: 1.2378)

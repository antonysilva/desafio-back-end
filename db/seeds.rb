# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TransactionType.create([
    {id: 1, name: "Débito", signal: "+"},
    {id: 2, name: "Boleto", signal: "-"},
    {id: 3, name: "Financiamento", signal: "-"},
    {id: 4, name: "Crédito", signal: "+"},
    {id: 5, name: "Recebimento Empréstimo", signal: "+"},
    {id: 6, name: "Vendas", signal: "+"},
    {id: 7, name: "Recebimento TED", signal: "+"},
    {id: 8, name: "Recebimento DOC", signal: "+"},
    {id: 9, name: "Aluguel", signal: "-"}
]) 

User.create(name: 'Sample User', email: 'sample_user@gmail.com', password: 'password')
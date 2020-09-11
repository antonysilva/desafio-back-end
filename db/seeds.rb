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
    {id: 4, name: "Recebimento Empréstimo", signal: "+"},
    {id: 5, name: "Vendas", signal: "+"},
    {id: 6, name: "Recebimento TED", signal: "+"},
    {id: 7, name: "Recebimento DOC", signal: "+"},
    {id: 8, name: "Aluguel", signal: "-"}
]) 

1		Entrada	+
2		Saída	-
3		Saída	-
4		Entrada	+
5		Entrada	+
6		Entrada	+
7		Entrada	+
8		Entrada	+
9		Saída	-
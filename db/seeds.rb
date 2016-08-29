# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brands = Brand.create([{name:  'Samsung'}, {name: 'HP'}, {name: 'D-link'}, {name: 'Intel'}, {name: 'Corsair'}])
equipments =
	Equipment.create([{name:  'Impressora DeskJet', model: 'd1520', description: '', brand_id: brands.second.id},
		{name:  'Roteador Wireless', model: 'DSL-2740', description: 'Roteador de cor preta neste modelo', brand_id: brands.third.id},
		{name:  'Notebook', model: 'DS1000', description: '14", 4GB RAM, Processador Intel Core i5', brand_id: brands.first.id}
])
customers =
	Customer.create([{first_name: 'João', last_name: 'Silva', email: 'joaosilva@gmail.com', phone: '5491834667'},
		{first_name: 'Teste', last_name: 'Teste', email: 'teste@teste.com', phone: '5499999999'},
		{first_name: 'Maria', last_name: 'Camargo', email: 'mariacamargo@yahoo.com', phone: '5496881001'}
])
Order.create([{defect: 'Não liga, faz bip prolongado', serial_number: '156451256148912148', observation: 'Acompanha carregador', equipment_id: equipments.third.id, customer_id: customers.first.id, status: 1},
	{defect: 'Não funciona conexão com a internet', serial_number: '', observation: 'Esta faltando uma antena', equipment_id: equipments.second.id, customer_id: customers.third.id, status: 2},
	{defect: 'Cartuchos foram trocados, mas apenas imprime em preto-e-branco', serial_number: 'ABCDE123456789', observation: 'Bandeja de folhas quebrada', equipment_id: equipments.first.id, customer_id: customers.second.id, status: 3}
])
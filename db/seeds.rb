# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{email: 'teste@teste.com', password: '123456789'},{email: 'admin@admin.com', password: '123456789'}])

brands = Brand.create([{name:  'Samsung', user_id: 1}, {name: 'HP', user_id: 1}, {name: 'D-link', user_id: 1}, {name: 'Intel', user_id: 1}, {name: 'Corsair', user_id: 1}])

equipments =
	Equipment.create([{description:  'Impressora DeskJet', model: 'd1520', brand_id: brands.second.id, user_id: 1},
		{description:  'Roteador Wireless', model: 'DSL-2740', brand_id: brands.third.id, user_id: 1},
		{description:  'Notebook', model: 'DS1000', brand_id: brands.first.id, user_id: 1},
		{description:  'Memória RAM', model: 'ABCDE123456789 4GB 1600MHz', brand_id: brands.fifth.id, user_id: 1},
		{description:  'Celular', model: 'Galaxy S5', brand_id: brands.first.id, user_id: 1},
])
customers =
	Customer.create([{first_name: 'João', last_name: 'Silva', email: 'joaosilva@gmail.com', phone: '5491834667', user_id: 1},
		{first_name: 'John', last_name: 'Doe', email: 'teste@teste.com', phone: '5499999999', user_id: 1},
		{first_name: 'Maria', last_name: 'Camargo', email: 'mariacamargo@yahoo.com', phone: '5496881001', user_id: 1},
		{first_name: 'Guilherme', last_name: 'Zordan', email: 'guilhermezordan@outlook.com', phone: '5494095222', user_id: 1},
		{first_name: 'Gustavo', last_name: 'Zordan', email: 'gustavo-pz@hotmail.com', phone: '5492485632', user_id: 1}
])
orders =
	Order.create([{defect: 'Não liga, faz bip prolongado', serial_number: '156451256148912148', observation: 'Acompanha carregador', equipment_id: equipments.third.id, customer_id: customers.first.id, status: 0, user_id: 1},
		{defect: 'Não funciona conexão com a internet', serial_number: '', observation: 'Esta faltando uma antena', equipment_id: equipments.second.id, customer_id: customers.third.id, status: 1, user_id: 1},
		{defect: 'Cartuchos foram trocados, mas apenas imprime em preto-e-branco', serial_number: 'ABCDE123456789', observation: 'Bandeja de folhas quebrada', equipment_id: equipments.first.id, customer_id: customers.second.id, status: 2, user_id: 1, value: '50,00'},
		{defect: 'Não permite que o computador faça boot', serial_number: '213456789123456789', observation: '', equipment_id: equipments.fourth.id, customer_id: customers.fifth.id, status: 3, user_id: 1, value: '110,00'},
		{defect: 'Tela rachada', serial_number: '', observation: 'Acompanha carregador', equipment_id: equipments.fifth.id, customer_id: customers.fourth.id, status: 4, user_id: 1, value: '250,00'},
		{defect: 'Está lento, possível ter vírus', serial_number: 'ABCSDETRE4RFFDSA', observation: 'Acompanha luva', equipment_id: equipments.third.id, customer_id: customers.second.id, status: 5, user_id: 1, visible: false}
	])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

u1 = User.create(name: "Richard", lastName: "Le May", password: "webtech",
                 email: "ralemay@miuandes.cl", location: "Edificio de Ingenieria",
                 address: "Universidad de los Andes", phone: "+56944274841")

u1.inbox_id = Inbox.find_by_user_id(u1.id).id
u1.save!

u2 = User.create(name: "Julio", lastName: "Castro", password: "webtech",
                 email: "jacatro2@miuandes.cl", location: "Edificio de Ingenieria",
                 address: "Universidad de los Andes", phone: "+569452746541")

u2.inbox_id = Inbox.find_by_user_id(u2.id).id

o1 = Organization.create(name: "Organizacion")
u1.organization_id = o1.id
u2.organization_id = o1.id

u1.save!
u2.save!
o1.save!








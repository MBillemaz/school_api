School.create!([
    {"name":"Ecole primaire Michel Servet","address":"2-6 Rue Alsace Lorraine, 69001 Lyon","nb_student":"350","status":"public","latitude":"45.7720199","longitude":"4.8368897999999945"},
        {"name":"OGEC GROUPE SCOLAIRE SAINT DENIS","address":"7 Rue Hénon, 69004 Lyon","nb_student":"100","status":"public","latitude":"45.779445","longitude":"4.831833999999958"},
        {"name":"Ecole Primaire Privée Saint Sacrement","address":"15 Rue Etienne Dolet, 69003 Lyon","nb_student":"250","status":"public","latitude":"45.757568","longitude":"4.851882"},
        {"name":"Ecole maternelle publique Anatole France","address":"15 Rue Louis, 69003 Lyon","nb_student":"50","status":"private","latitude":"45.7528455","longitude":"4.888221499999986"},
        {"name":"Ecole maternelle Condorcet","address":"37 Rue Jules Massenet, 69003 Lyon","nb_student":"280","status":"public","latitude":"45.7482793","longitude":"4.8924376999999595"},
        {"name":"Ecole Maternelle Audrey Hepburn","address":"8 Rue Tissot, 69009 Lyon","nb_student":"150","status":"public","latitude":"45.7766122","longitude":"4.80246360000001"},
        {"name":"École élémentaire","address":"2-6 Rue Alsace Lorraine, 69001 Lyon","nb_student":"80","status":"public","latitude":"45.7488929","longitude":"45.7488929"}
    ])

user = User.new
user.email = 'ynov@ynov.com'
user.password = 'ynov'
user.password_confirmation = 'ynov'
user.save!
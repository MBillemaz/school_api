json.school do
    json.id @school.id
    json.name @school.name
    json.address @school.address
    json.postal_code @school.postal_code
    json.commune @school.commune
    json.horaire @school.horaire
    json.phone_number @school.phone_number
    json.mail @school.mail
    json.latitude @school.latitude
    json.longitude @school.longitude
    json.nb_student @school.nb_student
    json.status @school.status
end
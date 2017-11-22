busqueda = ""
$ document
    .on "turbolinks:load" , (e) -> 
        $ "#new_request #consulta"
            .change (e) ->
                valor = $ "#new_request #consulta"
                    .val()
                busqueda = valor
                $.ajax "/cliente/requests/servicios/#{valor}.json", {
                        success: (data) ->
                            t = $ "#request_service_id"
                            if t.length > 0
                                console.log t[0]
                                $ "#request_service_id"
                                    .empty()
                            for i in [0...data.length]
                                a = data[i]["description"]
                                $ "#request_service_id"
                                    .append "<option value=#{data[i]['id']}> #{data[i]['description']} </option>"           
                    }
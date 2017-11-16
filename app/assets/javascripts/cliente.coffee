$ document
    .on "turbolinks:load" , (e) -> 
        $ "#new_request #consulta"
            .change (e) ->
                valor = $ "#new_request #consulta"
                    .val()
                    
                $.ajax "/cliente/requests/servicios/#{valor}.json", {
                        success: (data) ->
                            console.log data[0]["description"]
                            $ "request_service_id"
                                .append
                    }
module Cliente::TecnicosInteresadosHelper
    def color_barra_perfil_tecnico( puntos )
        if puntos > 5*0.75
            "progress-bar-success"
        elsif puntos > 5*0.5
            "progress-bar-info"
        elsif puntos > 5*0.25
            "progress-bar-warning"
        else 
            "progress-bar-danger"
        end
    end
end

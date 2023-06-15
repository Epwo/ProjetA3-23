# Coordonnées de latitude et longitude pour chaque quartier
latitudes <- c(48.8626, 48.8691, 48.8637, 48.8566, 48.8448, 48.8493, 48.8567, 48.8722, 48.8760, 48.8761,# nolint
                48.8584, 48.8352, 48.8283, 48.8296, 48.8412, 48.8600, 48.8872, 48.8925, 48.8817, 48.8632)# nolint
longitudes <- c(2.3364, 2.3473, 2.3590, 2.3522, 2.3551, 2.3324, 2.3208, 2.3124, 2.3375, 2.3602, # nolint
                2.3795, 2.4458, 2.3627, 2.3267, 2.3002, 2.2620, 2.3075, 2.3444, 2.3834, 2.4001)# nolint

# Création du dictionnaire des quartiers de Paris
arrondissements_paris <- setNames(Map(function(lat, long) c(lat = lat, long = long), latitudes, longitudes), # nolint
                            paste0(1:20))

#-------

# Coordonnées de latitude et longitude pour chaque arrondissement
latitudes <- c(43.3000, 43.2995, 43.2957, 43.2892, 43.2901, 43.2880, 43.2827, 43.2711,# nolint
               43.2449, 43.3006, 43.2735, 43.3020, 43.3444, 43.3370, 43.3150, 43.3635)# nolint
longitudes <- c(5.3800, 5.3702, 5.3813, 5.3783, 5.3751, 5.3724, 5.3576, 5.3655,
                5.3993, 5.4004, 5.4313, 5.4287, 5.4037, 5.3607, 5.3731, 5.3713)

# Création du dictionnaire des arrondissements de Marseille
arrondissements_marseille <- setNames(Map(function(lat, long) c(lat = lat, long = long), latitudes, longitudes),# nolint
                                      paste0(1:16))

# --------

# Coordonnées de latitude et longitude pour chaque arrondissement
latitudes <- c(45.7640, 45.7673, 45.7597, 45.7540, 45.7500, 45.7464, 45.7487, 45.7416, 45.7369)# nolint
longitudes <- c(4.8357, 4.8317, 4.8112, 4.8053, 4.8400, 4.8360, 4.8525, 4.8760, 4.8925)# nolint

# Création du dictionnaire des arrondissements de Lyon
arrondissements_lyon <- setNames(Map(function(lat, long) c(lat = lat, long = long), latitudes, longitudes),# nolint
                                paste0(1:9))


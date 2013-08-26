class UrlMappings {
    /* TODO: Can this be done more by convention? */
    static mappings = {
        "/" {
            controller = 'bart'
        }
        
        "/api" {
            controller = 'api'
        }
        
        "/api/tickets" {
            controller = 'api'
            action = 'tickets'
        }
        
        "/api/status" {
            controller = 'api'
            action = 'status'
        }
        
        "/api/stations" {
            controller = 'api'
            action = 'stations'
        }
        
        "/api/station/$station" {
            controller = 'api'
            action = 'station'
        }
        
        "/api/departures/$station" {
            controller = 'api'
            action = 'departures'
        }
        
        "/api/news" {
            controller = 'api'
            action = 'news'
        }
        
        "/home" {
            controller = 'bart'
            action = 'index'
        }
        
        "/station/$station" {
            controller = 'bart'
            action = 'station'
        }

        "/departures/$station" {
            controller = 'bart'
            action = 'departures'
        }
        
        "/tickets" {
            controller = 'bart'
            action = 'tickets'
        }
        
        "/news" {
            controller = 'bart'
            action = 'news'
        }
        
        "/about" {
            controller = 'bart'
            action = 'about'
        }
    }
}

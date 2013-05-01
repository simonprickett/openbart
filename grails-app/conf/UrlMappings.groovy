class UrlMappings {
    static mappings = {
        "/" {
            controller = 'bart'
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

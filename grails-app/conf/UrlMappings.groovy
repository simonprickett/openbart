class UrlMappings {
    static mappings = {
        "/" {
            controller = 'bart'
        }

        "/home" {
            controller = 'bart'
            action = 'index'
        }

        "/departures" {
            controller = 'bart'
            action = 'station'
        }
    }
}

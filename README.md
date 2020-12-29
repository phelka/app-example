
Run:

    docker-compose up
    
    # or
    docker build -t sba .
    docker run sba -it
    
    # once finished, close stack:
    docker-compose down
    
Open: `http://localhost:8080/`

Health:

    http://localhost:8080/actuator/health
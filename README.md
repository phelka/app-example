
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

# Stack
- Language: Java + Kotlin
- Java 15, 16 - dockerized
- Spring Boot

# Project structure
- `domain` - pure solution; free from any infrastructure code (like Spring framework)
- `webapp` - simple Spring Boot app to handle business logic from `domain`
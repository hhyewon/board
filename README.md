# π μ€νλ§ λΆνΈ κ²μν λ§λ€κΈ°

## Stack
- java / spring-boot 
- mariaDB / mybatis
- jsp (jstl) / html / css / javascript / JQuery / ajax

## Structure
```
π item 10
    π build.gradle
    π build
    π gradle
    π lib
    π src
        π main
            π java
                π com.example.item10
                   π config
                   π item
                      π ItemController
                      π ItemMapper
                      π ItemService
                   π main
                      π MainController
                   π util
                      π paging
                         π Criteria
                         π PageMaker
                   π Item10Application
           π resources
               π mappers
                   π ItemMapper.xml
               π application.properties
           π webapp
               π WEB-INF
                   π css
                   π image
                   π js
                      π pagination
                   π views
                      π index
                         π detail.jsp
                         π index.jsp (λ©μΈ νμ΄μ§)
                         π post.jsp
                         π update.jsp
                      π bootstrap.jsp
```


## Springboot java
> Request / Response β Controller β Service / Provider β Mapper β Mapper.xml    
- **Type: Gradle (= Springboot μ νΈ)**
- **Java: 11**
- **Packaging: Jar**
- Spring Boot DevTools
- Lombok
- Spring Web
- MariaDB Driver


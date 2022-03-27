# 📌 스프링 부트 게시판 만들기

## Stack
- java / spring-boot 
- mariaDB / mybatis
- jsp (jstl) / html / css / javascript / JQuery / ajax

## Structure
```
📚 item 10
    📄 build.gradle
    📁 build
    📁 gradle
    📁 lib
    📁 src
        📁 main
            📂 java
                📁 com.example.item10
                   📁 config
                   📁 item
                      📘 ItemController
                      📗 ItemMapper
                      📘 ItemService
                   📁 main
                      📘 MainController
                   📁 util
                      📁 paging
                         📘 Criteria
                         📘 PageMaker
                   📘 Item10Application
           📂 resources
               📁 mappers
                   📙 ItemMapper.xml
               📒 application.properties
           📂 webapp
               📁 WEB-INF
                   📁 css
                   📁 image
                   📁 js
                      📁 pagination
                   📁 views
                      📁 index
                         📙 detail.jsp
                         📙 index.jsp (메인 페이지)
                         📙 post.jsp
                         📙 update.jsp
                      📙 bootstrap.jsp
```


## Springboot java
> Request / Response ⇄ Controller ⇄ Service / Provider ⇄ Mapper ⇄ Mapper.xml    
- **Type: Gradle (= Springboot 선호)**
- **Java: 11**
- **Packaging: Jar**
- Spring Boot DevTools
- Lombok
- Spring Web
- MariaDB Driver


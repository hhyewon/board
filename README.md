# 📌 스프링 부트 게시판 만들기

## Stack
- java / spring-boot 
- mariadb / mybatis
- jsp / html / css / javascript / jquery / ajax

## Structure
```
item 10
  📁 build
  📁 gradle
  📁 lib
  📁 src
      📁 main
          📁 java
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
         📁 resources
             📁 mappers
                📙 ItemMapper.xml
             📒 application.properties
         📁 webapp
             📁 WEB-INF
                📁 css
                📁 image
                📁 js
                   📁 pagination
                📁 views
                   📁 index
                      📙 detail.jsp
                      📙 index.jsp
                      📙 post.jsp
                      📙 update.jsp
                   📙 bootstrap.jsp
```


## Springboot java
**🛠 패키지매니저 = Maven (= Spring 선호), Gradle (= Springboot 선호)**
> Request / Response ⇄ Controller ⇄ Service / Provider ⇄ Mapper ⇄ Mapper.xml



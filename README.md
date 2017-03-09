# README
Programistok 2016.

In this project we use:
  - Rails 5
  - ActionCable
  - Webpack
  - React + Redux

Project that was supposed to imitate Familiada tv show.

The main goal was to use new technologies, to learn.

Before that project, I had only experience in rails backend development,
so websockets, js frontened frameworks, were totaly new.

If you have any suggestions about that code, please contact me !

## Installation
```
git clone git@github.com:epicatization/programistok-familiada.git
cd programistok-familiada
```
## Installation - backend part
```
bundle install
rake db:create
rake db:migrate
rake db:seed
rails s
visit localhost:3000/questions/1
```

## Installation - frontend part
```
cd frontend
yarn install
yarn start
open http://127.0.0.1:8888/ in new tab, and play !
```

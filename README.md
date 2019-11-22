# dnmp
research docker+nginx+php

`docker-compose up -d` `docker-compose start nginx` `docker-compose start php` `docker-compose restart nginx` `docker-compose restart php`
## Todo list

- [ ]  nginx echo extend
- [ ]  permission problem
- [ ]  install sendmail
- [x]  install locale(need optimize)
- [x]  mysql mysqladmin up
- [ ]  redis redisadmin up


## Tips
### window7
- The port mapping was not valid

  solution:virtualBox->setting->network->advanced->port forwarding->add
- The volumes was not valid

  solution:virtualBox->setting->shared folders->add
  mount -t vboxsf a /a
  
## Problems to be solved
nginx $remote_addr
  
## Reference
1. [Docker — 从入门到实践](https://yeasy.gitbooks.io/docker_practice/)

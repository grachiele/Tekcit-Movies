# Tekcit

Tekcit is a movie database to show off Ruby on Rails full MVC capability. The project allows a user to search for movies based on Genres, Titles, Theaters and Cities that a movie may be playing in. The user can then buy a ticket and have it saved to their history page or delete past tickets. The database currently utiizes information generated by the refactored [Ffaker](https://github.com/ffaker/ffaker) gem for all component details.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* Ruby 2.0 or higher
* Npm or Yarn configured
* PostgreSQL 

### Installing

After cloning the repository, follow these steps to get a local development env running
This will require two separate terminal tabs.

#### Backend

**If not preconfigured, run the following command pointing to your postgresql app pg_config
or you will encounter an error installing the pg gem.**

```
bundle config build.pg --with-pg-config=/Applications/Postgres.app/Contents/Versions/(YOUR POSTGRES VERSION)/bin/pg_config
```

Run bundle to install the ruby gem dependencies.

```
bundle install
```

In the main folder, create the rails backend server and run the migrations to create the database tables.

```
rails db:create && rails db:migrate
```

Start the server on port 3001, allowing the frontend to take the default 3000.

```
rails s -p 3001
```

#### Frontend

From the main directory, change into the Frontend directory using cd.

```
cd Frontend/
```

Install all dependencies through npm or yarn.

```
(manager) install
```

**Project uses react-moment with moment-mini as a dependency to avoid locale issues.**
**To run properly, open ./node_modules/react-moment/dist/index.js in your text editor of choice, and change the following line**

```
module.exports = t(require("moment")
```

to
```
module.exports = t(require("moment-mini")
```

## Built With

* [Rails](http://rubyonrails.org/) - The MVC web framework used for the backend.
* [React](https://reactjs.org/) - JS library used for interface.
* [Npm](https://www.npmjs.com/) - Package manager.

## Authors

* **Ke'sean Woodhouse** - *Project Owner* 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details




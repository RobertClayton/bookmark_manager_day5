# Bookmark Manager

This week, you will build a web app that stores web bookmarks in a database.

### Concepts and skills for the week

#### Concepts

- Object-relational mappers
- Relationships between data in a database
- SQL, the database query language
- Data encryption
- Rake
- HTML forms
- Web app deployment

#### Skills

- Designing data relationships using an object-relational mapper
- Designing a database schema
- Manipulating data using the CRUD cycle
- Structuring more complex MVC applications
- Refactoring more complex apps
- Creating user stories

## The project

You're going to build a bookmark manager.  A bookmark manager is a website to maintain a collection of URLs. You can use it to save a webpage you found useful. You can add tags to the webpages you saved to find them later. You can browse links other users have added.

## User stories

```
As a Makers Student
So I can know whats in the database
I want to see a list of all the links

As a Makers Student
So I can update the database
I want to be able to add new links

As a Makers Student
So I can categorise the database
I want to be able to add tags to links

As a Makers Student
So I can narrow a search
I want to be able to filter links via tags

As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of links on the homepage

As a time-pressed user
So that I can quickly find links on a particular topic
I would like to filter links by tag
```

| Objects       | Messages            |
| ------------- |:-------------------:|
| links,database| see a list          |
| links         | add new             |
| tags, links   | add tags to links   |
| tags          | filter tags, search |

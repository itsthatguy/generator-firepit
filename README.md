# Generator-Firepit

[![Build Status](https://travis-ci.org/itsthatguy/generator-firepit.svg?branch=master)](https://travis-ci.org/itsthatguy/generator-firepit)

Firepit is a Node static site starter project Yeoman Generator. The only reason I say that it is a static site starter project is because it doesn't start out serving anything other than static assets. If you want to add that on, go for it. This is a normal node stack after all.


### Includes
* Node
* Express
* Bower
  * jQuery
  * Ember
  * Handlebars
* Gulp
* Livereload
* Browserify
* Stylus
* Coffeescript
* nodemon


## Getting Started


### Install yeoman

```
npm install -g yo
```

### Install Firepit!
```
npm install -g generator-firepit
```


## Using Firepit
Simply run the generator in a new project directory:

```
mkdir myproject && cd $_
yo firepit
```


## Now what? Up and Running

### Running

1. Run the server: `npm start`
2. Browse to: `http://localhost:3002`

Assets will automatically be compiled, while the server is running. So all you need to do is run `npm start`.


### Deploying to heroku

1. Create your heroku instance `heroku create`
2. Deploy `git push heroku master`
3. Dance.


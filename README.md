# Firepit

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

Firepit is a Node static site starter project Yeoman Generator. The only reason I say that it is a static site starter project is because it doesn't start out serving anything other than static assets. If you want to add that on, go for it. This is a normal node stack after all.


### Install yeoman

```
npm install -g yo
```

### Clone this repo

```
git clone git@github.com:itsthatguy/generator-firepit.git
```

### Link it!

Before you can use the generator, npm will need to know where it is. Use the following commands to set that up.

```
cd generator-firepit
npm link
```


## Using the generator
*NOTE: I'm assuming you are still in the generator-firepit directory right now.*

Replace `myproject` with whatever you want to name your project.

```
cd ..
mkdir myproject && cd $_
yo firepit
```


## Now what? Up and Running

### Running

1. Run the server: `npm start`
2. Browse to: `http://localhost:3002`

Assets will automatically be compiled, while the server is running. So all you need to do it run `npm start`.


### Deploying to heroku

1. Create your heroku instance `heroku create`
2. Deploy `git push heroku master`
3. Dance.


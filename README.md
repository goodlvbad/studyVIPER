# Study VIPER
Learning how to implement VIPER architecture on simple app

This simple app is using API call form [Breaking Bad API](https://breakingbadapi.com/documentation) to show names of character in table view

## VIPER module

**View** : it's ViewController, has protocol, has reference to presenter
**Interactor** : it's object, has protocol, has reference to presenter. (For example it makes API calls)
**Presenter** : it's object, has protocol, has reference to interactor, router, view. 
**Entity** : it's a model
**Router** : it's object, has protocol. Entry point to module 

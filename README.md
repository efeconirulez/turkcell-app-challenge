# Turkcell App Challenge
iOS Application for Turkcell App Challenge

24.12.2017

# Challenge Details

**Mandatory**
- [x] Application Structure
- [x] Performance
- [x] Image Cache
- [x] Exception Handling

**Optional**
- [x] Offline/Caching
- [x] Detail Screen
- [ ] Unit Test
- [x] Search

# General Info About the Project

  iOS 11 features are taken into consideration while implementing. Large titles are used and nested search bar into navigation bar. Search bar hides when scrolled, also navigation bar goes to classic 44px height when scrolled, to increase the area for collection view.
  
  Base view controller is implemented in order to apply some functionality to app-wide. Such as hiding the bottom notch (iPhone X home indicator) in every view controller (even if there are only two).
  
  Collection view is used for main view controller. Cell widths are responsive with the screen size.
  
  Folders are placed in a hierarchy. Combined all related files into folders and seperated the others.
  
  Products are cached into UserDefaults and fetched after that each launch. So, application can be used offline, after first launch. 

  Images are also cached and don't use unneccessary network operation.
  
  `ProductDetail` model inherited from `Product` since `Product` cover all the attributes `ProductDetail` has.
  

# Architecture

  MVC Architecture is used as Apple recommends. MVVM or VIPER would be overkill for a simple project like this one.

# Frameworks

###### Alamofire
  Alamofire is used for network operations. API and Network Manager are splitted in order to increase readability and elasticity. Architecture of the network layer allows to implement more endpoints easily. Just adding the endpoint into API enum will do the trick.
  
###### FTIndicator
  A simple UI package for toast and notification messages. It is used to display error messages, if any.
  
###### NVActivityIndicatorView
  A custom activity indicator package. It is displayed while retrieving data from server.
  
###### SwifterSwift
  This is a collection of extensions. Not used for anything specific but helps to save time with its extensions.
  
###### SwiftyJSON
  Used for parsing and manipulating JSON objects which are retrieved from REST API. It can be seen in model initializers.
  
###### Kingfisher
  A lightweight Swift library for downloading and caching images. I prefer this over SDWebImage because way more easy to implement. 
  
###### Hero
  A custom view transition library. Used to apply a custom transition between main page cell and detail view controller. By simply giving HeroID's to the views, Hero handles the rest.

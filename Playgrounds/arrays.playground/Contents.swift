import UIKit

//ARRAY

var myFavoriteMovies = ["Pulp Fiction","Kill Bill","Avatar","Twilight",true,5] as [Any]

//as --> casting
//any --> any object

myFavoriteMovies[0]
myFavoriteMovies[1]
myFavoriteMovies[2]
myFavoriteMovies[3]
myFavoriteMovies[4]
myFavoriteMovies[5]

var myStringArray = ["deneme1", "deneme2","deneme3"]

myStringArray[0].uppercased()

myStringArray.count

myStringArray[myStringArray.count-1]

myStringArray.last

myStringArray.sort()
myStringArray.append("hello")


//SET
//like an array but no indexing
//unordered collection, unique elements

var mySet :Set = [1,2,3,4,5]
var myStringSet : Set = ["a","b","c","a"]

var myInternetArray = [1,2,3,4,5,6,1,2,1]
var myInternetSet = Set(myInternetArray)


var mySet1 : Set = [1,2,3]
var mySet2 : Set = [3,4,5]

var mySet3 = mySet1.union(mySet2)

//Dictionary
//key-value pairing
var myFavoriteDirectors = ["Pulp Fiction" : "Tarantino","Lock Stock" :"Guy Ritchie", "The Dark Knight": "Christopher Nolan"]

myFavoriteDirectors["Pulp Fiction"]
myFavoriteDirectors["The Dark Knight"]

myFavoriteDirectors["Pulp Fiction"] = "Quentin Tarantino"
myFavoriteDirectors["Seven Samurai"] = "Akira Kurisowa"

var myDic = ["Run" : 100,"Swim":200]

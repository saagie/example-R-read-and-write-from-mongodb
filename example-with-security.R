# Choose a cran mirror to use (1 = https://cloud.r-project.org/, worldwide redirection)
chooseCRANmirror(ind = 1)

# Install dependencies if necessary
if (!require(mongolite)) {
    # Install system dependencies
    system("sudo apt-get install -y libssl-dev libsasl2-dev")
    install.packages("mongolite")
    library(mongolite)
}

### Parameters to set
# Specials characters must be encoded as url, see here : http://www.w3schools.com/tags/ref_urlencode.asp
user <- "user"
password <- "password"
ip <- "xxx.xxx.xxx.xxx"
port <- "27017"
authentificationDatabase <- "admin"
database <- "database"
collection <- "MyNewCollection"
data <- mtcars

# Build the connection uri from the parameters above
uri <- paste0("mongodb://", user, ":", password, "@", ip, ":", port, "/", authentificationDatabase)

# Connect to the database
con <- mongo(collection = collection, db = database, url = uri)

# Count the number of documents in the collection
con$count()

# Insert new data in the collection
con$insert(data)

# Read data from the collection
con$find()

# Read data from any valid mongo query
con$find('{"cyl" : 6, "mpg" : { "$gt" : 20}}')


# Choose a cran mirror to use (48 = Paris / France)
chooseCRANmirror(ind = 48)

# Install dependencies if necessary
if (!require(mongolite)) {
    # Install system dependencies
    system("sudo apt-get install -y libssl-dev libsasl2-dev")
    install.packages("mongolite")
    library(mongolite)
}

### Parameters to set
ip <- "127.0.0.1"
port <- "27017"
database <- "database"
collection <- "MyNewCollection"
data <- mtcars

# Build the connection uri from the parameters above
uri <- paste0("mongodb://", ip, ":", port, "/")

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


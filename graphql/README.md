# README

Clone repository:
```
git clone git@github.com:Gishanin/graphqlappland.git
```
Install gems:
```
bundle install
```
Start server:
```
rails s
```
Send requests to http://localhost:3000/graphql

Exmple query:
```
mutation($jsonfile: Upload!) {
  search(input: {needName: true, jsonFile: $jsonfile, packageName: "app", eventSql: "11111" }) {
    search {
      status
      response
    }
  }
}
```
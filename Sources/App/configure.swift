import Vapor

var kApp: Application!
var downArr: [String] = []
var midArr: [String] = []
var upArr: [String] = []
var sDownArr: [String] = []
var sUpArr: [String] = []

public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    kApp = app
    // register routes
    try routes(app)
}

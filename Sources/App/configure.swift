import Vapor

var kApp: Application!


public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    kApp = app
    // register routes
    try routes(app)
}

import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("DATABASE_NAME") ?? "vapor_database"
    ), as: .psql)
    
//    app.databases.use(.postgres(
//        hostname: "localhost",
//        username: "Torinoss",
//        password: "Taeyeonss0309",
//        database: "InkingDB"
//    ), as: .psql)

    app.migrations.add(CreateCard(),
                       CreateUser(),
                       CreateWork(),
                       CreateComment(),
                       CreateLike(),
                       CreateCollection(),
                       CreateUserToken())


    // register routes
    try routes(app)
}

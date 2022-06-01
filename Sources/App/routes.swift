import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.get("kline",":paras") { req ->EventLoopFuture<[KlineModel]> in
        let paras = req.parameters.get("paras") ?? ""
        let URLString = "https://www.binance.com/fapi/v1/continuousKlines?contractType=PERPETUAL&\(paras)"
        let res = kApp.client.get("\(URLString)",headers: [:]).flatMapThrowing { res in
            try res.content.decode([KlineModel].self)
        }.map { json -> [KlineModel] in
//            debugPrint(json)
           return json
        }
        return res
    }
    
}

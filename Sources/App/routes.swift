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
    
    app.get("sentResult",":res",":name") { req ->NumModel in
        let name = req.parameters.get("name") ?? ""
        let res = req.parameters.get("res") ?? ""
        if res == "down" && !downArr.contains(name) {
            downArr.append(name)
        }else if res == "mid" && !midArr.contains(name) {
            midArr.append(name)
        }else if res == "up" && !upArr.contains(name) {
            upArr.append(name)
        }else if res == "sDown" && !sDownArr.contains(name) {
            sDownArr.append(name)
        }else if res == "sUp" && !sUpArr.contains(name) {
            sUpArr.append(name)
        }
        return NumModel(num: 0, ev: 0)
    }
    
    app.get("getResult") { req ->ResModel in
        return ResModel(mid: midArr, up: upArr, down: downArr, sDown: sDownArr, sUp: sUpArr)
    }
    
}

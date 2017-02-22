//
//  Client.swift
//  Retrolux
//
//  Created by Christopher Bryan Henderson on 10/8/16.
//  Copyright © 2016 Bryan. All rights reserved.
//

import Foundation

public protocol Client: class {
    var requestInterceptor: ((inout URLRequest) -> Void)? { get set }
    var responseInterceptor: ((inout ClientResponse) -> Void)? { get set }
    func makeAsynchronousRequest(request: inout URLRequest, callback: @escaping (_ response: ClientResponse) -> Void) -> Task
}

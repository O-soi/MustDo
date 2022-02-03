//
//  CombineAsyncStream.swift
//  MustDo
//
//  Created by 남기범 on 2022/02/03.
//

import Foundation
import Combine

class CombineAsyncStream<Upstream: Publisher>: AsyncSequence {
    typealias AsyncIterator = CombineAsyncStream<Upstream>
    typealias Element = Upstream.Output
    
    private let stream: AsyncThrowingStream<Upstream.Output, Error>
    private lazy var iterator = stream.makeAsyncIterator()
    private var cancellable: AnyCancellable?
    
    func makeAsyncIterator() -> Self {
      return self
    }
    
    init(_ upstream: Upstream) {
        var subscription: AnyCancellable? = nil
        
        stream = AsyncThrowingStream<Upstream.Output, Error>(Upstream.Output.self) { continuation in
            subscription = upstream
                .handleEvents(
                    receiveCancel: {
                        continuation.finish(throwing: nil)
                    }
                )
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        continuation.finish(throwing: error)
                    case .finished:
                        continuation.finish(throwing: nil)
                    }
                }, receiveValue: { value in
                    continuation.yield(value)
                })
        }
        
        cancellable = subscription
    }
    
    func cancel() {
        cancellable?.cancel()
        cancellable = nil
    }
}

extension CombineAsyncStream: AsyncIteratorProtocol {
    func next() async throws -> Upstream.Output? {
        return try await iterator.next()
    }
    
    func singleValue() async throws -> Upstream.Output? {
        let value = try await iterator.next()
        self.cancel()
        return value
    }
}

extension Publisher {
    func asyncStream() -> CombineAsyncStream<Self> {
        return CombineAsyncStream(self)
    }
}

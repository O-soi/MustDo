//
//  CommonPublisher.swift
//  Module
//
//  Created by tuna.can on 2023/01/16.
//

import Foundation
import Combine

public typealias CommonPublisher<Output> = AnyPublisher<Output, Never>
public typealias CommonCurrentValueSubject<Output> = CurrentValueSubject<Output, Never>
public typealias CommonPassthroughSubject<Output> = PassthroughSubject<Output, Never>

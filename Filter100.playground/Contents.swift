import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

//https://github.com/kodecocodes/comb-materials/blob/editions/3.0/04-filtering-operators/projects/challenge/Final.playground/Contents.swift
//使用各种过滤方法获得单行的结果  2023-03-14(Tue) 10:27:06
example(of: "Filtering One Hundred Numbers") {
    let numberPublisher = (1...100).publisher
    
    numberPublisher
        .dropFirst(50)
        .prefix(20)
        .filter { value in
            value % 2 == 0
        }
        .compactMap { value in
            String(value)
        }
        .scan("") { initial, value in
            initial.appending("\(value) ")
        }
        .last()
        .sink(receiveValue: { value in
            print(value)
        })
        .store(in: &subscriptions)
}
/*
 --- Example of: Filtering One Hundred Numbers ---
 52 54 56 58 60 62 64 66 68 70
 */
/// Copyright (c) 2021 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

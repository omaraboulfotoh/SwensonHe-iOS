//
//  Fibonacci.swift
//  ExchangeMoney
//
//  Created by User on 05/07/2021.
//

import Foundation


func fibonacciRecursive(n: Int)-> Int32 {
	if (n < 2) {
		return Int32(n)
	}
	return fibonacciRecursive(n: n - 1) + fibonacciRecursive(n: n - 2)
}


func fibonacciDp(n: Int)-> Int32 {

	// unnecessary step,
	if (n < 2) {
		return Int32(n)
	}

	var table = [Int32]()

	table[0] = 0
	table[1] = 1
	
	for i in 2...n {
		table[i] = table[i - 1] + table[i - 2]
	}

	return table[n]
}

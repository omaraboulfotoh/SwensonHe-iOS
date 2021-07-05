//
//  Anagrams.swift
//  ExchangeMoney
//
//  Created by User on 05/07/2021.
//

import Foundation


func isAnagram(first: String, second: String) -> Bool {
	// make sure no string, the second string will be checked in the next if.
	if (first.isEmpty) {
		return false
	}
	
	// make sure that the two strings are the same length.
	if (first.count != second.count) {
		return false
	}
	let firstSorted = Array(first.lowercased()).sorted()
	let secondSorted =   Array(second.lowercased()).sorted()
	
	return firstSorted == secondSorted
}

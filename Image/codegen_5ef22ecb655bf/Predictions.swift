/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Predictions : Codable {
	let description : String?
	let id : String?
	let matched_substrings : [Matched_substrings]?
	let place_id : String?
	let reference : String?
	let structured_formatting : Structured_formatting?
	let terms : [Terms]?
	let types : [String]?

	enum CodingKeys: String, CodingKey {

		case description = "description"
		case id = "id"
		case matched_substrings = "matched_substrings"
		case place_id = "place_id"
		case reference = "reference"
		case structured_formatting = "structured_formatting"
		case terms = "terms"
		case types = "types"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		matched_substrings = try values.decodeIfPresent([Matched_substrings].self, forKey: .matched_substrings)
		place_id = try values.decodeIfPresent(String.self, forKey: .place_id)
		reference = try values.decodeIfPresent(String.self, forKey: .reference)
		structured_formatting = try values.decodeIfPresent(Structured_formatting.self, forKey: .structured_formatting)
		terms = try values.decodeIfPresent([Terms].self, forKey: .terms)
		types = try values.decodeIfPresent([String].self, forKey: .types)
	}

}
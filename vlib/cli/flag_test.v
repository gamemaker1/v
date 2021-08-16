module cli2

// fn test_if_string_flag_parses() {
// 	mut flag := cli.Flag{
// 		flag: .string
// 		name: 'flag'
// 	}
// 	flag.parse(['-flag', 'value1'], false) or { panic(err) }
// 	mut value := flag.get_string() or { panic(err) }
// 	assert value == 'value1'

// 	flag = cli.Flag{
// 		flag: .string
// 		name: 'flag'
// 	}
// 	flag.parse(['-flag=value2'], false) or { panic(err) }
// 	value = flag.get_string() or { panic(err) }
// 	assert value == 'value2'

// 	flag = cli.Flag{
// 		flag: .string_array
// 		name: 'flag'
// 	}
// 	flag.parse(['-flag=value1'], false) or { panic(err) }
// 	flag.parse(['-flag=value2'], false) or { panic(err) }
// 	mut values := flag.get_strings() or { panic(err) }
// 	assert values == ['value1', 'value2']

// 	flags := [
// 		cli.Flag{
// 			flag: .string_array
// 			name: 'flag'
// 			value: ['a', 'b', 'c']
// 		},
// 		cli.Flag{
// 			flag: .string
// 			name: 'flag2'
// 		},
// 	]

// 	values = flags.get_strings('flag') or { panic(err) }
// 	assert values == ['a', 'b', 'c']
// }

// fn test_if_bool_flag_parses() {
// 	mut flag := cli.Flag{
// 		flag: .bool
// 		name: 'flag'
// 	}
// 	mut value := false
// 	flag.parse(['-flag'], false) or { panic(err) }
// 	value = flag.get_bool() or { panic(err) }
// 	assert value == true
// 	flag.parse(['-flag', 'false'], false) or { panic(err) }
// 	value = flag.get_bool() or { panic(err) }
// 	assert value == false
// 	flag.parse(['-flag', 'true'], false) or { panic(err) }
// 	value = flag.get_bool() or { panic(err) }
// 	assert value == true
// 	flag.parse(['-flag=false'], false) or { panic(err) }
// 	value = flag.get_bool() or { panic(err) }
// 	assert value == false
// 	flag.parse(['-flag=true'], false) or { panic(err) }
// 	value = flag.get_bool() or { panic(err) }
// 	assert value == true
// }

// fn test_if_int_flag_parses() {
// 	mut flag := cli.Flag{
// 		flag: .int
// 		name: 'flag'
// 	}

// 	mut value := 0
// 	flag.parse(['-flag', '42'], false) or { panic(err) }
// 	value = flag.get_int() or { panic(err) }
// 	assert value == 42

// 	flag = cli.Flag{
// 		flag: .int
// 		name: 'flag'
// 	}

// 	flag.parse(['-flag=45'], false) or { panic(err) }
// 	value = flag.get_int() or { panic(err) }
// 	assert value == 45

// 	flag = cli.Flag{
// 		flag: .int_array
// 		name: 'flag'
// 	}

// 	flag.parse(['-flag=42'], false) or { panic(err) }
// 	flag.parse(['-flag=45'], false) or { panic(err) }
// 	mut values := flag.get_ints() or { panic(err) }
// 	assert values == [42, 45]

// 	flags := [
// 		cli.Flag{
// 			flag: .int_array
// 			name: 'flag'
// 			value: ['1', '2', '3']
// 		},
// 		cli.Flag{
// 			flag: .int
// 			name: 'flag2'
// 		},
// 	]

// 	values = flags.get_ints('flag') or { panic(err) }
// 	assert values == [1, 2, 3]
// }

// fn test_if_float_flag_parses() {
// 	mut flag := cli.Flag{
// 		flag: .float
// 		name: 'flag'
// 	}
// 	mut value := f64(0)
// 	flag.parse(['-flag', '3.14158'], false) or { panic(err) }
// 	value = flag.get_float() or { panic(err) }
// 	assert value == 3.14158

// 	flag = cli.Flag{
// 		flag: .float
// 		name: 'flag'
// 	}

// 	flag.parse(['-flag=3.14159'], false) or { panic(err) }
// 	value = flag.get_float() or { panic(err) }
// 	assert value == 3.14159

// 	flag = cli.Flag{
// 		flag: .float_array
// 		name: 'flag'
// 	}

// 	flag.parse(['-flag=3.1'], false) or { panic(err) }
// 	flag.parse(['-flag=1.3'], false) or { panic(err) }
// 	mut values := flag.get_floats() or { panic(err) }
// 	assert values == [3.1, 1.3]

// 	flags := [
// 		cli.Flag{
// 			flag: .float_array
// 			name: 'flag'
// 			value: ['1.1', '2.2', '3.3']
// 		},
// 		cli.Flag{
// 			flag: .float
// 			name: 'flag2'
// 		},
// 	]

// 	values = flags.get_floats('flag') or { panic(err) }
// 	assert values == [1.1, 2.2, 3.3]
// }

// fn test_if_flag_parses_with_abbrev() {
// 	mut flag := cli.Flag{
// 		flag: .bool
// 		name: 'flag'
// 		abbrev: 'f'
// 	}
// 	mut value := false
// 	flag.parse(['--flag'], true) or { panic(err) }
// 	value = flag.get_bool() or { panic(err) }
// 	assert value == true

// 	value = false
// 	flag = cli.Flag{
// 		flag: .bool
// 		name: 'flag'
// 		abbrev: 'f'
// 	}
// 	flag.parse(['-f'], true) or { panic(err) }
// 	value = flag.get_bool() or { panic(err) }
// 	assert value == true
// }

// fn test_if_multiple_value_on_single_value() {
// 	mut flag := cli.Flag{
// 		flag: .float
// 		name: 'flag'
// 	}

// 	flag.parse(['-flag', '3.14158'], false) or { panic(err) }

// 	if _ := flag.parse(['-flag', '3.222'], false) {
// 		panic("No multiple value flag don't raise an error!")
// 	} else {
// 		assert true
// 	}
// }

// fn test_default_value() {
// 	mut flag := cli.Flag{
// 		flag: .float
// 		name: 'flag'
// 		default_value: ['1.234']
// 	}

// 	flag.parse(['-flag', '3.14158'], false) or { panic(err) }
// 	mut value := flag.get_float() or { panic(err) }
// 	assert value == 3.14158

// 	flag = cli.Flag{
// 		flag: .float
// 		name: 'flag'
// 		default_value: ['1.234']
// 	}

// 	flag.parse([''], false) or { panic(err) }
// 	value = flag.get_float() or { panic(err) }
// 	assert value == 1.234
// }

/*
Test for `Flag<T>`'s self type-checking
*/

fn test_flag_type_check() ? {
	bool_flag := Flag<bool>{
		name: 'bool-test'
	}
	bool_flag.verify() ?

	int_flag := Flag<int>{
		name: 'int-test'
	}
	int_flag.verify() ?

	list_int_flag := Flag<[]string>{
		name: 'list-string-test'
	}
	list_int_flag.verify() ?

	string_flag := Flag<string>{
		name: 'string-test'
	}
	string_flag.verify() ?

	list_string_flag := Flag<[]string>{
		name: 'list-string-test'
	}
	list_string_flag.verify() ?

	float_flag := Flag<f64>{
		name: 'float-test'
	}
	float_flag.verify() ?

	list_float_flag := Flag<[]f64>{
		name: 'list-float-test'
	}
	list_float_flag.verify() ?

	u16_flag := Flag<u16>{
		name: 'u16-test'
	}
	if _ := u16_flag.verify() {
		return error('Flag with type `u16` should throw an error!')
	}
}

/*
Test for string to other types conversion, used inside `Flag<T>`
*/

fn test_value_conversion() ? {
	assert convert<int>('32') ? == 32
	assert convert<f64>('3.245') ? == 3.245
	assert convert<string>('hello') ? == 'hello'
	if x := convert<u16>('12345') {
		return error('Attempting to convert `u16` should throw an error!')
	}
}

/*
Tests for internal parsing inside `Flag<T>`
*/

fn test_if_bool_flag_parses() ? {
	flag := Flag<bool>{
		name: 'bool'
		abbrev: 'b'
	}
	assert flag.parse('--bool', 'something') ? == true
	assert flag.parse('-b', 'something') ? == true
	if x := flag.parse('--no-bool', 'something') {
		return error('Flag with "negatable" as false shouldn\'t parse!')
	}
}

fn test_if_int_flag_parses() ? {
	flag := Flag<int>{
		name: 'int'
		abbrev: 'i'
	}
	assert flag.parse('--int', '3') ? == 3
	assert flag.parse('-i', '3') ? == 3
}

fn test_if_float_flag_parses() ? {
	flag := Flag<f64>{
		name: 'float'
		abbrev: 'f'
	}
	assert flag.parse('--float', '3.648') ? == 3.648
	assert flag.parse('-f', '3.648') ? == 3.648
}

fn test_if_string_flag_parses() ? {
	flag := Flag<string>{
		name: 'string'
		abbrev: 's'
	}
	assert flag.parse('--string', 'hello') ? == 'hello'
	assert flag.parse('-s', 'hi') ? == 'hi'
}

fn int_array_test() ? {
	flag := Flag<[]int>{
		name: 'int'
		abbrev: 's'
	}
	assert flag.parse('--int', '1,23,4,560,-1') ? == [1, 23, 4, 560, -1]
	assert flag.parse('-i', '1,23,4,560') ? == [1, 23, 4, 560]
}

fn float_array_test() ? {
	flag := Flag<[]f64>{
		name: 'float'
		abbrev: 'f'
	}
	assert flag.parse('--float', '1.2,3.45,6, -0.25') ? == [1.2, 3.45, 6, -0.25]
	assert flag.parse('-f', '1.2,3.45,6,-0.25') ? == [1.2, 3.45, 6, -0.25]
}

fn string_array_test() ? {
	flag := Flag<[]string>{
		name: 'string'
		abbrev: 's'
	}
	assert flag.parse('--string', 'linux,windows,darwin,android') ? == ['linux', 'windows', 'darwin', 'android']
	assert flag.parse('-s', 'linux,windows,darwin,android') ? == ['linux', 'windows', 'darwin', 'android']
}

fn test_if_array_parses() ? {
	int_array_test() ?
	float_array_test() ?
	string_array_test() ?

	flag := Flag<[]u16>{
		name: 'usixteen'
		abbrev: 'u'
	}
	if x := flag.parse('--usixteen', '16') {
		return error('[]u16 flag shouldn\'t be parsed!')
	}
}
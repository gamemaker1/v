import cli

fn test_if_string_flag_parses() {
	mut flag := cli.Flag{
		flag: .string
		name: 'flag'
	}
	flag.parse(['-flag', 'value1'], false) or { panic(err) }
	mut value := flag.get_string() or { panic(err) }
	assert value == 'value1'

	flag = cli.Flag{
		flag: .string
		name: 'flag'
	}
	flag.parse(['-flag=value2'], false) or { panic(err) }
	value = flag.get_string() or { panic(err) }
	assert value == 'value2'

	flag = cli.Flag{
		flag: .string_array
		name: 'flag'
	}
	flag.parse(['-flag=value1'], false) or { panic(err) }
	flag.parse(['-flag=value2'], false) or { panic(err) }
	mut values := flag.get_strings() or { panic(err) }
	assert values == ['value1', 'value2']

	flags := [
		cli.Flag{
			flag: .string_array
			name: 'flag'
			value: ['a', 'b', 'c']
		},
		cli.Flag{
			flag: .string
			name: 'flag2'
		},
	]

	values = flags.get_strings('flag') or { panic(err) }
	assert values == ['a', 'b', 'c']
}

fn test_if_bool_flag_parses() {
	mut flag := cli.Flag{
		flag: .bool
		name: 'flag'
	}
	mut value := false
	flag.parse(['-flag'], false) or { panic(err) }
	value = flag.get_bool() or { panic(err) }
	assert value == true
	flag.parse(['-flag', 'false'], false) or { panic(err) }
	value = flag.get_bool() or { panic(err) }
	assert value == false
	flag.parse(['-flag', 'true'], false) or { panic(err) }
	value = flag.get_bool() or { panic(err) }
	assert value == true
	flag.parse(['-flag=false'], false) or { panic(err) }
	value = flag.get_bool() or { panic(err) }
	assert value == false
	flag.parse(['-flag=true'], false) or { panic(err) }
	value = flag.get_bool() or { panic(err) }
	assert value == true
}

fn test_if_int_flag_parses() {
	mut flag := cli.Flag{
		flag: .int
		name: 'flag'
	}

	mut value := 0
	flag.parse(['-flag', '42'], false) or { panic(err) }
	value = flag.get_int() or { panic(err) }
	assert value == 42

	flag = cli.Flag{
		flag: .int
		name: 'flag'
	}

	flag.parse(['-flag=45'], false) or { panic(err) }
	value = flag.get_int() or { panic(err) }
	assert value == 45

	flag = cli.Flag{
		flag: .int_array
		name: 'flag'
	}

	flag.parse(['-flag=42'], false) or { panic(err) }
	flag.parse(['-flag=45'], false) or { panic(err) }
	mut values := flag.get_ints() or { panic(err) }
	assert values == [42, 45]

	flags := [
		cli.Flag{
			flag: .int_array
			name: 'flag'
			value: ['1', '2', '3']
		},
		cli.Flag{
			flag: .int
			name: 'flag2'
		},
	]

	values = flags.get_ints('flag') or { panic(err) }
	assert values == [1, 2, 3]
}

fn test_if_float_flag_parses() {
	mut flag := cli.Flag{
		flag: .float
		name: 'flag'
	}
	mut value := f64(0)
	flag.parse(['-flag', '3.14158'], false) or { panic(err) }
	value = flag.get_float() or { panic(err) }
	assert value == 3.14158

	flag = cli.Flag{
		flag: .float
		name: 'flag'
	}

	flag.parse(['-flag=3.14159'], false) or { panic(err) }
	value = flag.get_float() or { panic(err) }
	assert value == 3.14159

	flag = cli.Flag{
		flag: .float_array
		name: 'flag'
	}

	flag.parse(['-flag=3.1'], false) or { panic(err) }
	flag.parse(['-flag=1.3'], false) or { panic(err) }
	mut values := flag.get_floats() or { panic(err) }
	assert values == [3.1, 1.3]

	flags := [
		cli.Flag{
			flag: .float_array
			name: 'flag'
			value: ['1.1', '2.2', '3.3']
		},
		cli.Flag{
			flag: .float
			name: 'flag2'
		},
	]

	values = flags.get_floats('flag') or { panic(err) }
	assert values == [1.1, 2.2, 3.3]
}

fn test_if_flag_parses_with_abbrev() {
	mut flag := cli.Flag{
		flag: .bool
		name: 'flag'
		abbrev: 'f'
	}
	mut value := false
	flag.parse(['--flag'], true) or { panic(err) }
	value = flag.get_bool() or { panic(err) }
	assert value == true

	value = false
	flag = cli.Flag{
		flag: .bool
		name: 'flag'
		abbrev: 'f'
	}
	flag.parse(['-f'], true) or { panic(err) }
	value = flag.get_bool() or { panic(err) }
	assert value == true
}

fn test_if_multiple_value_on_single_value() {
	mut flag := cli.Flag{
		flag: .float
		name: 'flag'
	}

	flag.parse(['-flag', '3.14158'], false) or { panic(err) }

	if _ := flag.parse(['-flag', '3.222'], false) {
		panic("No multiple value flag don't raise an error!")
	} else {
		assert true
	}
}

fn test_default_value() {
	mut flag := cli.Flag{
		flag: .float
		name: 'flag'
		default_value: ['1.234']
	}

	flag.parse(['-flag', '3.14158'], false) or { panic(err) }
	mut value := flag.get_float() or { panic(err) }
	assert value == 3.14158

	flag = cli.Flag{
		flag: .float
		name: 'flag'
		default_value: ['1.234']
	}

	flag.parse([''], false) or { panic(err) }
	value = flag.get_float() or { panic(err) }
	assert value == 1.234
}

fn test_flag_type_check() {
	bool_flag := cli.Flag<bool>{name: 'bool-test'}
	bool_flag.verify() ?

	int_flag := cli.Flag<int>{name: 'int-test'}
	int_flag.verify() ?

	list_int_flag := cli.Flag<[]string>{name: 'list-string-test'}
	list_int_flag.verify() ?

	string_flag := cli.Flag<string>{name: 'string-test'}
	string_flag.verify() ?

	list_string_flag := cli.Flag<[]string>{name: 'list-string-test'}
	list_string_flag.verify() ?

	float_flag := cli.Flag<float>{name: 'float-test'}
	float_flag.verify() ?

	list_float_flag := cli.Flag<[]float>{name: 'list-float-test'}
	list_float_flag.verify() ?

	// TODO: this should throw an error
	u16_flag := cli.Flag<u16>{name: 'u16-test'}
	list_float_flag.verify() ?
}
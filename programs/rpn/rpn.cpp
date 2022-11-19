#include <cmath>
#include <iostream>

namespace Calculator {
	enum class Operation {
		MOD,
		MUL,
		SUB,
		ADD,
		DIV,
		NONE,
		EXP,
	};
	typedef long double number_t;

	class Mather {
	private:
		number_t x;
	public:
		Mather();
		Mather(number_t);
		Mather(long long);
		Mather(int);
		~Mather();
		Mather& add(number_t);
		Mather& div(number_t);
		Mather& mul(number_t);
		Mather& sub(number_t);
		Mather& mod(long long);
		Mather& reset();
		Mather& set(number_t);
		Mather& pow(number_t);
		number_t getValue();
		Mather& append(Operation, number_t);
	};
	
	Mather::Mather() {
		this->reset();
	}
	
	Mather::Mather(number_t y) {
		this->set(y);
	}
	
	Mather::Mather(long long y) {
		this->set((number_t)y);
	}
	
	Mather::Mather(int y) {
		this->set((number_t)y);
	}
	
	Mather::~Mather() {
		
	}

	Mather& Mather::add(number_t y) {
		this->x += y;
		return *this;
	}

	Mather& Mather::div(number_t y) {
		this->x /= y;
		return *this;
	}

	Mather& Mather::mul(number_t y) {
		this->x *= y;
		return *this;
	}

	Mather& Mather::sub(number_t y) {
		this->x -= y;
		return *this;
	}

	Mather& Mather::mod(long long y) {
		this->x = ((long long)this->x % (long long)y);
		return *this;
	}

	Mather& Mather::reset() {
		this->x = 0.0D;
		return *this;
	}
	
	Mather& Mather::set(number_t y) {
		this->x = y;
		return *this;
	}

	Mather& Mather::pow(number_t y) {
		this->x = std::pow(this->x, y);
		return *this;
	}
	
	number_t Mather::getValue() {
		return this->x;
	}

	Mather& Mather::append(Operation op, number_t y) {
		switch(op) {
		case Calculator::Operation::MOD: return this->mod(y);
		case Calculator::Operation::MUL: return this->mul(y);
		case Calculator::Operation::SUB: return this->sub(y);
		case Calculator::Operation::ADD: return this->add(y);
		case Calculator::Operation::DIV: return this->div(y);
		case Calculator::Operation::EXP: return this->pow(y);
		default:
			return *this;
		}
	}
	Operation parse(char op) {
		switch(op) {
		case '%':	return Calculator::Operation::MOD;
		case '*':	return Calculator::Operation::MUL;
		case '-':	return Calculator::Operation::SUB;
		case '+':	return Calculator::Operation::ADD;
		case '/':	return Calculator::Operation::DIV;
		case '^':	return Calculator::Operation::EXP;
		default:	return Calculator::Operation::NONE;
		}
	}
}

int main(void) {
	Calculator::Mather m;
	Calculator::number_t x = 0.0D, y = 0.0D;
	char opc;
	Calculator::Operation op;
	while(std::cin >> opc) {
		if(std::cin >> x) {
			if(std::cin >> y) {
				m.set(x);
				op = Calculator::parse(opc);
				if(op == Calculator::Operation::NONE) {
					std::cerr << "Error: unknown operator: '" << opc << "'" << std::endl;
					return 3;
				}
				std::cout << m.append(op, y).getValue() << std::endl;
			} else {
				return 2;
			}
		} else {
			return 1;
		}
	}
	return 0;
}

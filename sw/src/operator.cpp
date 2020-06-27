#include <ready/operator.h>

Operator::Operator(int id, int op_code, int type, std::string label) : id(id), opCode(op_code), type(type), srcA(-1), srcB(-1),
                                                    branchIn(-1), level(0), dataFlowId(-1),label(std::move(label)) {}

Operator::Operator(int id, int op_code, int type, std::string label, int constant) : id(id), opCode(op_code), type(type),
                                                                  srcA(-1), srcB(-1), branchIn(-1), constant(constant),
                                                                  level(0), dataFlowId(-1),label(std::move(label)) {}

Operator::~Operator() {
    Operator::dst.clear();
}

int Operator::getId() const {
    return id;
}

void Operator::setId(int id) {
    Operator::id = id;
}

int Operator::getOpCode() const {
    return Operator::opCode;
}

void Operator::setOpCode(int op_code) {
    Operator::opCode = op_code;
}

int Operator::getType() const {
    return type;
}

void Operator::setType(int type) {
    Operator::type = type;
}

int Operator::getVal() const {
    return val;
}

void Operator::setVal(int val) {
    Operator::val = val;
}

std::vector<int> &Operator::getDst() {
    return Operator::dst;
}

int Operator::getSrcA() const {
    return srcA;
}

void Operator::setSrcA(int srcA) {
    Operator::srcA = srcA;
}

int Operator::getSrcB() const {
    return srcB;
}

void Operator::setSrcB(int srcB) {
    Operator::srcB = srcB;
}

int Operator::getConstant() const {
    return constant;
}

void Operator::setConstant(int constant) {
    Operator::constant = constant;
}

void Operator::setLevel(int level) {
    Operator::level = level;
}

int Operator::getLevel() {
    return Operator::level;
}

int Operator::getBranchIn() const {
    return branchIn;
}

void Operator::setBranchIn(int branchIn) {
    Operator::branchIn = branchIn;
}

void Operator::setDataFlowId(int dataFlowId) {
    Operator::dataFlowId = dataFlowId;
}

int Operator::getDataFlowId() {
    return Operator::dataFlowId;
}

int Operator::getPortA() {
    return PORT_A;
}

int Operator::getPortB() {
    return PORT_B;
}

int Operator::getPortBranch() {
    return PORT_BRANCH;
}
const std::string &Operator::getLabel() const {
    return label;
}


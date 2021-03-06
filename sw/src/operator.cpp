#include <ready/operator.h>

Operator::Operator(int id, int op_code, int type, std::string label) :
        id(id),
        level(0),
        opCode(op_code),
        type(type),
        val(0),
        constant(0),
        srcA(nullptr),
        srcB(nullptr),
        branchIn(nullptr),
        dataFlowId(-1),
        label(std::move(label)),
        isEnd(false)
        {

}

Operator::Operator(int id, int op_code, int type, std::string label, int constant) :
        id(id),
        level(0),
        opCode(op_code),
        type(type),
        val(0),
        constant(constant),
        srcA(nullptr),
        srcB(nullptr),
        branchIn(nullptr),
        dataFlowId(-1),
        label(std::move(label)),
        isEnd(false) {

}

Operator::~Operator(){
    dst.clear();
}

int Operator::getId() const {
    return Operator::id;
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
    return Operator::type;
}

void Operator::setType(int type) {
    Operator::type = type;
}

short Operator::getVal() const {
    return Operator::val;
}

void Operator::setVal(int val) {
    Operator::val = val;
}

std::vector<Operator *> &Operator::getDst() {
    return Operator::dst;
}

Operator *Operator::getSrcA() const {
    return Operator::srcA;
}

void Operator::setSrcA(Operator *srcA) {
    Operator::srcA = srcA;
}

Operator *Operator::getSrcB() const {
    return Operator::srcB;
}

void Operator::setSrcB(Operator *srcB) {
    Operator::srcB = srcB;
}

int Operator::getConst() const {
    return constant;
}

void Operator::setConst(int constant) {
    Operator::constant = constant;
}

void Operator::setLevel(int level) {
    Operator::level = level;
}

int Operator::getLevel() const {
    return Operator::level;
}

Operator *Operator::getBranchIn() const {
    return Operator::branchIn;
}

void Operator::setBranchIn(Operator *branchIn) {
    Operator::branchIn = branchIn;
}

void Operator::setDataFlowId(int dataFlowId) {
    Operator::dataFlowId = dataFlowId;
}

int Operator::getDataFlowId() const {
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
    return Operator::label;
}

int Operator::getIsEnd() const {
    return Operator::isEnd;
}

void Operator::setIsEnd(bool isEnd) {
    Operator::isEnd = isEnd;
}


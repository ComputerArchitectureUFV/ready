#ifndef CGRASCHEDULER_OPERATOR_H
#define CGRASCHEDULER_OPERATOR_H

#include <vector>
#include <string>

#include <ready/cgra_arch_defs.h>

class Operator {

private:
    int id;
    int level;
    int opCode;
    int type;
    int val;
    int constant;
    int srcA;
    int srcB;
    int branchIn;
    std::vector<int> dst;
    int dataFlowId;
    std::string label;

public:
    Operator(int id, int op_code, int type, std::string label);

    Operator(int id, int op_code, int type,  std::string label, int constant);

    ~Operator();

    int getId() const;

    void setId(int id);

    int getOpCode() const;

    void setOpCode(int op_code);

    int getType() const;

    void setType(int type);

    int getVal() const;

    void setVal(int val);

    int getSrcA() const;

    void setSrcA(int srcA);

    int getSrcB() const;

    void setSrcB(int srcB);

    int getBranchIn() const;

    void setBranchIn(int branchIn);

    std::vector<int> &getDst();

    //virtual void compute() = 0;

    int getConstant() const;

    void setConstant(int constant);

    void setLevel(int level);

    int getLevel();

    void setDataFlowId(int dataFlowId);

    int getDataFlowId();

    int getPortA();

    int getPortB();
    
    int getPortBranch();
    
    const std::string &getLabel() const;

};


#endif //CGRASCHEDULER_OPERATOR_H

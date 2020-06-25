from veriloggen import *


def make_reg_pipe():
    m = Module('reg_pipe')
    num_stages = m.Parameter('NUM_STAGES', 1)
    data_width = m.Parameter('DATA_WIDTH', 16)

    clk = m.Input('clk')
    rst = m.Input('rst')
    en = m.Input('en')
    data_in = m.Input('in', data_width)
    data_out = m.Output('out', data_width)

    regs = m.Reg('regs', data_width, num_stages)
    i = m.Integer('i')
    m.EmbeddedCode('')
    data_out.assign(regs[num_stages - 1])
    m.Always(Posedge(clk))(
        If(rst)(
            For(i(0), i < num_stages, i.inc())(
                regs[i](0)
            )
        ).Else(
            If(en)(
                regs[0](data_in),
                For(i(1), i < num_stages, i.inc())(
                    regs[i](regs[i - 1])
                )
            )
        )
    )

    m.Initial(
        For(i(0), i < num_stages, i.inc())(
            regs[i](0)
        )
    )

    return m

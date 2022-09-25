import cpp

from Function magic_func,Function g_resolve,FunctionCall g_setva_fc,VariableAccess va,VariableAccess setnull_va,Expr e_tmp1,Expr e,FunctionCall fc,FunctionCall fc_tmp1,FunctionCall fc_tmp2,FunctionCall fc_tmp3,FunctionCall fc_tmp4,FunctionCall fc_tmp5
where g_resolve.getName().regexpMatch("ResolvePromiseInternal")
and g_resolve.getParentScope().toString().matches("js")
// mMember
and va.getControlFlowScope()=magic_func
and va.getEnclosingFunction() = magic_func
and va.getTarget().getName().regexpMatch("m([A-Z])((.)*)")
and not va.getTarget().getName().matches("mImpl")
// mMember->trigger()->js::ResolvePromiseInternal()
and e.getEnclosingFunction() = magic_func
and fc.getEnclosingFunction() = magic_func
and fc.getTarget().getName().matches("operator->")
and va.getParent() = fc
and fc.getParent() = fc_tmp1
and fc_tmp1.getTarget() = fc_tmp2.getEnclosingFunction()
and fc_tmp2.getTarget() = fc_tmp3.getEnclosingFunction()
and fc_tmp3.getTarget() = fc_tmp4.getEnclosingFunction()
and fc_tmp4.getTarget() = fc_tmp5.getEnclosingFunction()
and fc_tmp5.getTarget() = g_resolve
// exists: mMember = NULL
and setnull_va.getTarget()=va.getTarget()
and g_setva_fc.getTarget().getName().matches("operator=")
and setnull_va.getParent() = g_setva_fc
and e_tmp1.toString().matches("0")
and e_tmp1.getParent() = g_setva_fc
select magic_func,magic_func.getParentScope(),va,g_setva_fc,fc_tmp1

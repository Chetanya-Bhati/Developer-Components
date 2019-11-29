trigger trigger_opschk on Opportunity (before insert) {
    trg_cls.check_ops(trigger.new);
}
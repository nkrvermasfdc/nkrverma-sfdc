trigger tst1 on Opportunity (before insert) {
    system.debug('From Developer Console');
}
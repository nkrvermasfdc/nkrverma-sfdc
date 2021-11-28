trigger NonExistentId on Case (after insert) {
    for(case mycase :Trigger.new){
    /*CaseComment cc = new CaseComment();
    cc.CommentBody = 'Case received by Agent';
    cc.ParentId    = mycase.Id;
    insert cc;*/
    }
}
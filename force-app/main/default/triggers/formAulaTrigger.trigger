trigger formAulaTrigger on Account (after insert, after delete, after update, before insert) {
    if(Trigger.isInsert) {
        if(Trigger.isBefore) {
            formAulaTriggerHandler.beforeInsert(Trigger.New);
        }
        if (Trigger.isAfter) {
            //formAulaTriggerHandler.afterInsert(Trigger.New);
        }
    }
}
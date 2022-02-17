trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Task> taskList = new List<Task>();
    
    for(Opportunity oportunidade : Trigger.New) {
        if (oportunidade.StageName == 'Closed Won') {
            
            taskList.add(new Task(Subject='Follow Up Test Task' , WhatId=oportunidade.Id ));
        }           
    }
  
        insert taskList;

    
}
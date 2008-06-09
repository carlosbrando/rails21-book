##Bug fixes in change\_column

It was fixed an existing bug when using the **change\_column** method with **:null => true** in a column created using **:null => false**. Because of this bug no changes were made when using the method.
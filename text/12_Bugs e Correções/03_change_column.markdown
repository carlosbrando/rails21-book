##Bug fixes in change\_column

An existing bug when using the **change\_column** method with **:null => true** in a column created using **:null => false** was also fixed. Because of this bug no changes were made when using the method.
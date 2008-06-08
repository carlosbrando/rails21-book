## Option :select in has\_one and belongs\_to

The already known methods **has\_one** and **belongs\_to** just got a now option: **:select**.

Its default value is "*" (as in "SELECT * FROM table"), but you can edit it to retrieve only the columns you are going to be using.
     
Don't forget to include the **primary** and **foreign keys**, otherwise you will get an error.

The **belongs_to** method does not have the option **:order** anymore. But don't worry, because it didn't really have a use.

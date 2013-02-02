OpenDataBetes
=============

###an all-inclusive data-format to store diabetes treatment information. 

We are currently at version 0.000, so there's not much to download, but there's a lot of work to be done

Once the dataformat is all shiny and nice, the primary focus will shift to providing conversions for other systems into the opendatabetes format. Ultimately it would be completely awesome to have a conversion for every pump, glucometer and diabetes app out there.

Right now there are hundreds of fragmented solutions for tracking blood glucose and insulin, exercise, life information that relate to living with diabetes. Most are proprietary. Every company has its own method of tracking and storing the data and they don't tend to play nice with each other.

Open-data-betes started because I wanted to make my own Diabetes management application, but I didn't want to exclude users of specific devices or treatment strategies. I was disappointed that with the proliferation of Diabetes Management tools, nothing existed that was really universal, and all the valuable data was essentially being siloed.

After completing a rough prototype of [Sanguine Diabetes Manager][1], I realized that there was a better first step. Rather than adding one more management application to help expediate putting any tech-using diabetic into decision paralysis, I ought to focus on the foundation of the community: Encourage DiabetesIT development to behave in a progressive, open, helpful way; much like the front-end web community does.

So to get the ball rolling, here is a github repo and a readme.

If you're interested in contributing to this project, or if there's other projects already doing this that I haven't found please contact me.

For an inventory of existing formats in the wild, the [Diabetes Data Wiki][2] is a good place to start, the author [farrell paper][3] also has some suggestions.

> ~bewest
> Is there a way to re-use git/npm/egg style compilations of data, so that there is a sane structure of plain text files?
> These are easy to work with/reformat into csv/json/xml, etc, and we will need many adapters.
> This way, I could point the tool, `sanguine <git://github.com/bewest/my-data.git>` or `insulaudit upload git@github.com:bewest/my-phr.git`
> We can bundle some basic tools to verify/reformat data, and it provides a nice audit trail on what software has done to it, and is endlessly extensible.


[1]: http://www.sanguinediabetes.com "Sanguine Diabetes Manager website"
[2]: http://diabetesdata.pbworks.com/w/page/17680096/FrontPage "Diabetes Data Wiki"
[3]: http://www.journalofdst.org/pdf/March2007/VOL-1-2-CGM1-FARRELL.pdf "farrell paper"

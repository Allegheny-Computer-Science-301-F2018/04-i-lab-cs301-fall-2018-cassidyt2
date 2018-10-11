# Name: Thomas Cassidy
# Date: 10/9/2018

Question 7.
To find the answer to this question, I didn't start off looking online. I rearranged the us_contagious_diseases data and 
omitted the measles points to see if the disease rates of the other illnesses behaved any differently than measles. Using this 
code:
notMeas <- filter(us_contagious_diseases, !(us_contagious_diseases$disease == measles))
notMeasRatePerHundredK <- mutate(notMeas, rate = (((notMeas$count * 100000)/notMeas$population) (notMeas$weeks_reporting/52)))
ggplot(data = notMeasRatePerHundredK) +
     geom_point(mapping = aes(x = notMeasRatePerHundredK$year, y = notMeasRatePerHundredK$count, color = 
     notMeasRatePerHundredK$disease))
I discovered that all the diseases had similar trends in rates to measles, which deems them worth at least an initial 
investigation. Then, using this article: https://www.ncbi.nlm.nih.gov/books/NBK332896/ figure 14-8 I discovered more charts 
and data to support my claim in the lab that the correlation between decreasing disease rates and increasing autism rates was 
not equal to causation. Autism rates have been increasing, but the CORRECT DIAGNOSES of autism has been increasing while 
broader 'intellectual disability' diagnoses have been decreasing. This warrants an examination into the effects of all 
vaccines, not just measles, to further disprove the faulty and tenuous line drawn between vaccines and autsim.

Question 8.
8.1: The damage is that millions of children go unvaccinated, putting them and their classmates at great risk for life-
threatening illnesses.
8.2: It is the primary responsibility of academic research groups to ensure that what they publish is as accurately 
researched, analyzed, and vetted as possible before publishing it. 
8.3: The modern anti-vaxxer movement in the USA is evidence that this is not enough. A way to continue trying to counteract 
this is with honest and effective health education.

Question 9.
These two data sets, the immunization efforts for Measles and Rubella and the incidents reported of these diseases could be 
used to measure the efficacy of vaccines.

http://www.who.int/immunization/monitoring_surveillance/data/en/
7.2. Summary of Measles-Rubella Supplementary Immunization Activities, 2000-2018

http://www.who.int/immunization/monitoring_surveillance/burden/vpd/surveillance_type/active/measles_monthlydata/en/
Distribution of measles cases by country and by month, 2011-2018

Question 10.
   While I enjoyed the talk given during the lab on Friday, the speakers seemed a little less on track and focused than our 
first speaker did. He had come in with a powerpoint prepared with several different points he wanted to talk about, while they
seemed to have less of a plan on what they wanted to talk about. They did have several interesting points, however, and I 
found the examples they highlighted of correlation ≠ causation. Before the talk I'd had no idea that morning sickness was 
indicative of a healthy pregnancy, but had heard the caffeine wasn't good for a developing baby. I never thought about the 
fact that perhaps the women who were able to drink coffee were already not having a healthy pregnancy; the coffee wasn't 
causing unhealthy babies, the mothers drinking coffee were having unhealthy pregnancies to begin with.
    The other point I found particularly helpful was their explanation of how integral data analytics is to their fields, and 
how few doctors and health professionals have meaninful experience with the field. It supported a lot of what we've discussed 
in class: the sheer versatility of the skills we're learning, and the broad range real world data sets we now have the tools 
to get answers from. 


data source: https://www.dds.ca.gov/Autism/docs/AutismReport_2007.pdf

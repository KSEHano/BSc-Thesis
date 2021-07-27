

Abstract

\section{Introduction}

what I want to do

Machine translation (MT) systems have been on the rise and seem to get better. In everyday lives an MT is already often used privately or by corporations to translate the fast changing content like social media feeds [@book]. The quality of them is still questionable but they are improving. When evaluating the quality of a translation human evaluation is still the standard. While it is more accurate it is time consuming and expensive. For that reason an automatic evaluation could possible augment human evaluation which is already done  [@book pp. 24-27; @BetterTrans] . @BetterTrans showed that automatic evaluation can help improve MT when integrated in the development or learning process of an MT system. An automatic evaluation is very useful during the optimization process of a MT system. It is faster and less expensive than a human evaluation and can therefore be repeatedly used during the development of a MT system. Additionally an automatic evaluation seemingly is more objective than human evaluation [@book pp. 24-27]. Despite the advantages of an automatic evaluation they are still lacking and a human evaluation remains the gold standard to judge a translation FIND CITATION. For that reason automatic evaluation strives to have high correlation with human evaluation [@BLEU; @TER].  Automated evaluation is an important tool for the improvement and the translation quality assessment of MT system.



One of the groups most interested in the development of MT are professional translators. They question if MT will be part of the work flow in the future for professional translations. I worked with a translation company from Osnabrück that questioned how good the MTs are in specialized fields. The company often translates computer and machine manuals into many different languages. This is a specialized field with its own phrases that need to be translated in context. I wanted to work on test several MT system against each other and compare them to human translations.  I decided to use two language pairs for the comparison English-German and English-Czech. English-German is a common translation pair that is often translated and MT in this language pair could be very similar to a human translation. Czech, while still a European language with a Latin alphabet, is translated less often. My source translation for English-Czech translation was a shortened version of the same manual I used for the English-German pair. It is often the case that translations into Czech are only done on shortened versions of manuals and not on full versions. I did not work with the whole manual but with four chapters on the use of the software of a printer. In my work I want to compare the translations of different MT engines. In the end I want to see how good the translations are compared to each other and to a professional human translation.  To make this judgment I used a human and an automatic evaluation. 

  

In the remainder of this part I will introduce the computational metric I used for comparison. In part two I will show the current state of research. After that I will explain my experiment method, present the results, discuss them and finally I will draw a conclusion.

\subsection{BLEU}

The BLEU score is one of the older scores but still often used to compare translations [@BLEU pp. 24-27; @book; @Clarity]. It is a simple score and similar enough to human interpretation to still be of relevance. Although many better tools have been developed since the introduction of BLEU it is still widely used in the community [@book pp. 24-27; @Clarity] Some of the reasons are that BLEU has a low computation time and is easy to run and can be integrated into the code for training a MT system [@METEOR]. 



The BLEU score does not give an indication of an objectively good translation but a similarity measure between a hypothesis translation and a reference translation done by a professional translator. It works as follows, the computer is given at least one reference and compares this reference to a hypothesis, a MT of the same source text [@BLEU]. Then it compares the n-grams, a segment with the number of words *n*, of the hypothesis with the references. To avoid the overuse of a word with high frequency like "the" the maximum number of a word in one reference is counted [@BLEU]. Another problem is the length of a sentence. BLEU prefers shorter sentences to avoid that problem, a "brevity penalty" is introduced if the hypothesis sentence is shorter than the closest reference in terms of length  reference sentence [@BLEU]. However, this is often not enough and short sentences still have a higher score I AM SURE I READ THAT IN A PAPER. Originally BLEU could boast a good correlation with human judgment of the translation but since the publication of the paper a host of different metrics have emerged that give a result closer to the human judgment CITE THAT COMPARISON STUDY. The easy use of BLEU gives us an orientation for the quality of a translation and can be applied with even little resources. One reference can be enough but when the scoring of a whole corpus the reference translation should be done by more than one translator to give an accurate end result, because it works with references for each sentence it is also language independent there is only the need for a reference translation [@BLEU]. All this makes BLEU a simplistic but relatively easy tool and it is understandably still a standard.

math for bleu

The measure BLEU is mainly based on is the so called precision. $P =  m/t$ m being the number of matches and t being the number of n-grams in the hypothesis [@recall]. This however is not all. the use of  n-grams allows for an assessment of adequacy, that is if the translation has the correct words, with the use of unigram matches, as well as fluency, that is if the translation is readable as a coherent sentence, with the use of higher n-gram matches. So the basic BLEU score is based on the $p{all} = sum{i =1; N} w{i}* m{i}/t{i}$ where N is equal to 4, the biggest n-grams considered and w{i} are the weights for the n-grams and $w{i} = 1/N$ [@BLEU]. BLEU in its entirety is based on this calculation but still a little more complex especially as it is mostly done one a whole corpus.

SDL Trados

DeepL

deepL and Microsoft translator (customized) in Schweizer post studie

Google

Google Translate is a freely available online MT engine. As such it is often used in studies CITE ENGLISH CROATION AND LOOK IF I HAVE A STUDY THAT LOOKS INTO GT. 

Bing





\section{State of the Research}

Automatic translation is a useful tool that is used to evaluate the  quality of translations fast and cheap. BLEU is still widely used but  beside that many other metrics have emerged. The goal is to create a  metric which gives results that correlate better with human judgment  than BLEU. In the following I will present some of the problems that  BLEU has and some other metrics and how they work.

BLEU is an old metric, especially in the fast changing field of  computer science. It is still relevant because it is fast and easy to  use. This ease of use and speed however comes at the price of its  quality. BLEU has several flaws that other publications try to fix in  their own metrics. The problems that appear in BLEU are inaccurate  scores for single sentences or segments, a reliance on exact word  matches and no recall.

The first problem of BLEU that other metrics try to improve are the  inaccurate scores for single sentences [@METEOR]. This is certainly a  problem I had as well. The BLEU score is calculated via a geometric mean that leads to the problem that often scores are 0 if one of the n-grams are 0. This problem can be avoided by changing the weights. The problem is than that the weights can not be freely manipulate to have a good correlation with  human judgment. The score should not be so strongly influenced by the  absence of a n-gram. A more accurate score for single segments would be  useful in the fine-tuning of MT systems [@METEOR]. Therefore automatic  translation evaluation could profit from a more accurate sentence score. Solving the following problems can also help with the accuracy of the  score for single sentences.

One of the other problems is that BLEU needs exact matches. The BLEU metric also does not consider synonyms and words  with the same stem as a match. That is a problem as adequate alternative translations in terms of synonyms are not considered to be good  translations [@METEOR]. There are infinitely many correct translations.  Not recognizing alternative translations leads to the fact that there  many correct translations are not recognized as such [@TERp p.118]. To  alleviate this problem BLEU can use several different translations but  even with those only small subset of all possible good translations can  be considered by BLEU. @recall even suggest that stemming reference and  hypothesis already improves the accuracy of a metric.  A metric could  profit by matching synonyms and different word forms even if that has  higher computational cost for matching words and an additional resources are needed in that process.

Another point that is not considered in BLEU is recall. Recall is the number of matches divided by the number of words or n-grams in the *reference* [@recall]. The main calculation in BLEU is the so called *precision* which is the number of matched n-grams divided by the total number of fords in the *hypothesis* [@BLEU]. The reason BLEU uses precision instead of recall is that  recall has to work with the reference which matches the hypothesis the  best. On the other hand, BLEU can combine the matches of several  references and combine those to calculate the scores. BLEU includes a  brevity penalty to avoid that shorter translations are always preferred. However, the results in @recall suggest that the penalty is not enough  to get results with good correlation with human judgment. Considering  the study, recall seems to be a powerful tool  to achieve good  correlation with human judgment and should be a part of a metric and  heavily weighted. Recall could be a tool to improve correlation but it  must be considered how to include it if one wants to pick matches from  several references to further improve the accuracy of the scores.

Considering the problems with BLEU, several alternative metrics have  emerged to tackle the problems of BLEU. Here I include three of the most well known metrics that are alternatives to BLEU namely NIST [@NIST], METEOR [@METEOR]  and TER [@TER] including the two variants of Ter HTER and TER-Plus [@TERp]. NIST is the most similar to BLEU, METEOR includes several measures to improve on  BLEU and TER is the most distinct of the three.

@NIST have developed the evaluation metric that resembles BLEU the  most, it is called NIST. Like all the automatic evaluation methods NIST  requires at least one reference translation. Further it compares the  different n-grams of the reference or references to the hypothesis and  gives the whole segment a score. NIST improves on BLEU by including  information weights, i. e. that n-grams with a lower chance of  co-occurrence are weighted more heavily than those with a high chance of co-occurrence [@NIST]. With those improvements NIST has a slightly  higher correlation with human judgment in terms of recognising adequacy  but not fluency [@NIST]. NIST is very similar to BLEU and improves  slightly on it in terms of correlation with human judgment.

METEOR  relies on a human made reference translation to score the MT like BLEU  and NIST. One of the big problems in BLEU is that there words have to be *exactly* the same to be considered a match, as mentioned above. METEOR works around this problem, it can match synonyms as well as word stems with the help of a word net [@METEOR]. This helps to give a more  accurate score as it better considers alternative translations as  adequate. Another change in comparison to BLEU is that METEOR supports  recall and has three tuneable parameters [@METEOR]. The three parameters can be tuned to better correlate with human judgment depending on the  MT system given. The first parameter controls the weights for precision  and recall, the second the shape of the penalty function and the third  the weights of the penalty [@METEOR]. These parameters help to tune the  metric to the system it is evaluating and give a scores that better  correlates with human judgment. METEOR changes BLEU by considering  synonyms and word stems, including recall and having three tuneable  parameters to get a better correlation with human judgment.

Other than the the previous two the TER score does not measure the  how different a translation is from a reference translation, instead it  measures how many edits have to be performed to change a MT into the  closest human reference [@TER]. Hence the name *translation edit rate* or TER. Edits include deletions, insertions, substitutions and shifts.  To reduce the processing time to find the minimal number of edits for a  given segment the algorithm first calculates the shift, that reduces the number of edits the most with a greedy search algorithm and then the  other edits [@TER]. This is the basic algorithm but there are two  versions of it.

The first variant is the *human-targeted translation edit rate*  or HTER. Additionally to the references of human translations there is a human targeted reference. This means that human annotator, that are  fluent in the target language are given the MT and the references. Then  edit the MT reference with minimal edits to be a fluent and adequate  translation [@TER]. The edited MT translation is then used as another  reference to calculate the score. This can be used when working on a MT  system as the translation do not change that much with every change in  the MT system. If they do change, the annotators can work on the  segments that changed again. The most pressing problem here is that the  annotators have to work on each sentence. This is time and cost  consuming as they need 3 to 7 minutes per sentence [@TER]. So while HTER is an improvement on TER in terms of correlation between human and  automatic evaluation it is quite work intensive and expensive.

The second variation of TER is TER-Plus or TERp. It works like TER with  at least one reference and then calculated the optimal edits. Like  METEOR it considers recall. Additionally, like METEOR, synonyms and word stems are considered in the calculation of the editing rate. Other than the basic TER algorithm it also has different costs for edits, i. e.  shifts, substitutions, deletions and insertions do not have all the same cost of 1 as they have in TER [@TERp]. These parameters for cost are  optimized to correlate with human judgment on a specific system with the help of a hill-climbing algorithm. The cost can be even further  specified to certain word groups so that TERp can get an even higher  correlation with human judgment[@TERp].

TER is a little bit different from the other metrics in that it  calculates the edit rate and not the similarities or matches between  hypothesis and reference. The variations of TER, HTER and TERp, try to  improve on TER to give a more accurate editing cost. They are both more  costly than TER because they rely on more resources. HTER is especially  costly as it requires human labour. TER and its variants are closer to  human evaluation but a little more costly than BLEU.

Despite the development of arguably better metrics, BLEU is still in  use. For one every metric compares itself at least to BLEU to how how  they improve the score. All the metrics I mentioned above prove there  merit by comparing themselves to BLEU. When studying metrics BLEU is  still used as a baseline. Another use of BLEU is in studies that test  the quality of MT systems. Here BLEU is used because it does not require many resources and is language independent. @Post used BLEU to compare a customized statistical MT (SMT) system with a neural MT (NMT) system  Microsoft translator Hub (MTH) and DeepL respectively. They evaluated  the results with BLEU and after that compared that to human evaluation.  They found out that the NMT is better than the SMT but that while BLEU  judges the NMT to be better it also underestimates the NMT.

Similarly another study examined the quality of Google Translate  [@Legal]. They translated legal text from English to Croatian and  evaluate the quality with BLEU with up to three references. Like the  study above they confirm their results with a human evaluation. They  come to the conclusion that BLEU correlates better with human judgment  if it has more references. Human evaluation while more time consuming is still valued as more accurate and despite the high subjectivity has a  good inter judge correlation.

Those are only two studies that use BLEU as late as 2018. BLEU is in  fact used very frequently a feat considering it was introduced in 2002.  Sadly the reporting of BLEU scores seems to be inconsistent as @Clarity  criticizes. They present the problem that paper which use BLEU do not  report how they may changed BLEU when they used it. This is problematic  as it does not allow for a comparison between different papers.  Depending on the papers it is unclear if a certain MT system is better  than the other if it has different scores in different papers. They  suggest to improve reports of any changes and use BLEU only to compare  similar systems. This brings me to the conclusion that BLEU is still a  very well used tool despite its difficulties.

All in all BLEU is not the best metric available. Several aspects of  the metric have room for improvement to get a score closer to human  evaluations. There are several metrics that have a better correlation to human evaluation. I mentioned NIST, METEOR and TER as some of the well  known alternatives. NIST is not much of an improvement compared to BLEU  and METEOR as well as TER need more resources than BLEU. In the end BLEU is still a metric that is often used to compare to other metrics as a  baseline, or to evaluate MT systems.

| **Metric<br />** | **Human Reference<br />**   | **Synonyms <br />and Stems** | **Tunability/ <br />Preciseness** | **Recall<br />** |
| ---------------- | --------------------------- | ---------------------------- | --------------------------------- | ---------------- |
| BLEU             | Yes                         | No                           | n-gram weights                    | No               |
| NIST             | Yes                         | No                           | information gain                  | No               |
| METEOR           | Yes                         | Yes                          | three tuning parameters           | Yes              |
| TER              | Yes                         | No                           | -                                 | No               |
| HTER             | Yes (plus edited reference) | No                           | -                                 | No               |
| TERp             | Yes                         | Yes                          | different editing cost            | Yes              |

: **All metrics in comparison** {#tbl:Metrics}

\section{Method}

For the evaluation of the quality of several MT engines, I set up a two part study. The first part of the study was fully computational. Source sentences in English were translated into the target language German or Czech with different MT engines. Then I calculated the BLEU score for those translations and compared the different translations to each other. The second part of the study brought in a human component. I asked several professional translators to evaluate a selection of the translations. The data and the studies are further explained in this part.

\subsection{Data}

The data consisted of the translations of four chapters from a printer manual. The original English as well as the professional translation into German as well as the source and translation of a shorter manual into Czech. To protect the customers data all references to the company and their products were made anonymous and formatting tags in the data were removed. The data was separated into sentences or words as it came directly from the manual. In the end there were 3,767 segments including double translations and one word segments. The German translation was separated into four parts of different length according to the original chapters, 1,606, 401, 378, and 1,382 segments respectively. There were less Czech segments as there was only a shortened translation available. In total the Czech translation contained 2,165 segments separated again into parts with 1,273, 127, 215, and 550 segments. The parts were originally each one chapter the same chapters for both languages but as mentioned before the Czech translation was a short translation. The English original was then used as a source for the translation and the human translation was used as a reference to compare the machine translations to.

\subsection{Machine Translators}

Beside the human translators I used several different translators. For the translation into German the machine translators of SDL Trados, DeepL, Google document translation and the Bing translator were used. The same were used for the Czech translation except for DeepL as it does not translate into Czech and only provides a few language pairs. The data then was entered in the translators and translated which took a few minutes at most.



The translators were accessed in different ways. SDL Trados is not only a translator but manly a Computer assisted translation (CAT) tool. It allows the users to translate without worrying about formatting. The company also provides a MT tool that can be used on as much text as whished. It is also possible to use a plugin for DeepL a MT engine from another company. Both is usually used to make translations that later are edited. Google translate and Bing translator are both on-line translator provided by Google and Microsoft respectively  that both companies also use in their other products CITE THE INFORMATION PAGE.  Except for the Bing translator all translations were done in bulk. The Microsoft translator for documents requires a self programmed base that had still several problems that could not be solved for this thesis. For that reason the sentences had to be translated in chunks of 5000 characters for German or 1000 Characters for English. There is as of now the possibility to program a document translator with Microsoft Azure but that did not work out for me. Bing, Google and in parts DeepL are all freely accessible the SDL Trados MT is bound to a paid for product I had access to due to the translation company I worked with. On a first look the translations seemed very similar to each other. All the translators provided translations for the sources without problems and were easily handled.



\subsection{BLEU}

BLEU is an easy tool as it is a comparison between the new translation and a reference translation. It is not a very sophisticated tool as it only compares sentence segments of different length and returns if they are equal [@BLEU]. Any change of capitalisation can be the difference between a score of 0 and 1, 1 being a identical translation and 0 a translation with no similarity. Therefor, the data had to be prepared before it was scored. First I replaced every "-" with a space as that was not a significant translation difference. After that I striped all the punctuation and parentheses as BLEU does not work with these. Next I converted everything to lower case. The problem of not matching words because of weird capitalisation was higher than wrongly identifying word as matching if they had a difference between word groups. One example was "auf Seite" and "Auf Seite" there the BLEU score would be 0.5 instead of 1 simply because of the capitalisation. The last preparations were made because BLEU needs the words to match exactly. With the preparation done the segments could be scored.



One of the tuning parameters for BLEU are the weights. The weights influence the importance of the n-grams.  Usually the n-grams from n = 1 to n = 4 are considered. Without tuning the n-grams are weighted equally. This did not lead to any satisfactory results as many of the segments I used resulted in a BLEU score of 0 even if the translation was equal due to the geometric mean that BLEU uses [@BLEU]. This was mainly due to the fact that many segments were very short and could not be properly rated to get a more adequate result I changed the weights a high weight for unigrams was most important but I gave the other n-grams also some weight so that they would be considered. In the end the weights were as follows (0.7, 0.15, 0.075, 0.075) in order from unigram to 4-gram. With this I had usable results even for the segments with less than 4 words. In the end I had changed the weights so I even short segments get a score.



The data was compared in different steps. Each sentence of each MT had a BLEU score calculated and was ranked against the other BLEU scores of the other MT. Additionally a corpus BLEU score, a commutative score of all sentences of one chapter was calculated. Different sets of references were also compared. First, only the human translation was a reference but for comparison I also used a one against all approach for the references, in two versions. First I used all MT and the Human translation as a reference and each time left out one MT which I used as a hypothesis. Secondly I included all translations even the human one as possible hypotheses so that for the calculation of the BLEU score for the human translation all the MT were used as a reference. I calculated the BLEU score for each segment and MT several times and changed the references between trails. The results will be discussed later.

\subsection{Translator study}

BLEU gave us a first impression of the quality of the MT but as it compares the translations to reference translations and I had only one verified good reference translation, the human translation. It was important to see if translators rate the MT similarly to the results from the BLEU score. Especially considering that BLEUs correlation with human judgment could be better. In the following I describe the experiment with the translators.

\subsubsection{Data}

The number of sentences was very high, to keep the length of the study to an acceptable length for the participants this number had to be reduced. First it was necessary to filter out the interesting sentences for the study. The source sentences had to have a length between 6 and 15 words. The lower bound allowed to filter out most non sentences. @SentenceLength showed that 17 to 18 year olds could pass sentences with up to 15 words with ease, it also suggested that better readers could parse even longer sentences with relative ease but it seemed like a good cut of point to keep the length of the sentences manageable and time per sentence shorter. In the next step sentences that had identical translation in different translators were excluded. The sentence also had to have at least one score that differed from the others to guarantee diverse sentences. From that set of sentences 60 sentences were randomly sampled. Sentences with missing words and repeated sentences were manually excluded. Finally the first 50 sentences of that final set were used in the study. All these steps reduced the sentences to a good sample of all the sentences.

\subsubsection{Participants}

The participants were all professional translators, most of them have worked for Wiezeke Consulting in the past. Wiezeke consulting also recruited them from all available translators they now for those language pairs. There were five translators per language pair. I had to exclude three datasets from the Czech study because they were only partly done.

Demographics

\subsubsection{Experiment}

The experiment was done by the participants remotely and without supervision. Each participant received an e-mail with a link to the study. They were then given 50 source sentences with 5 translations for German and 4 four Czech this included all MT as well as the human translation. In each question they were given the source sentence and all translations. They were then asked to rate the quality of the translation on a 5 point Likert scale from "strongly agree" to "strongly disagree". At the beginning of the study they were instructed to select "strongly agree" if the translation was perfect and "strongly disagree" if the sentence needed a complete new translation. These sentences were presented to the participants in a random order different for each participant the order of the translators was randomised as well. Following these questions were the general questions about demographics and the personal use of MT in their normal translation process. Such as the frequency and extend of use of MTs. The expected time for answering the questions was about 40 Minutes in both languages. 

\section{Results}

In this section I will first present the results of the BLEU study, then the results of the Translator study and finally compare the results to each other.

\subsection{BLEU}

For the BLEU scores a higher number is better while for the ranks a low number is. On a first look the numbers are all close together in the same area but there are some significant differences between the results.

For the Czech translations all differences are significant as seen in Table 1 to three. In each version Google gives the best translation followed by SDL Trados and finally Bing. It is obvious to see that difference between SDL Trados and Bing is smaller than the one between SDL Trados and Google. In the comparison between all the MTs and the human translation it is interesting to see that the score for the human translation is the worst.



| **Translators** | **Bleu**  | **Rank**  |
| --------------- | --------- | --------- |
| google          | **0,509** | **1,436** |
| SDL Trados      | **0,45**  | **1,634** |
| Bing            | **0,444** | **1,693** |

: **Czech reference is human**: {#tbl:Cz_h} Average of the corpus BLEU calculated on each chapter and average rank, significant differences are bold

| **Translators** | **Bleu**  | **Rank**  |
| --------------- | --------- | --------- |
| google          | **0,818** | **1,479** |
| SDL Trados      | **0,746** | **1,695** |
| Bing            | **0,751** | **1,698** |

: **Czech 1 against all**: {#tbl:Cz_1aa} Average of the corpus BLEU calculated on each chapter and average rank, significant differences are bold, the references are the human translation and all other translations

| **Translators** | **Bleu**  | **Rank**  |
| --------------- | --------- | --------- |
| google          | **0,818** | **1,61**  |
| SDL Trados      | **0,746** | **1,878** |
| Bing            | **0,751** | **1,913** |
| human           | **0,593** | **2,635** |

: **Czech 1 against all with human hypothesis**: {#tbl:Cz_1aa_h} Average of the corpus BLEU calculated on each chapter and average rank, significant differences are bold, the references are all other translations

In the translations to German it looks a little different Bing is still has the worst results with a significant difference to the other results. When I only used a human reference DeepL was the best translator but had no significant difference to Google or SDL Trados. In the two 1 against all versions it is Google that ranks the best while SDL Trados and DeepL follow. Thre is no significant difference between the other two.



| **Translators** | **Bleu**  | **Rank**  |
| --------------- | --------- | --------- |
| DeepL           | 0,432     | 1,573     |
| google          | 0,41      | 1,649     |
| SDL Trados      | **0,401** | 1,747     |
| Bing            | **0,36**  | **2,003** |

: **German human reference**: {#tbl:De_h} Average of the corpus BLEU calculated on each chapter and average rank, significant differences are bold

| **Translators** | **Bleu**  | **Rank**  |
| --------------- | --------- | --------- |
| google          | **0,875** | **1,56**  |
| SDL Trados      | 0,841     | 1,86      |
| DeepL           | 0,839     | 1,87      |
| Bing            | **0,776** | **2,025** |

: **German 1 against all**: {#tbl:DE_1aa} Average of the corpus BLEU calculated on each chapter and average rank, significant differences are bold, the references are all other translations including the human translation

| **Translators** | **Bleu**  | **Rank**  |
| --------------- | --------- | --------- |
| google          | **0,875** | **1,64**  |
| SDL Trados      | 0,841     | 1,957     |
| DeepL           | 0,839     | 1,948     |
| Bing            | **0,776** | **2,203** |
| human           | **0,494** | **3,79**  |

: **German 1 against all with human hypothesis**: {#tbl:De_1aa_h} Average of the corpus BLEU calculated on each chapter and average rank, significant differences are bold, the references are all other translations

\subsection{Translators' study}

CZ study results

The human judgments show that the participants judged Google and human translations into Czech to be the best. While Google is the best but there is no significant different to the human result. There is however a significant difference between Google and SDLTrados as well as Google and Bing. Considering the rank of the translators they are all significantly different to each other.

| **Translator** | **Results** | **Rank** |
| -------------- | ----------- | -------- |
| google         | 3,57        | **1,9**  |
| human          | 3,406       | **2,34** |
| SDL Trados     | *3,223* *   | **2,62** |
| Bing           | *3,202* *   | **2,64** |

: **Study results Czech**: {#tbl:Cz_study} significant differences are bold, * are only significantly different to first place

DE study results

It looks a little different for the German study. The ranks again were significantly different to each other. DeepL was judged to be the best without a significance difference to the the second best Google. The human and SDL Trados translations have significantly lower scores than DeepL. Bing has the lowest score with a significant difference to all other translators.

| **Translator** | **Result** | **Rank** |
| -------------- | ---------- | -------- |
| DeepL          | 3,42       | **2,08** |
| google         | 3,164      | **2,6**  |
| human          | *2,936* *  | **2,96** |
| SDL Trados     | *2,944* *  | **2,98** |
| Bing           | **2,531**  | **3,42** |

: **Study results German**: {#tbl:De_study} significant differences are bold, * are only significantly different to first place

The scores overall are very mediocre on a 1 to 5 scale they are all below a four.

\subsection{Both in comparison}

Bleu score of questions in comparison

Table 7 and 8 show the results of the human scores as well as the BLEU scores done on the whole corpus of question in one with the human translation as reference. The BLEU score for the human translation is the highest with a lot of difference to the other translations.

The Czech results show that the order of human and Google as well as Bing and SDL Trados are switched. For the translations ito Germanthe human translation jumps to the front with the highest BLEU score the order of the remaining translators stays the same.

| **Translator** | **Human** | **Corpus Bleu** |
| -------------- | --------- | --------------- |
| human          | 3,406     | 0,955           |
| google         | 3,570     | 0,489           |
| Bing           | 3,202     | 0,416           |
| SDL Trados     | 3,222     | 0,402           |

: **Study results Czech in comparison to BLEU scores on all study questions**: {#tbl:Cz_comparison}

DE

| **translator** | **human** | **Corpus Bleu** |
| -------------- | --------- | --------------- |
| human          | 2,936     | 0,917           |
| DeepL          | 3,42      | 0,329           |
| google         | 3,164     | 0,317           |
| SDL Trados     | 2,944     | 0,303           |
| Bing           | 2,531     | 0,287           |

: **Study results German in comparison to BLEU scores on all study questions**: {#tbl:De_comparison}

\subsubsection{Correlation}

The spearman correlation between the human score and the BLEU score is rather small for Czech and German. Czech has a significant result for the correlation between the values of the study and BLEU as well as of the rankings but the correlation is very low positive, negligible low even for the vlaues.

|           | **Correlation** |
| --------- | --------------- |
| **value** | **0,277**       |
| **rank**  | **0,379**       |

: **Correlation between study results and BLEU scores for Czech**: {#tbl:Cz_corr}

The correlation between the human judgment is even lower in the German study. The correlation between the values is not significant. Between the ranks the correlation is significant but negligible negative.

|           | **correlation** |
| --------- | --------------- |
| **value** | 0,063           |
| **rank**  | **-0,121**      |

: **Correlation between study results and BLEU scores for German**  : {#tbl:De_corr}

\section{Discussion}

With the changing of weights is the results are not directly comparable to other results. That is a common problem in the reporting of the BLEU results. Sometimes it is not clear which changes have been made to the code there is no one single BLEU score [@Clarity]. The results can only give a ranking of the translations not a comparable result. Further, because of the changed weights there is heavier weight on the uni-grams this leads to a heavier emphasis on adequacy but less on fluency which BLEU accounts for by using the longer n-grams. That means that the words might be translated correct but not in the right order. 

In the results for 1 against all with the human as a hypothesis the score for the human translation is significantly worse than the other translations. It seems to be not as good of a translation as the others. This however is not the case. In the way BLEU works it compares a hypothesis translation to at minimum one reference translation. For that reason any result only shows how similar a translation is to the reference translation(s). Each translation has all other translations as references so the human translatio has only the MT as references and the result shows that the human translation is not as close to its references as the other translations. Even if compared to a different human translation the BLEU score would be below 1 if it is not identical [@BLEU]. This shows one of the shortcomings of BLEU it is only as good as the reference translation given.

For the BLEU score the sentences the translations were scored against the human translations as references, that means that for the human translational reference and hypothesis were the same. That is the reason that the score is so high. It is surprising that the score is not 1 witch should be expected. When looking into the single sentence scores, the segments are mostly scored as 1 but some are a little lower than 1. A reason could be a mistake in the production of the references and hypotheses or it could be influenced by the weights.

The result for the study were surprising especially the sores for the human translations in the study. Other than expected the human score was not the best and even significantly worse than the best result for the study. It was expected that the human translation as the gold standard would be significantly better than the the MTs. A reason for that could be that the human translations were too different from the source sentence. While they could in context be correct translations and the way it should be translated the translators could have judged the translation as too different from the source sentence. Other than the MTs that are more of word for word translations. The results of the 1 against all with a human hypothesis scores suggest that the human translation is rather different from the other translations.

 The lack of correlation is concerning. Other papers suggest that the BLEU has a correlation with human judgment [@BLEU]. The results here might be screwed by the use of the human translation as reference and hypothesis in the BLEU score. @BLEU for example uses three MT systems and two human translations in their study with human participants. Although, the order of the MT ranking stays the same disregarding the human translation in the German translation for the study results and the BLEU score the correlation is negligible. The over all score for all translation is with under 4 on a 1 to 5 scale is rather low.

Despite the lack of correlation between the study and the BLEU scores of the study segments the MT engines are at least orderd the same for the study results and the results for the BLEU scores on everything with the BLEU score on the whole corpus with only the human reference. This lends some credibility to the BLEU scores even if the results of the study have less significant differences.

For the MT systems Google is the best with a significant difference in nearly all cases. Except in German in some cases. In the BLEU score with only a human reference as well as the German study DeepL is ranked the best but without a significant difference to the Google. SDL Trados and DeepL are often close to each other with no significant difference between them except in the cases were DeepL is the best translator. This could indicate that those two translators are similar to each other. Bing is the MT system that is continuously judged to have the lowest score the difference to the other three is often bigger than the difference between them. Except for the BLEU score of the Czech study questions where SDL Trados has the lowest score.

Improvements to the study could be made. Having at least one other human translation as reference or hypothesis could make the BLEU score more accurate and improve the correlation with the human judgment. It is also possible that despite the wide use of the BLEU score it does not correlate well with the judgment of humans when confronted with NMT, as shown in a study BLEU tends to underestimate the quality of NMTs [@Post].

\section{Conclusion}

It can tentatively be said that Google and DeepL are the best MTSystems, although, SDL Trados is close behind. Bing seems to be a bad choice as a translator, although it should be said that it had the disadvantage to not be able to translate the whole document. However despite the low ranking of the human translation it seems that at the moment a translation has to be augmented by a professional translator. The BLEU scores of the 1 against all with human hypothesis show that the human translation is quite different from the MT and it could be that that was the reason for the low score in the study.

only one reference

bleu als metric


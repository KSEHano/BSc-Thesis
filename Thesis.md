

Abstract

\section{Introduction}

Machine translation (MT) systems have been on the rise and seem to get better. In everyday lives an MT is already often used privately or professional to adapt to the sheer volume of content and translation pairs needed [@book pp.1-6]. The quality of them is still questionable but they seem to be improving. When evaluating the quality of a translation human evaluation is still the standard. While it is more accurate it is time consuming and expensive. For that reason an automatic evaluation could possible augment human evaluation which is already done  [@book pp. 24-27; @BetterTrans] . @BetterTrans showed that automatic evaluation can help improve MT when integrated in the development or learning process of an MT system. An automatic evaluation is very useful during the optimization process of a MT system. It is faster and less expensive than a human evaluation and can therefore be repeatedly used during the development of a MT system. Additionally an automatic evaluation is seemingly more objective than human evaluation [@book pp. 24-27]. Despite the advantages of an automatic evaluation they are still lacking as they strive to get more similar to human evaluation [@BLEU]. Automated evaluation is an important tool for the improvement and the quality assessment of MT system.

One of the groups most interested in the development of MT are professional translators. They question if MT will be part of the work flow in the future for professional translations. I worked with a translation company from Osnabrück, Wietzke Consulting that questioned how good the MTs are in specialized fields. The company often translates computer and machine manuals into many different languages. This is a specialized field with its own phrases that need to be translated in context. I wanted to test several MT systems against each other and compare them to a professional human translation.  I decided to use two language pairs for the comparison English-German and English-Czech. English-German is a common translation pair that is often translated and MT in this language pair could be very similar to a human translation. Czech, while still a European language with a Latin alphabet, is translated less often. My source translation for English-Czech translation was a shortened version of the same manual I used for the English-German pair. I did not work with the whole manual but with four chapters on the use of the software of a printer. In my work I want to compare the translations of different MT engines. In the end I want to see how good the translations are compared to each other and to a professional human translation.  To make this judgment I used a human and an automatic evaluation. 

The translators are were either freely available or were available due to the connection to Wietzke. Bing translator is a freely available so is Google Translator for shorter text and whole documents [@Google]. Because Google is freely available and supports a high number of languages it is often used in studies [@legal]. DeepL is a freely available translator that only covers a few languages with translations of short segments but also documents, here a plug-in for the SDL Trados software is used  [@DeepL]. SDL Trados is a Computer Assisted translation (CAT) tool that helps to ease the translation work-flow. It includes a machine translation tool the SDL Language Cloud [@SDL_NMT]. All of these translators are Neural MT (NMT) systems [@Post; @Google; @diffNMT; @SDL_NMT; @Bing_NMT].

In the following I will explain BLEU in detail, then I will present the state of the research, that will be followed by the Method and finally the discussion and conclusion.



\section{BLEU}

The BLEU score is one of the older scores but still often used to compare translations [@BLEU; @book pp. 24-27; @Clarity]. It is a simple score and similar enough to human interpretation to still be of relevance. Although many better tools have been developed since the introduction of BLEU it is still widely used [@book pp. 24-27; @Clarity]. Some of the reasons are that BLEU has a low computation time, is easy to run, and can be integrated into the code for training a MT system [@METEOR]. 

The BLEU score does not give an indication of an objectively good translation but a similarity measure between a hypothesis translation and a reference translation done by a professional translator. It works as follows, the computer is given at least one reference and compares this reference to a hypothesis, a MT of the same source text [@BLEU]. Then it compares the n-grams, a segment with the number of words *n*, of the hypothesis with the references. To avoid the overuse of a word with high frequency like "the" the maximum number of a word in one reference is counted and the n-gram count clipped[@BLEU]. Another problem is the length of a sentence. BLEU prefers shorter sentences to avoid that problem, a brevity penalty is introduced if the hypothesis sentence is shorter than the closest reference in terms of length [@BLEU]. However, this is often not enough and short sentences still have a higher score [@METEOR]. Originally BLEU could boast a good correlation with human judgment of the translation but since the publication of the paper a host of different metrics have emerged that give a result closer to the human judgment [@METEOR; @TERp]. Further, there is the problem that BLEU scores do not always accurately reflect differences in translation quality [@Re-evaluating]. The easy use of BLEU gives us an orientation for the quality of a translation and can be applied with even little resources. One reference can be enough but when the scoring of a whole corpus the reference translation should be done by more than one translator to give an accurate end result. Because BLEU works with references for each sentence, it is language independent there is only the need for a reference translation and no further language resources [@BLEU]. All this makes BLEU a simplistic but relatively easy tool and it is understandably still a standard.

Mathematical BLEU is mainly based on is the so called precision $p =  \frac{m}{t}$ m being the number of matches and t being the number of n-grams in the hypothesis [@recall]. This however is not all. The use of  unigrams allows for an assessment of adequacy, that is that the words are correct. The use of higher number n-grams for fluency, that is if the translation is readable as a coherent sentence. So the basic BLEU score is based on the

 $p_{all} = \displaystyle\sum_{i =1}^{N} w_i* \frac{m_i}{t_i}$

where N is equal to 4, the biggest n-grams considered and w_i are the weights for the n-grams and $w_i = \frac{1}{N}$ [@BLEU]. On a corpus or several sentences the modified precision is then the sum of the the clipped n-gram matches of all sentences divided by the number of candidate n-grams.

$p_n = \frac{\displaystyle\sum_{C \in Candidates} \displaystyle\sum_{n-gram \in C} Count_clip (n-gram)}{\displaystyle\sum_{C' \in Candidates} \displaystyle\sum_{n-gram' \in C'} Count(n-gram')}$

To avoid that a translation is entirely made out of high frequency the n-gram counts are modified, i.e. the maximum number of occurrences is counted in the reference sentences and all matches are added together to give the modifies n-gram count. This is the brevity penalty with c is th length of the candidate or hypothesis and r is the length of the closest reference, it is calculated on the whole corpus.

$$ d(i) = \frac{ \begin{cases}

W_0(\ln(i)i) & \mbox{if } 0<y<\frac{1}{e} \

W_{-1}(\ln(i)i) & \mbox {if } \frac{1}{e}<y<1

\end{cases}}{\ln(i)}$$



```
$$ BP = \frac{\begin{cases}1 & \mbox{if } c < r \ e^(1-r/c)&\mbox{if } r > c \end{cases}}{\ln{i}}$$ this needs to be fixed
```

The final definition of BLEU is then

$BLEU = BP * \exp(\displaystyle\sum_{n=1}^{N}w_n \log{p_n})$

$w_n = w_i$ as shown above and n is always the length of the n-gram. Because all the weights are the same this is the same as using a geometric mean [@BLEU]. This leads to a BLEU score of zero if one of the n-grams is not present.

The BLEU score calculates the precision of a translation. With the use of the modified precision and the brevity penalty it strives to be similar to human evaluation. One of the main advantages is that BLEU needs only reference translation and the hypothesis to work and thus does not need many resources. Regardless of the existence of better the better metrics the few resources needed and simplicity of the calculation are reasons for the continued use of the metric.



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

Beside these different quality evaluation metrics there is another field for translation quality control that is *quality estimation*. Quality estimation has to goal to give an estimation of any given sentence without a reference translation [@QE]. Other than the metrics it is supposed to have a more accurate estimation on a sentence level than quality evaluation matrices. It needs of course some way to compare a translation to. Most quality estimation is done as a supervised learning task that need to be trained on a high number of sentence pairs in the source and target language with an human evaluation of there quality [@QE]. One of the more well known quality estimation tools is QuEst [@Quest]. Some of the important uses of QuEst are: Giving an estimation of the editing time, selecting the best translation of some alternatives, deciding if a segment need revising and estimating if the segment can be used for the training of a segment [@Quest]. QuEst needs a lot of different resources, other than the metrics that need only the reference translations and some other resources. Most notable a big training corpus and language models for each language. There are two parts of the QuEst algorithm the feature extractor that finds relevant features for the quality estimation and the machine learning part. The feature extractor finds MT system independent "black-box" features that try to measure complexity, fluency and adequacy. "Glass-box" models show the confidence of a certain MT system. The machine learning part of the algorithm then uses the extracted features to build the quality estimation by tuning hyper-parameters and selecting relevant features. The finished build is then specific to that language pair and domain of the training corpus. Quality estimation like QuEst can provide better correlation to human judgment than the metrics [@QE]. The biggest problem of quality estimation seems to be the need for many resources and a complicated code. Other than the metrics that provide a result fast and with minimal resources QuEst and other quality estimation algorithms that have to extract the features and train the model.

Despite the development of arguably better metrics, BLEU is still in  use. For one every metric compares itself at least to BLEU to how how  they improve the score. All the metrics I mentioned above prove there  merit by comparing themselves to BLEU. When studying metrics BLEU is  still used as a baseline. Another use of BLEU is in studies that test  the quality of MT systems. Here BLEU is used because it does not require many resources and is language independent. @Post used BLEU to compare a customized statistical MT (SMT) system with a neural MT (NMT) system  Microsoft translator Hub (MTH) and DeepL respectively. They evaluated  the results with BLEU and after that compared that to human evaluation.  They found out that the NMT is better than the SMT but that while BLEU  judges the NMT to be better it also underestimates the NMT.

Similarly another study examined the quality of Google Translate  [@legal]. They translated legal text from English to Croatian and  evaluate the quality with BLEU with up to three references. Like the  study above they confirm their results with a human evaluation. They  come to the conclusion that BLEU correlates better with human judgment  if it has more references. Human evaluation while more time consuming is still valued as more accurate and despite the high subjectivity has a  good inter judge correlation.

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

For the evaluation of the quality of several MT engines, I set up a two part experiment. The first part of the experiment was fully computational. Source sentences in English were translated into the target language German or Czech with different MT engines. Then I calculated the BLEU score for those translations and compared the different translations to each other. The second part of the experiment brought in a human component. I asked several professional translators to evaluate a selection of the translations. The data and the studies are further explained in this part.



\subsection{Data}

The data consisted of the translations of four chapters from a printer manual. The original English as well as the professional translation into German, as well as the source and translation of a shorter manual into Czech. To protect the customers data all references to the company and their products were made anonymous and formatting tags in the data were removed. The data was separated into sentences or words as it came directly from the manual. In the end there were 3,767 segments including double translations and one word segments. The German translation was separated into four parts of different length according to the original chapters, 1,606, 401, 378, and 1,382 segments respectively. There were less Czech segments as there was only a shortened translation available. In total the Czech translation contained 2,165 segments separated again into parts with 1,273, 127, 215, and 550 segments. The parts were originally each one chapter the same chapters for both languages. The English original was then used as a source for the MT and the human translation was used as a reference to compare the MT to.

The example in [@Dataexampl_DE] and [@Dataexampl_DE] show two examples of the data used in the experiment. The first example in both is one of many segments that were only one or two words long. Here it is apparent that the MT systems translated the segment literally and did not with the right term that should be used in this context. It is questionable if the context of a whole sentence would have sufficed to give a correct translation. In the second example are the translations of the same sentence into German and Czech. Here it is again apparent that the translations by the MT systems are similar or even identical to each other while the Human translation is quite different. While the English source and the more word for word translations are passive the human translations into German and Czech talk explicitly to the reader. This is possibly a convention for the writing of manuals that differs in different languages and possibly even countries. MT systems have translations that are similar to each other but differ from a Human translation because they seem to translate more literally.

| **Translator** | **Example 1**   | **Example 2**                                                |
| -------------- | --------------- | ------------------------------------------------------------ |
| **Source**     | Slit Glass      | It is possible to check the status of the system and network, the status of consumables such as toner and paper and the situation of the options being used. |
| **Human**      | Belichtungsglas | So können Sie den Status des Systems und des Netzwerks, den Status der Verbrauchsmaterialien wie Toner und Papier sowie den Zustand der verwendeten Optionen überprüfen. |
| **SDL Trados** | Schlitzglas     | Es ist möglich, den Status des Systems und des Netzwerks, den Status von Verbrauchsmaterialien wie Toner und Papier und die Situation der verwendeten Optionen zu überprüfen. |
| **Google**     | Schlitzglas     | Es ist möglich, den Status des Systems und des Netzwerks, den Status von Verbrauchsmaterialien wie Toner und Papier sowie die Situation der verwendeten Optionen zu überprüfen. |
| **DeepL**      | Schlitzglas     | Es ist möglich, den Status des Systems und des Netzwerks, den Status der Verbrauchsmaterialien wie Toner und Papier und die Situation der verwendeten Optionen zu überprüfen. |
| **Bing**       | Schlitzglas     | Es ist möglich, den Status des Systems und des Netzes, den Status von Verbrauchsmaterialien wie Toner und Papier und die Situation der verwendeten Optionen zu überprüfen. |

: **Example Sentences German** {#tbl:Dataexample_DE}

| **Translator** | **Example 1**      | **Example 2**                                                |
| -------------- | ------------------ | ------------------------------------------------------------ |
| **Source**     | Slit Glass         | It is possible to check the status of the system and network, the status of consumables such as toner and paper and the situation of the options being used. |
| **Human**      | Skenovací štěrbina | Můžete zde zkontrolovat stav systému a sítě, stav spotřebního materiálu jako toner a papír a přehled o požívaném volitelném příslušenství. |
| **SDL Trados** | Proříznuté sklo    | Je možné zkontrolovat stav systému a sítě, stav spotřebního materiálu, jako je toner a papír, a situaci používaných možností. |
| **Google**     | Štěrbinové sklo    | Je možné zkontrolovat stav systému a sítě, stav spotřebního materiálu, jako je toner a papír, a stav použitých doplňků. |
| **DeepL**      | Štěrbina Sklo      | Je možné zkontrolovat stav systému a sítě, stav spotřebního materiálu, jako je toner a papír, a situaci používaných možností. |

: **Example Sentences Czech** {#tbl:Dataexample_CZ}

\subsection{Machine Translators}

For the translation into German the MT systems of SDL Trados, DeepL, Google document translation and the Bing translator were used. The same were used for the Czech translation except for DeepL as it did not translate into Czech in time for the study, which has since changed. The data then was entered in the translators and translated which took a few minutes at most.

The translators were accessed in different ways. SDL Trados is not only a translator but mainly a Computer assisted translation (CAT) tool. It allows the users to translate without worrying about formatting. The company also provides a MT tool that can be used on as much text as whished. It is also possible to use a plugin for DeepL a MT engine from another company. Both is usually used to make translations that later are edited. Google translate and Bing translator are both on-line MT systems provided by Google and Microsoft respectively  that both companies also use in their other products [@Googel_NMT; @Bing_NMT].  Except for the Bing translator all translations were done in bulk. The Microsoft translator for documents requires a self programmed base that had still several problems that could not be solved for this thesis. For that reason the sentences had to be translated in chunks of 5000 characters for German or 1000 Characters for English. There is as of now the possibility to program a document translator with Microsoft Azure but that did not work out. Bing, Google, and DeepL are all freely accessible the SDL Trados MT system is bound to a paid product I had access to due to the translation company I worked with. On a first look the translations seemed very similar to each other. All the translators provided translations for the sources without problems and were easily handled.



\subsection{BLEU}

BLEU is an easy tool as it is a comparison between the new translation and a reference translation. It is not a very sophisticated tool as it only compares sentence segments of different length and returns if they are equal [@BLEU]. Any change of capitalisation can be the difference between a score of 0 and 1, 1 being a identical translation and 0 a translation with no similarity. Therefor, the data had to be prepared before it was scored. First I replaced every "-" with a space as that was not a significant translation difference. After that I striped all the punctuation and parentheses as BLEU does not work with these. Next I converted everything to lower case. The problem of not matching words because of different but correct capitalisation was higher than wrongly identifying word as matching if they had a differences only in capitalisation. One example was "auf Seite" and "Auf Seite" there the BLEU score would be 0.5 instead of 1 simply because of the capitalisation. The last preparations were made because BLEU needs the words to match exactly. With the preparation done the segments could be scored.

One of the tuning parameters for BLEU are the weights. The weights influence the importance of the n-grams.  Usually the n-grams from n = 1 to n = 4 are considered. Without tuning the n-grams are weighted equally and result in a geometric mean. This did not lead to any satisfactory results as many of the segments had a BLEU score of 0 even if the translation was equal [@BLEU]. This was mainly due to the fact that many segments were very short and could not be properly rated. To get a more adequate result the weights were changed. A high weight for unigrams was most important but other n-grams had some weight so that they would be considered. In the end the weights were as follows (0.7, 0.15, 0.075, 0.075) in order from unigram to 4-gram. With this I had usable results even for the segments with less than 4 words. In the end I had changed the weights so I even short segments get a score.

The data was compared in different steps. Each sentence of each MT had a BLEU score calculated and was ranked against the other BLEU scores of the other MT. Additionally a corpus BLEU score, a commutative score of all sentences of one chapter was calculated. Different sets of references were also compared. First, only the human translation was a reference but for comparison I also used a one against all approach for the references, in two versions. First I used all MT and the Human translation as a reference and each time left out one MT which I used as a hypothesis. Secondly I included all translations even the human one as possible hypotheses so that for the calculation of the BLEU score for the human translation all the MT were used as a reference. I calculated the BLEU score for each segment and MT several times and changed the references between trails. The results will be discussed later.



\subsection{Translator study}

BLEU gave us a first impression of the quality of the MT but as it compares the translations to reference translations and I had only one verified good reference translation, the human translation. It was important to see if translators rate the MT similarly to the results from the BLEU score. Especially considering that BLEUs correlation with human judgment could be better. In the following I describe the experiment with the translators.



\subsubsection{Data}

The number of sentences was very high, to keep the length of the study to an acceptable length for the participants this number had to be reduced. First it was necessary to filter out the interesting sentences for the study. The source sentences had to have a length between 6 and 15 words. The lower bound allowed to filter out most non sentences. @SentenceLength showed that 17 to 18 year olds could pass sentences with up to 15 words with ease, it also suggested that better readers could parse even longer sentences with relative ease but it seemed like a good cut of point to keep the length of the sentences manageable and time per sentence shorter. In the next step sentences that had identical translation in different translators were excluded. The sentence also had to have at least one score that differed from the others to guarantee diverse sentences. From that set of sentences 60 sentences were randomly sampled. Sentences with missing words and repeated sentences were manually excluded. Finally the first 50 sentences of that final set were used in the study. All these steps reduced the sentences to a good sample of all the sentences.



\subsubsection{Participants}

The participants were all professional translators, most of them have worked for Wiezeke Consulting in the past. Wiezeke consulting also recruited them from all available translators they now for those language pairs. There were five translators per language pair. I had to exclude three datasets from the Czech study because they were only partly done.

- Demographics some more



\subsubsection{Experiment}

The experiment was done by the participants remotely and without supervision. Each participant received an e-mail with a link to the study. They were then given 50 source sentences with 5 translations for German and 4 four Czech this included all MT as well as the human translation. In each question they were given the source sentence and all translations. They were then asked to rate the quality of the translation on a 5 point Likert scale from "strongly agree" to "strongly disagree". At the beginning of the study they were instructed to select "strongly agree" if the translation was perfect and "strongly disagree" if the sentence needed a complete new translation. These sentences were presented to the participants in a random order different for each participant the order of the translators was randomized as well. Following these questions were the general questions about demographics and the personal use of MT in their normal translation process. Such as the frequency and extend of use of MTs. The expected time for answering the questions was about 40 Minutes in both languages. 

- examples study

For the evaluation the average was calculated over all candidates for each question and then the average for each translator was calculated. The BLEU score was newly calculated on the study questions with the human translation as a reference and all possible translations including the human translation as hypotheses. This was important to be able to calculate the correlation between the human and machine evaluation.



\section{Results}

In this section I will first present the results of the BLEU study, then the results of the Translator study and finally compare the results to each other.



\subsection{BLEU}

For the BLEU score a higher number is better while for the ranks a low number is. On a first look the numbers are all close together in the same area but there are some significant differences between the results.

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

: **Czech one agains all**: {#tbl:Cz_1aa} Average of the corpus BLEU calculated on each chapter and average rank, significant differences are bold, the references are the human translation and all other translations

| **Translators** | **Bleu**  | **Rank**  |
| --------------- | --------- | --------- |
| google          | **0,818** | **1,61**  |
| SDL Trados      | **0,746** | **1,878** |
| Bing            | **0,751** | **1,913** |
| human           | **0,593** | **2,635** |

: **Czech one agains all with human hypothesis**: {#tbl:Cz_1aa_h} Average of the corpus BLEU calculated on each chapter and average rank, significant differences are bold, the references are all other translations

In the translations to German it looks a little different Bing is still has the worst results with a significant difference to the other results. When I only used a human reference DeepL was the best translator but had no significant difference to Google or SDL Trados. In the two one agains all versions it is Google that ranks the best while SDL Trados and DeepL follow. Thre is no significant difference between the other two.



| **Translators** | **Bleu** | **Rank**  |
| --------------- | -------- | --------- |
| DeepL           | 0,432    | 1,573     |
| google          | 0,41     | 1,649     |
| SDL Trados      | 0,401    | **1,747** |
| Bing            | **0,36** | **2,003** |

: **German human reference**: {#tbl:De_h} Average of the corpus BLEU calculated on each chapter and average rank, significant differences are bold

| **Translators** | **Bleu**  | **Rank**  |
| --------------- | --------- | --------- |
| google          | **0,875** | **1,56**  |
| SDL Trados      | 0,841     | 1,86      |
| DeepL           | 0,839     | 1,87      |
| Bing            | **0,776** | **2,025** |

: **German one agains all**: {#tbl:DE_1aa} Average of the corpus BLEU calculated on each chapter and average rank, significant differences are bold, the references are all other translations including the human translation

| **Translators** | **Bleu**  | **Rank**  |
| --------------- | --------- | --------- |
| google          | **0,875** | **1,64**  |
| SDL Trados      | 0,841     | 1,957     |
| DeepL           | 0,839     | 1,948     |
| Bing            | **0,776** | **2,203** |
| human           | **0,494** | **3,79**  |

: **German one agains all with human hypothesis**: {#tbl:De_1aa_h} Average of the corpus BLEU calculated on each chapter and average rank, significant differences are bold, the references are all other translations

\subsection{Translators' study}

The human judgments show that the participants judged Google and human translations into Czech to be the best. However there is no significant different to the result for the human translation. There is however a significant difference between Google and SDLTrados as well as Google and Bing. Considering the rank of the translators they are all significantly different to each other.

| **Translator** | **Results** | **Rank** |
| -------------- | ----------- | -------- |
| google         | 3,57        | **1,9**  |
| human          | 3,406       | **2,34** |
| SDL Trados     | *3,223* *   | **2,62** |
| Bing           | *3,202* *   | **2,64** |

: **Study results Czech**: {#tbl:Cz_study} significant differences are bold, * are only significantly different to first place

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

Table 7 and 8 show the results of the human scores as well as the BLEU scores done on the whole corpus of question in one with the human translation as reference. The BLEU score for the human translation is the highest with a lot of difference to the other translations.

The Czech results show that the order of human and Google as well as Bing and SDL Trados are switched. For the translations into German the human translation jumps to the front with the highest BLEU score the order of the remaining translators stays the same.

| **Translator** | **Human** | **Corpus Bleu** |
| -------------- | --------- | --------------- |
| human          | 3,406     | 0,955           |
| google         | 3,570     | 0,489           |
| Bing           | 3,202     | 0,416           |
| SDL Trados     | 3,222     | 0,402           |

: **Study results Czech in comparison to BLEU scores on all study questions**: {#tbl:Cz_comparison}

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

The results are not directly comparable to other studies because the weights were changed. That is a common problem in the reporting of the BLEU results. Sometimes it is not clear which changes have been made to the code which leads to the problem that there is no one single BLEU score and results can be misleading [@Clarity]. The results can only give a ranking of the translations not a comparable result. Further, because of the changed weights there are heavier weight on the unigrams. This leads to a heavier emphasis on adequacy but less on fluency which BLEU accounts for by using the longer n-grams. That means that the words might be translated correctly but not in the right order.

In the results for one agains all with the human as a hypothesis the score for the human translation is significantly worse than the other translations. It seems to be not as good of a translation as the others. In the way BLEU works it compares a hypothesis translation to at minimum one reference translation. For that reason any result only shows how similar a translation is to the reference translation(s). Each translation has all other translations as references so the human translation has only the MT as references and the result shows that the human translation is not as close to its references as the other translations. Even if compared to a different human translation the BLEU score would be below 1 if it is not identical [@BLEU]. This shows one of the shortcomings of BLEU, it is only as good as the reference translation given.

For the BLEU score of the study sentences, the translations were scored against the human translation as references, even the human translation had only the identical human translation as a reference. This leads to a very high BLEU score. It is surprising that the score is not 1 which should be expected. When looking into the single sentence scores, the segments are mostly scored as 1 but some are a little lower than 1. A reason could be a mistake in the production of the references and hypotheses or it could be influenced by the weights.

The result for the study were surprising especially the sores for the human translations in the study. Other than expected the human score was not the best and even significantly worse than the best result for the study. It was expected that the human translation as the gold standard would be significantly better than the the MTs. A reason for the surprisingly bad result for the human translation could be that it was too different from the source. While they could in context be correct translations and the way it should be translated, the translators could have judged the translation as too different from the source. Other than the MTs that are more of word for word translations. The results of the one against all with a human hypothesis scores suggest that the human translation is rather different from the other translations.

 The lack of correlation is concerning because the human judgment should be similar to the BLEU score. After all human evaluation is still the defining factor when judging the quality of a MT system. Other papers suggest that the BLEU has a correlation with human judgment [@BLEU]. The results here might be screwed by the use of the human translation as reference and hypothesis in the BLEU score. @BLEU for example uses three MT systems and two human translations in their study with human participants. Although, the order of the MT ranking stays the same disregarding the human translation in the German translation for the study results and the BLEU score the correlation is negligible. The overall score for all translation is with under 4 on a 1 to 5 scale is rather low.

For the Czech translation the ranking order of the two worst is swapped between the BLEU score and the study results disregarding the human translation, however, there is no significant difference between the two. For the German translation the ranking order of the translators stays the same when disregarding the human translation. This lends some credibility to the BLEU scores even if the results of the study have less significant difference.

For the MT systems Google is the best with a significant difference in nearly all cases. Except in German in some cases. In the BLEU score with only a human reference as well as the German study DeepL is ranked the best but without a significant difference to the Google. SDL Trados and DeepL are often close to each other with no significant difference between them except in the cases were DeepL is the best translator. This could indicate that those two translators are similar to each other. Bing is the MT system that is continuously judged to have the lowest score the difference to the other three is often bigger than the difference between them. Except for the BLEU score of the Czech study questions where SDL Trados has the lowest score.

Improvements to the study could be made. Having at least one other human translation as reference or hypothesis could make the BLEU score more accurate and improve the correlation with the human judgment. It is also possible that despite the wide use of the BLEU score it does not correlate well with the judgment of humans when confronted with NMT, as shown in a study BLEU tends to underestimate the quality of NMTs [@Post]. Another metric like TERp or METEOR could be better for the evaluation of the translations as they also consider synonyms and stems. Depending on the word-net used for this this could be problematic for text in certain domains as while words might be synonymous or correct translations they could not be the appropriate term. This could give an inflated resulted for the quality of the MT system. Also not considered are customizable translators that are trained on a dataset and could be better at translating for a certain domain.

Quality estimation tools like QuEst could also be an interesting avenue to explore. One of their main advantages are that they do not need reference translations. A problem is that they need a lot of resources for the training before they can be used and are language and domain specific after they are trained. Other than all the metrics that only need the reference translations and in some cases resources to recognizer synonyms and stems. The code for QuEst is freely available but the versions are not directly usable and need considerable work. So while QuEst could even be used to be integrated into a translation work flow it should only be considered if there is a lot of training data available and translations are done on the same domain and the same language pairs.



\section{Conclusion}

It can tentatively be said that Google and DeepL are the best MT systems, although, SDL Trados is close behind. Bing seems to be a bad choice as a translator, although it should be said that it had the disadvantage to not be able to translate the whole document. However despite the low ranking of the human translation it seems that at the moment a translation has to be augmented by a professional translator. The BLEU scores of the one against all with human hypothesis show that the human translation is quite different from the MT and it could be that that was the reason for the low score in the study. In the examples above it obvious that the translation by professionals are quite different. For one they use the appropriate terminology, for another they use the right style of writing if a literal or a word for word translation is not the right choice. This is a reason why the translation has to be edited by a translator. It is unclear if a pre translation by one of the better MT systems would be helpful. While the translations are judged to be reasonably good, they are quite different to the professional translations. The editing cost to get from a MT to a finished good translation could be higher than the cost for translating everything. It could be helpful in this case to have a quality estimation to give translators an overview if the sentences translated by an MT need editing and if they do how much.



need some more


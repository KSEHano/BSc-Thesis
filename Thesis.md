Abstract importance of recall in Bib

*kursive*

**bold**

\section{Introduction}

what I want to do

Machine translation (MT) systems have been on the rise and seem to get better. In everyday lives an MT is already often used privately or by corporations to translate the fast changing content like social media feeds [@book]. The quality of them is still questionable but they are improving. When evaluating the quality of a translation human evaluation is still the standard. While it is more accurate it is time consuming and expensive. For that reason an automatic evaluation could possible augment human evaluation which is already done  [@book pp. 24-27; @BetterTrans] . @BetterTrans showed that automatic evaluation can help improve MT. An automatic evaluation is very useful during the optimisation process of a MT system. It is faster and less expensive than a human evaluation and can therefore be repeatedly used during the development of a MT system. Another advantage is the potential for more objectivity [@book]. Other than human judgment an automatic evaluation can be more objective, this of course depends on the code. Despite the advantages of an automatic evaluation they are still lacking and a human evaluation remains the gold standard to judge a translation FIND CITATION. For that reason automatic evaluation strives to have considerable correlation with human evaluation [@BLEU; @TER] ADD OTHER PAPAERS .  Automated evaluation is an important tool for the improvement and the translation quality assessment of MT system.



One of the groups most interested in the development of MT are professional translators. They question if MT will be part of the work flow in the future. I worked with a translation company from Osnabrück that questioned how good the MTs are in specialized fields. The company often translates computer and machine manuals in many different languages. This is a specialized field with its own phrases that need to be translated in context. I decided to use two language pairs available for the comparison English-German and English-Czech. English German is a common translation pair that is often translated and and MT in this language pair could be very similar to a human translation. Czech, while still a European language with a Latin alphabet, is translated less often. My source translation for English-Czech translation was a shortened version of the same manual I used for the English-German pair. It is often the case that translations into Czech are only done on shortened versions of manuals. I do not work with the whole manual but with four chapters on the software of a printer. In my work I want to compare the translations of different MT engines. In the end I want to see how good the translations are compared to each other and to a professional human translation.  To make this judgment I used a human and an automatic evaluation. 

  

In the remainder of this part I will introduce the computational metric I used for comparison. In part two I will show the current state of research. After that I will explain my experiment method, present the results, discuss them and finally I will draw a conclusion.

explaining how bleu works

The BLEU score is one of the older scores but still often used to compare translations [@BLEU; @book; @Clarity]. It is a simple score and similar enough to human interpretation to still be of relevance. Although many better tool have been developed since the introduction of BLEU it is still widely used in the community [@book; @Clarity] Some of the reasons are that BLEU has a low computation time and is easy to run and can be integrated into the code for training a MT system [@METEOR]. 



The BLEU score does not give an indication of an objectively good translation but a similarity measure. It works as follows, the computer is given at least one reference, a good translation done by a translator, and compares this reference to a hypothesis, a MT of the same source text [@BLEU]. Then it compares the n-grams, a segment with the number of words *n*, of the hypothesis with the references. To avoid the overuse of a word with high frequency like "the" the maximum number of a word in one reference is counted \cite{@BLEU}. Another problem is the length of a sentence. BLEU prefers shorter sentences to avoid that problem, a "brevity penalty" is introduced if the hypothesis sentence is shorter than the closest reference in terms of length  reference sentence [@BLEU]. However, this is often not enough and short sentences still have a higher score I AM SURE I READ THAT IN A PAPER. Originally BLEU could boast a good correlation with human judgment of the translation but since the publication of the paper a host of different metrics have emerged that give a result closer to the human judgment CITE THAT COMPARISON STUDY. The easy use of BLEU gives us an orientation for the quality of a translation and can be applied with even little resources. One reference can be enough but when the scoring of a whole corpus the reference translation should be done by more than one translator to give an accurate end result, because it works with references for each sentence it is also language independent [@BLEU]. All this makes BLEU a simplistic but relatively easy tool and it is understandably still a standard.



SDL Trados

DeepL

Google

Google Translate is a freely available online MT engine. As such it is often used in studies CITE ENGLISH CROATION AND LOOK IF I HAVE A STUDY THAT LOOKS INTO GT. 

Bing





\section{State of the research}

motivation for using machine evaluation -> speed of evaluation

problems with bleu

- bad single sentence scores[@METEOR]
- no synonyms cognised [@METEOR]

other methods, examples Ter, Meteor, ter-p, nist

Considering the problems with BLEU, several alternative automatic evaluation methods have emerged. They have some similarities to BLEU but changes have been made to improve the correlation between the human and automatic judgment.



@NIST have developed the evaluation method that resembles BLEU the most, it is called NIST. Like all the automatic evaluation methods NIST requires at least one reference translation. Further it compares the different n-grams of the reference(s) to the hypothesis and gives the whole segment score. NIST improves on BLEU by including information weights, i. e. that n-grams with a lower chance of co-occurrence are weighted more heavily than those with a high chance of co-occurrence [@NIST]. With those improvements NIST has a slightly higher correlation with human judgment in terms of adequacy but not fluency [@NIST]. NIST is very similar to BLEU but improves slightly on it in terms of correlation with human judgment.



The next evaluation metric I want to introduce is METEOR. Again METEOR relies on a human made reference translation to score the MT. One of the big problems in BLEU is that there words have to be the exact same to be considered the same. METEOR works around this problem. It can score synonyms and word stems as the same words to with the help of a word net [@METEOR]. This helps to score give an more accurate score as it considers words the same that should be considered it other than BLEU that disregards the words if they do not match exactly. Another change in comparison to BLEU is that METEOR supports recall and has three tunable parameters[@METEOR]. The three parameter can be tuned to better correlate with human judgment. The first parameter controls the weights for precision and recall, the second shape of the penalty function and the third the weights of the penalty [@METEOR]. METEOR changes BLEU by considering synonyms and word stems, including recall and having three tunable parameters to get a better correlation with human judgment.



Other than the the previous two the TER score does not measure the how different a translation is from a reference translation, instead it measures how many edits have to be preformed to get from a MT to the human translation [@TER]. Hence the name *translation edit rate* or TER. Other than the other metrics it counts the number of edits that have to be done to get from the translation to reference. Edits include deletions, insertions, substitutions and shifts. To reduce the processing time to find the minimal number of edits for a given segment the algorithm first calculates the shift, that reduces the number of edits the most with a greedy search algorithm and then the other edits [@TER]. This is the basic algorithm but there are two versions of it.   
First there is the so called *human-targeted translation edit rate* or HTER. Additionally to the references of human translations there is a human targeted reference. This means that human annotator, that are fluent in the target language are given the MT and the reference and then edit the MT reference with minimal edits to be a fluent and adequate translation [@TER].  

how it is still used

translators development

\section{Method}

For the evaluation of the quality of several MT engines, I set up a two part study. The first part of the study was fully computational. Source sentences in English were translated into the target language German or Czech with different MT engines. Then I calculated the BLEU score for those translations and compared the different translations to each other. The second part of the study brought in a human component. I asked several professional translators to evaluate a selection of the translations. The data and the studies are further explained in this part.

\subsection{Data}

The data consisted of the translations of four chapters from a printer manual. The original English as well as the professional translation into German and the translation of the shorter manual into Czech. To protect the customers data all references to the company and their products were made anonymous and formatting tags in the data were removed. The data was separated into sentences or words as it came directly from the manual. In the end there were 3,767 segments including double translations and one word segments. The German translation was separated into four parts of different length according to the original chapters, 1,606, 401, 378, and 1,382 segments respectively. There were less Czech segments as there was only a shortened translation available. In total the Czech translation contained 2,165 segments separated again into parts with 1,273, 127, 215, and 550 segments. The parts were originally each one chapter the same chapters for both languages but as mentioned before the Czech translation was a short translation. The English original was then used as a source for the translation and the human translation was used as a reference to compare the machine translations to.

\subsection{Machine Translators}

Beside the human translators I used several different translators. For the translation into German the machine translators of SDL Trados, DeepL, Google document translation and the Bing translator were used. The same were used for the Czech translation except for DeepL as it is unable to translate into Czech and only provides a few language pairs. The data then was entered in the translators and translated which took a few minutes at most.



The translators were accessed in different ways. SDL Trados is not only a translator but manly a Computer assisted translation (CAT) tool. It allows the users to translate without worrying about formatting. The company also provides a MT tool that can be used on as much text as whished. It is also possible to use a plugin for DeepL a MT engine from another company. Both is usually used to make translations that later are edited. Google translate and Bing translator are both online translator provided by Google and Microsoft respectively  that both company also use in their other products CITE THE INFORMATION PAGE.  Except for the Bing translator all translations were done in bulk. The Microsoft translator for documents requires a self programmed base that had still several problems that could not be solved for this thesis. For that reason the sentences had to be translated in chunks of 5000 characters for German or 1000 Characters for English. There is as of now the possibility to program a document translator with Microsoft Azure but that did not work out for me. Bing, Google and in parts DeepL are all freely accessible the SDL Trados MT is bound to a paid for product I had access to due to the translation company I worked with. On a first look the translations seemed very similar to each other.



\subsection{BLEU}

BLEU is an easy tool as it is a comparison between the new translation and a reference translation. It is not a very sophisticated tool as it only compares sentence segments of different length and returns if they are equal [@BLEU]. Any change of capitalisation can be the difference between a score of 0 and 1, 1 being a identical translation and 0 a translation with no similarity. Therefor, the data had to be prepared before it was scored. First I replaced every "-" with a space as that was not a significant translation difference. After that I striped all the punctuation and parentheses as BLEU does not work with these. Next I converted everything to lower case. The problem of not matching words because of weird capitalisation was higher than wrongly identifying word as matching if they had a difference between word groups. One example was "auf Seite" and "Auf Seite" there the BLEU score would be 0.5 instead of 1 simply because of the capitalisation. The last preparations were made because BLEU needs the words to match exactly. With the preparation done the segments could be scored.



One of the tuning parameters for BLEU are the weights. The weights influence the importance of the n-grams.  Usually the n-grams from n = 1 to n = 4 are considered. Without tuning the n-grams are weighted equally. This did not lead to any satisfactory results as many of the segments I used resulted in a BLEU score of 0 even if the translation was equal. This was mainly due to the fact that many segments were very short and could not be properly rated to get a more adequate result I changed the weights a high weight for unigrams was most important but I gave the other n-grams also some weight so that they would be considered. In the end the weights were as follows (0.7, 0.15, 0.075, 0.075) in order from unigram to 4-gram. With this I had usable results even for the segments with less than 4 words.



The data was compared in different steps. Each sentence of each translation had a BLEU score calculated and was ranked against the other BLEU scores of the other translation. Additionally a corpus BLEU score, a commutative score of all sentences of one chapter was calculated. Different sets of references were also compared. First, only the human translation was a reference but for comparison I also used a one against all approach for the references, in two versions. First I compared all translators with each other but left out the humans as hypothesis. Secondly I include all translations even the human one as hypothesis so that for the calculation of the BLEU score for the human translation I used all the machine translations as a reference. The results will be discussed later.

\subsection{Translator study}

BLEU gave us a first impression of the quality of the MT but as it compares the translations to reference translations and I had only one verified good reference translation, the human translation. It was important to see if translators rate the MT similarly to the results from the BLEU score. In the following I describe the experiment with the translators.

\subsubsection{Data}

The number of sentences was very high, to keep the length of the study to an acceptable length for the participants this number had to be reduced. First it was necessary to filter out the interesting sentences for the study. The source sentences had to have a length between 6 and 15 words. The lower bound allowed to filter out most non sentences. @SentenceLength showed that 17 to 18 year olds could pass sentences with up to 15 words with ease, it also suggested that better readers could parse even longer sentences with relative ease but it seemed like a good cut of point to keep the length of the sentences manageable and time per sentence shorter. In the next step sentences that had identical translation in different translators were excluded. The sentence also had to have at least one score that differed from the others to guarantee diverse sentences. From that set of sentences 60 sentences were randomly sampled. Sentences with missing words and repeated sentences were manually excluded. Finally the first 50 sentences of that final set were used in the study. All these steps reduced the sentences to a good sample of all the sentences.

\subsubsection{Participants}

The participants were all professional translators that are employed by Wiezeke Consulting for projects.

\subsubsection{Experiment}

The experiment was done by the participants remotely and without supervision. Each participant received an e-mail with a link to the study. They were then given 50 source sentences with 5 translations for German and 4 four Czech this included all MT as well as the human translation. In each question they were given the source sentence and all translations. They were then asked to rate the quality of the translation on a 5 point Likert scale from "strongly agree" to "strongly disagree". At the beginning of the study they were instructed to select "strongly agree" if the translation was perfect and "strongly disagree" if the sentence needed a complete new translation. These sentences were presented to the participants in a random order different for each participant the order of the translators was randomised as well. Following these questions were the general questions about demographics and the personal use of MT in their normal translation process. Such as the frequency and extend of use of MTs. The expected time for answering the questions was about 30 Minutes in both languages. 

\section{Results}

In this section I will first present the results of the BLEU study, then the results of the Translator study and finally compare the results to each other.

\subsection{BLEU}

The BLEU scores are very similar between the different MTs. SIGNIFICANTS It is interesting to see that in the one against all comparison with the inclusion of the human translation as hypothesis the human translation is worse than the MT the reason for that is not that it is in fact worse but different from the other translations. 

TABLES

\subsection{Translators' study}

\subsection{Both in comparison}

\section{Discussion}

As can be seen above if the human translation is compared to all the machine translations as a reference the human translation as a worse result than the MT translations compared to the all other MTs and human translation. If seemed to be not as good of a translation as the others. This however is not the case. In the way BLEU works it compares a hypothesis translation to at minimum one reference translation. For that reason any result only shows how similar a translation is to the reference translation(s) with that in mind it is clear that the human translation is not worse but more different than the other translations. Even if compared to a different human translation the BLEU score should be below 1 CITE SOME OF THE BLEU PAPERS THE ONE WERE IT SAYS THAT EVEN HUMAN TRANSLATION HAS A DIFFERENT SCORE. This shows one of the shortcomings of BLEU it is only as good as the reference translation given.



SOMETHING ABUT THE REPOTING OF BLEU SCORES

With the changing of weights is the results are not directly comparable to other results. That is a common problem in the reporting of the BLEU results. Sometimes it is not clear which changes have been made to the code there is no one single BLEU score [@Clarity]. I can only compare the MT engines inside the study especially because they are all similar to each other. 

\section{Conclusion}


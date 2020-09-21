library(tidyverse)
# articles ----
articles = data.frame(stringsAsFactors=FALSE,
											cite = 
												c("Roden-Foreman, J. W., Rapier, N. R., Foreman, M. L., Zagel, A. L., Sexton, K. W., Beck, W. C., McGraw, C., Coniglio, R. A., Blackmore, A. R., Holzmacher, J., Sarani, B., Hess, J. C., Greenwell, C., Adams, C. A.,Jr, Lueckel, S. N., Weaver, M., Agrawal, V., Amos, J. D., Workman, C. F., Milia, D. J., Bertelson, A., Dorlac, W., Warne, M. J., Cull, J., Lyell, C. A., Regner, J. L., McGonigal, M. D., Flohr, S. D., Steen, S., Nance, M. L., Campbell, M., Putty, B., Sherar, D., & Schroeppel, T. J. (2019). Rethinking the definition of major trauma: The Need For Trauma Intervention outperforms Injury Severity Score and Revised Trauma Score in 38 adult and pediatric trauma centers. Journal of Trauma and Acute Care Surgery, 87(3), 658-665. doi: 10.1097/TA.0000000000002402" , 
													"Carey, S.A., Roden-Foreman, J.W., Felius, J., Tecson, K.M., Shelley, J., Hall, S.A., & Warren, A.M. (2019). Secondary traumatic stress in multi-disciplinary teams caring for heart and lung transplant patients. Traumatology, 25(4), 275–281. doi: 10.1037/trm0000188" , 
													"Teel, J., Reynolds, M., Bennett, M., Roden-Foreman, J.W., McShan, E., Hamilton, R., Driver, S., Powers, M.B., & Warren, A.M. (2019). Secondary traumatic stress among physiatrists treating patients with traumatic injury. Baylor University Medical Center Proceedings, 32(2), 209-214. doi: 10.1080/08998280.2018.1559694" , 
													"Roden-Foreman, J.W., Foreman, M.L., Funk, G.A., & Powers, M. (2019). Driver see, driver crash: Associations between televised stock car races' audience size and the incidence of speed-related motor vehicle collisions in the United States. Baylor University Medical Center Proceedings, 32(1), 37-42. doi: 10.1080/08998280.2018.1512275" , 
													"Asmundson, G. J. G., Thorisdottir, A. S., Roden-Foreman, J., Baird, S. O., Witcraft, S. M., Stein, A. T., Smits, J. A. J., & Powers, M. B. (2019). A meta-analytic review of cognitive processing therapy for posttraumatic stress disorder in adults. Cognitive Behaviour Therapy, 48(1), 1-14. doi: 10.1080/16506073.2018.1522371" , 
													"Culp, B. L., Roden-Foreman, J., Thomas, E. V., McShan, E. E., Bennett, M. M., Martin, K. R., Powers, M. B., Foreman, M. L., Petrey, L. B., & Warren, A. M. (2018). Better with age? A comparison of geriatric and non-geriatric trauma patients’ psychological outcomes six months post injury. Cognitive Behaviour Therapy, 48(5), 406-418. doi: 10.1080/16506073.2018.1533578" , 
													"Roden-Foreman, J.W., Rapier, N.R., Yelverton, L., & Foreman, M.L. (2018). Avoiding Cribari gridlock: The Standardized Triage Assessment Tool improves the accuracy of the Cribari Matrix Method in identifying potential over- and undertriage. Journal of Trauma and Acute Care Surgery, 84(5), 718-726. doi: 10.1097/TA.0000000000001814" , 
													"Agtarap, S., Shelley, J., Bennett, M., Roden-Foreman, J. W., Rainey, E., Dome, M., Powers, M. B., Petrey, L. B., & Warren, A. M. (2018). The role of depression and social support on readmission rates within one year of traumatic injury. Health Psychology, 37(9), 799-807. doi: 10.1037/hea0000590" , 
													"Roden-Foreman, J.W., Bennett, M.M., Rainey, E.E., Garrett, J.S., Powers, M.B., & Warren, A.M. (2017). Secondary traumatic stress in emergency medicine clinicians. Cognitive Behaviour Therapy, 46(6), 522-532. doi: 10.1080/16506073.2017.1315612" , 
													"Roden-Foreman, J.W., Rapier, N.R., Yelverton, L., & Foreman, M.L. (2017). Asking a better question: Development and evaluation of the Need For Trauma Intervention (NFTI) metric as a novel indicator of major trauma. Journal of Trauma Nursing, 24(3), 150-157. doi: 10.1097/JTN.0000000000000283" , 
													"Roden-Foreman, K., Solis, J., Jones, A., Bennett, M., Roden-Foreman, J., Rainey, E. E., Foreman, M. L., & Warren, A. M. (2017). Prospective evaluation of PTSD and depression in orthopedic injury patients with and without concomitant traumatic brain injury. Journal of Orthopaedic Trauma, 31(9), e275-e280. doi: 10.1097/BOT.0000000000000884" , 
													"McLaughlin, C., Kearns, N.T., Bennett, M.M., Roden-Foreman, J., Roden-Foreman, K., Rainey, E.E., Funk, G., Powers, M.B., & Warren, A.M. (2017). Alcohol and drug toxicology screen at time of hospitalization does not predict PTSD or depression after traumatic injury. American Journal of Surgery, 214(3), 390-396. doi: 10.1016/j.amjsurg.2017.06.026" , 
													"Roden-Foreman, J.W., Warren, A.M., Reynolds, M., & Foreman, M.L. (2015). Recurrent hospitalization for self-injuries and suicide attempts: Case study of a super-utilizer. Baylor University Medical Center Proceedings, 28(3), 331-333. doi: 10.1080/08998280.2015.11929264")
)


articles$authors_string = gsub("^(.*)( [(]\\d{4})(.*)$", "\\1", articles$cite)

articles$year = gsub("^(.*)( [(])(\\d{4})(.*)$", "\\3", articles$cite)

articles$title = gsub("^(.*)( [(])(\\d{4})([)]\\. )(.*?\\.)(.*)$", "\\5", articles$cite) %>%
	gsub("^(.*?)(\\.)$", "\\1", .) #remove period at end of string


articles$journal = gsub("^(.*)( [(])(\\d{4})([)]\\. )(.*?\\.)(.*)$", "\\6", articles$cite) %>% 
	gsub("^(.*?)(, .*)$", "\\1", .) %>% trimws()


articles$volume = gsub("^(.*)( [(])(\\d{4})([)]\\. )(.*?\\.)(.*)$", "\\6", articles$cite) %>% 
	gsub("^.*?,", "", .) %>% trimws() %>% #gets rid of journal name
	gsub("^(\\d+).*", "\\1", .)


articles$issue = gsub("^(.*)( [(])(\\d{4})([)]\\. )(.*?\\.)(.*)$", "\\6", articles$cite) %>% 
	gsub("^.*?,", "", .) %>% trimws() %>% #gets rid of journal name
	gsub("^(\\d+\\()(\\d+)(\\),).*", "\\2", .)



articles$page_start = gsub("^(.*)( [(])(\\d{4})([)]\\. )(.*?\\.)(.*)$", "\\6", articles$cite) %>% 
	gsub("^.*?,", "", .) %>% trimws() %>% #gets rid of journal name
	gsub("^(\\d+\\(\\d+\\), )([e]?\\d+).*", "\\2", .)



articles$page_end = gsub("^(.*)( [(])(\\d{4})([)]\\. )(.*?\\.)(.*)$", "\\6", articles$cite) %>% 
	gsub("^.*?,", "", .) %>% trimws() %>% #gets rid of journal name
	gsub("^(\\d+\\(\\d+\\), )([e]?\\d+)[[:punct:]]([e]?\\d+).*", "\\3", .)



articles$doi = gsub("^(.*)( [(])(\\d{4})([)]\\. )(.*?\\.)(.*)$", "\\6", articles$cite) %>% 
	gsub("^.*?,", "", .) %>% trimws() %>% #gets rid of journal name
	gsub("^(.*? doi[[:punct:]] )(.*)$", "\\2", .)






#~pull out individual authors ----
articles$authors_string = gsub(" &", "", articles$authors_string)

#make spacing of first and middle initials consistent
articles$authors_string = gsub("([[:upper:]]\\.) ", "\\1", articles$authors_string)


#make commas between authors into semicolons
articles$authors_string = gsub("\\., ", ".; ", articles$authors_string)

#take care of any suffixes too
articles$authors_string = gsub("(\\.,[[:alpha:]]{2,}), ", "\\1; ", articles$authors_string)



temp = strsplit(articles$authors_string, "; ")

authors = tibble(cite = rep(articles$cite, map(temp, length) %>% unlist()),
								 last_name = temp %>% flatten() %>% unlist() %>% gsub("^([^, ]*), .*", "\\1", .),
								 first_initial = temp %>% flatten() %>% unlist() %>% gsub("^([^, ]*), ([[:upper:]]).*", "\\2", .),
								 middle_initial = temp %>% flatten() %>% unlist() %>% 
								 	gsub("^([^, ]*), ([[:upper:]])\\.([[:upper:]])?\\.?", "\\3", .) %>%
								 	gsub("^([[:upper:]]*).*", "\\1", .),
								 suffix = temp %>% flatten() %>% unlist() %>% 
								 	gsub("(.*?)([[:alnum:]]{2,})?$", "\\2", .)
)

rm(temp)


authors$first_initial[authors$last_name=="Warren"] = "AM"
authors$middle_initial[authors$last_name=="Warren"] = ""


articles$order = nrow(articles):1

articles = merge(articles, authors) %>% 
	nest(authors = c(last_name, first_initial, middle_initial, suffix))

articles = articles[order(articles$order, decreasing = T), ]

rm(authors)


articles$type = "journal"


articles = articles %>% select(type, order, title, authors_string, year, journal, volume, issue,
															 page_start, page_end, doi, authors)



# articles = articles %>% unnest(., cols = authors)
# articles %>% nest(authors = c(last_name, first_initial, middle_initial, suffix))




# podiums ----

podiums = data.frame(stringsAsFactors=FALSE,
										 type = c("podium", "podium", "podium", "podium", "podium",
										 				 "podium", "podium", "podium", "podium",
										 				 "podium", "podium", "podium", "podium", "podium",
										 				 "podium", "podium", "podium", "podium"),
										 order = c(18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3,
										 					2, 1),
										 authors_string = c("Shelley, J., Roden-Foreman, J.W., Austin, E., Ramos, A.,
                                & Couch, C.", "Pappas, N., Thomas, E., Adams,
                                M., Roden-Foreman, J.W., & Rapier, N.",
										 									 "Roden-Foreman, J.W., Rapier, N.R., Foreman, M.L., Coniglio,
                                R.A., McGraw, C.E., Blackmore, A.R.,
                                The Trauma Measurement Workgroup.", "Roden-Foreman, J.W.,
                                Rapier, N.R., Foreman, M.L., Cribari, C.,
                                Parsons, M., Coniglio, R.A.,
                                The Trauma Measurement Workgroup.", "Roden-Foreman, J., Rapier, N.,
                                Yelverton, L., & Foreman, M.", "Roden-Foreman, J.W.,
                                Rainey, E.E., Bennett, M., Garrett, J.S.,
                                & Warren, A.M.", "Strage, K., Prajapati, P., Roden-Foreman,
                                J., Ewing, M., Adkins, C., Janning, K., Ogola,
                                G., Petrey, L., & Funk, G.", "Roth, J., Vaughan,
                                N., Alaidroos, I., Rainey, E.E., Roden-Foreman,
                                J., Powers, M., Garrett, J., & Foreman, M.L.",
										 									 "Roden-Foreman, J.W., Rapier, N.R., Yelverton, L.,
                                & Foreman, M.L.", "Edmundson, P., Roden-Foreman,
                                J.W., Rainey, E.E., Ewing, M., Rapier, N., Funk,
                                G., & Foreman, M.L.", "Vaughan, N., Roden-Foreman,
                                J.W., Dome, M., Joyce, S., Reynolds, M., Foreman,
                                M.L., & Funk, G.A.", "Edmundson, P.,
                                Roden-Foreman, J.W., Ewing, M., Rainey, E.E., Rapier, N.,
                                Funk, G., & Foreman, M.L.", "Roden-Foreman, J.W.,
                                Rapier, N.R, Yelverton, L., & Foreman, M.L.",
										 									 "Kleinschmidt, T.K., Funk, G.A., Ewing, M.,
                                Hernandez, O., Rainey, E., Daoud, Y., Roden-Foreman, J.W.,
                                & Foreman, M.L.", "Roden-Foreman, J.W., Rapier,
                                N.R, Yelverton, L., & Foreman, M.L.",
										 									 "Arrendondo, S.D., Gilder, R.E., Roden-Foreman, J.W.,
                                Foreman, M.L., & Petrey, L.B.", "Balogh, R., Edmundson,
                                P., Shirvani, A., Shah, A., Roden-Foreman, J.,
                                Reynolds, R., & Foreman, M.",
										 									 "Balogh, R.,
                                Edmundson, P., Shirvani, A., Shah, A., Roden-Foreman, J.,
                                & Foreman, M.L."),
										 year = c(2020, 2019, 2018, 2018, 2018, 2018, 2018, 2018, 2017,
										 				 2017, 2017, 2017, 2016, 2016, 2016, 2016, 2015,
										 				 2015),
										 title = c("A meta-analytic comparison of continuous intercostal nerve block and thoracic epidural for rib fractures",
										 					"IR better now: Streamlining emergent interventional radiology procedures with revised guidelines",
										 					"The Need For Trauma Intervention (NFTI) defines major trauma more accurately than Injury Severity Score (ISS) and Revised Trauma Score (RTS): Data from a collaboration of 35 adult and pediatric trauma centers",
										 					"Avoiding Cribari gridlock 2: The Standardized Triage Assessment Tool (STAT) outperforms the Cribari Matrix Method (CMM). A replication study in 35 adult and pediatric trauma centers",
										 					"New tools to reduce and standardize the triage review process",
										 					"Time to analgesia is not associated with trauma patients’ mental health or quality of life at baseline or six months",
										 					"Close enough? A retrospective cohort analysis on the safety and efficacy of discharging patients with high but down-trending pancreatic enzymes after admission for acute biliary pancreatitis",
										 					"Enoxaparin prophylaxis dose adjusted by antiXa trough levels in critically injured trauma patients",
										 					"Avoiding Cribari gridlock: The Standardized Triage Assessment Tool (STAT) provides standardized definitions of over- and undertriage that are more accurate than the Cribari Matrix Method",
										 					"Intrusion, ejection,
                                and death in the compartment: Mechanism-based trauma activation criteria fail to identify seriously injured patients",
										 					"What risk factors within the first 24 hours of admission are associated with mortality after traumatic injury?", "Intrusion, ejection,
                                and death in the compartment: Mechanism-based activation criteria fail to identify seriously injured patients",
										 					"Asking (and answering) a better question: Development and evaluation of the Need For Trauma Intervention (NFTI) metric",
										 					"Extracorporeal membrane oxygenation-assisted cardiopulmonary resuscitation: A single-center ECPR case review with matched cohort series of in-hospital cardiac arrest",
										 					"Asking (and answering) a better question: Development and evaluation of the Need For Trauma Intervention (NFTI) metric", "Death, taxes,
                                and readmissions: Analysis of regional hospital encounters following traumatic injury",
										 					"Sarcopenia as a marker of frailty: Psoas muscle size predicts functional outcome in mild to moderately injured trauma patients",
										 					"Sarcopenia and osteopenia as a marker of frailty and predictor of morbidity and mortality in the trauma population"),
										 conference = c("Annual Meeting of the North Texas Chapter of the American College of Surgeons",
										 							 "Trauma Quality Improvement Program 2019 Annual Meeting and Training",
										 							 "Annual Meeting of the American Association for the Surgery of Trauma",
										 							 "Annual Meeting of the American Association for the Surgery of Trauma",
										 							 "Trauma Center Association of America’s 21st Annual Trauma Conference",
										 							 "Annual Meeting of the North Texas Chapter of the American College of Surgeons",
										 							 "Annual Meeting of the North Texas Chapter of the American College of Surgeons",
										 							 "Annual Meeting of the Society of Critical Care Medicine",
										 							 "Annual Meeting of the American Association for the Surgery of Trauma",
										 							 "Scientific Forum of the American College of Surgeons’ Clinical Congress",
										 							 "Annual Meeting of the North and South Texas Chapters of the American College of Surgeons",
										 							 "Annual Meeting of the North and South Texas Chapters of the American College of Surgeons",
										 							 "Annual Scientific Meeting of the American College of Surgeons’ Trauma Quality Improvement Program",
										 							 "Semi-annual Meeting of the Texas Surgical Society",
										 							 "Semi-annual Meeting of the Texas Surgical Society", "Baylor Scott and White,
                                Department of Surgery Research Day",
										 							 "Annual Meeting of the American Association for the Surgery of Trauma", "Baylor Scott & White,
                                Department of Surgery Research Day"),
										 date = c("21-Feb-20", "16-Nov-19", "26-Sep-18", "26-Sep-18",
										 				 "2-May-18", "17-Feb-18", "16-Feb-18",
										 				 "25-Feb-18", "13-Sep-17", "22-Oct-17", "24-Feb-17",
										 				 "24-Feb-17", "6-Nov-16", "1-Oct-16", "1-Oct-16",
										 				 "12-May-16", "9-Sep-15", "1-May-15"),
										 place = c("Dallas, Texas", "Dallas, Texas", 
										 					"San Diego, California", "San Diego, California",
										 					"New Orleans, Louisiana", "Dallas, Texas",
										 					"Dallas, Texas", "San Antonio, Texas", "Baltimore, Maryland",
										 					"San Diego, California", "San Diego, California",
										 					"San Diego, California", "Orlando, Florida",
										 					"Dallas, Texas", "Dallas, Texas", "Temple, Texas",
										 					"Las Vegas, Nevada", "Temple, Texas")
)


podiums$date = lubridate::dmy(podiums$date)

podiums = podiums %>% mutate_if(is.character, ~gsub("\\s{2,}", " ", .))


#~pull out individual authors ----
podiums$authors_string = gsub(" &", "", podiums$authors_string)

#make spacing of first and middle initials consistent
podiums$authors_string = gsub("([[:upper:]]\\.) ", "\\1", podiums$authors_string)


#make commas between authors into semicolons
podiums$authors_string = gsub("\\., ", ".; ", podiums$authors_string)

#take care of any suffixes too
podiums$authors_string = gsub("(\\.,[[:alpha:]]{2,}), ", "\\1; ", podiums$authors_string)



temp = strsplit(podiums$authors_string, "; ")

authors = tibble(order = rep(podiums$order, map(temp, length) %>% unlist()),
								 last_name = temp %>% flatten() %>% unlist() %>% gsub("^([^, ]*), .*", "\\1", .),
								 first_initial = temp %>% flatten() %>% unlist() %>% gsub("^([^, ]*), ([[:upper:]]).*", "\\2", .),
								 middle_initial = temp %>% flatten() %>% unlist() %>% 
								 	gsub("^([^, ]*), ([[:upper:]])\\.([[:upper:]])?\\.?", "\\3", .) %>%
								 	gsub("^([[:upper:]]*).*", "\\1", .),
								 suffix = temp %>% flatten() %>% unlist() %>% 
								 	gsub("(.*?)([[:alnum:]]{2,})?$", "\\2", .)
)

rm(temp)


authors$first_initial[authors$last_name=="Warren"] = "AM"
authors$middle_initial[authors$last_name=="Warren"] = ""

authors$first_initial[authors$last_name == "The Trauma Measurement Workgroup."] = ""
authors$middle_initial[authors$last_name == "The Trauma Measurement Workgroup."] = ""
authors$last_name[authors$last_name == "The Trauma Measurement Workgroup."] = "The Trauma Measurement Workgroup"



podiums = merge(podiums, authors) %>% 
	nest(authors = c(last_name, first_initial, middle_initial, suffix))

podiums = podiums[order(podiums$order, decreasing = T), ]

rm(authors)



# podiums = podiums %>% unnest(., cols = authors)
# podiums %>% nest(authors = c(last_name, first_initial, middle_initial, suffix))



# posters ----

posters = data.frame(stringsAsFactors=FALSE,
										 type = c("poster", "poster", "poster", "poster", "poster",
										 				 "poster", "poster", "poster", "poster",
										 				 "poster", "poster", "poster", "poster", "poster",
										 				 "poster"),
										 order = c(15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1),
										 authors_string = c("Ramos, A., Pappas, N., Shelley, J.K., & Roden-Foreman,
                                J.W.", "Roden-Foreman, J.W., Shelley, J.K.,
                                Foreman, M.L., & Petrey, L.B.", "Roden-Foreman,
                                J.W., Shelley, J.K., Foreman, M.L., & Petrey, L.B.",
										 									 "Fitzgerald, H.E., Gorlin, E., Stein, A.,
                                Moshier, S., Grasso, D., Roden-Foreman, J.W., Powers,
                                M.B., & Otto, M.W.", "Roden-Foreman, J., Dome, M.,
                                Shelley, J., Troxel, W., Marshall, G., & Powers,
                                M.", "Roden-Foreman, J., Dome, M., Shelley, J.,
                                Troxel, W., Marshall, G., & Powers, M.",
										 									 "Roden-Foreman, J.W., & Agtarap, S.D.", "Arredondo, S.,
                                Dome, M., Gilder, R., Roden-Foreman, J., Foreman,
                                M.L., & Petrey, L.", "Roden-Foreman, J.W.,
                                Edmundson, P., & Foreman, M.L.", "Roden-Foreman, J.W.,
                                & Powers, M.B.", "Agtarap, S., Roden-Foreman, J.W.,
                                Natesan, P., & Foreman, M.L.", "Carey, S.A.,
                                Roden-Foreman, J.W., Bennett, M.M., Felius, J.,
                                Hall, S.A., & Warren, A.", "Roden-Foreman, J.W.,
                                Vaughan, N., Powers, M.B., Foreman, M.L., & Funk,
                                G.A.", "Edmundson, P., Roden-Foreman, J.W.,
                                & Foreman, M.L.", "Warren, A.M., Roden-Foreman, J.,
                                Adkins, C., Bennett, M., Agtarap, S., & Foreman,
                                M.L."),
										 year = c(2019, 2019, 2019, 2018, 2018, 2017, 2017, 2017, 2017,
										 				 2017, 2017, 2017, 2017, 2017, 2016),
										 title = c("Third time no charm? Examining the utility of tertiary surveys",
										 					"A hurdle to understanding: Current practices fail to capture intricacies of resource utilization",
										 					"Calling it: Factors present within one hour of arrival that predict mortality within the next five hours",
										 					"A novel topographical map approach for displaying PTSD intervention component efficacy",
										 					"Predicting sleep disturbances after trauma through racial and socioeconomic disparities",
										 					"Predicting sleep disturbances after trauma through racial and socioeconomic disparities", "Well,
                                that's not normal: A simulation study on the effects of testing Injury Severity Score with parametric statistics",
										 					"Identifying trauma super-utilizers’ readmissions with 11-year data model",
										 					"We don't need full activation: Gunshot wounds isolated to the extremities do not require full trauma team activations as mandated by the American College of Surgeons", "Driver see,
                                driver crash: Social contagion, NASCAR ratings,
                                and the monthly incidence of car crashes",
										 					"Assessing violated assumptions on two-sample independent testing using simulation: Robustness for non-normal medical variables",
										 					"Does caring for heart and lung transplant patients lead to psychological stress in multi-disciplinary care teams?", "Driver see,
                                driver crash: NASCAR viewership ratings are associated with national increases in motor vehicle collisions with and without injury",
										 					"We don’t need full activation: Gunshot wounds isolated to the extremities do not require full trauma team activations as mandated by the American College of Surgeons",
										 					"A comparison of geriatric and non-geriatric patients’ psychosocial outcomes following traumatic injury"),
										 conference = c("Trauma Quality Improvement Program 2019 Annual Meeting and Training",
										 							 "Trauma Quality Improvement Program 2019 Annual Meeting and Training",
										 							 "Annual Meeting of the American Association for the Surgery of Trauma",
										 							 "Annual Conference of the Association for Behavioral and Cognitive Therapies",
										 							 "Annual Meeting of the North Texas Chapter of the American College of Surgeons",
										 							 "Annual Meeting of the International Society for Traumatic Stress Studies",
										 							 "Annual Meeting of the American Association for the Surgery of Trauma",
										 							 "Scientific Forum of the American College of Surgeons’ Clinical Congress",
										 							 "Scientific Forum of the American College of Surgeons’ Clinical Congress",
										 							 "Annual Convention of the American Psychological Association",
										 							 "Annual Convention of the Association for Psychological Science",
										 							 "Annual Meeting of the International Society for Heart & Lung Transplantation",
										 							 "Annual Meeting of the North and South Texas Chapters of the American College of Surgeons",
										 							 "Annual Meeting of the North and South Texas Chapters of the American College of Surgeons",
										 							 "Annual Meeting of the North Texas Chapter of the American College of Surgeons"),
										 date = c("16-Nov-19", "16-Nov-19", "18-Sep-19", "15-Nov-18",
										 				 "17-Feb-18", "9-Nov-17", "13-Sep-17",
										 				 "22-Oct-17", "22-Oct-17", "3-Aug-17", "25-May-17",
										 				 "5-Apr-17", "24-Feb-17", "24-Feb-17", "20-Feb-16"),
										 place = c("Dallas, Texas", "Dallas, Texas", "Dallas, Texas",
										 					"Washington, DC", "Dallas, Texas", "Chicago,
                                Illinois", "Baltimore, Maryland", "San Diego,
                                California", "San Diego, California", "Washington,
                                DC", "Boston, Massachusetts", "San Diego,
                                California", "Austin, Texas", "Austin, Texas", "Dallas,
                                Texas"), 
										 doi = c("", "", "", "", "", "", "", "", "", "", "", 
										 				"10.1016/j.healun.2017.01.1010", "", "", "")
)


posters$date = lubridate::dmy(posters$date)

posters = posters %>% mutate_if(is.character, ~gsub("\\s{2,}", " ", .))


#~pull out individual authors ----
posters$authors_string = gsub(" &", "", posters$authors_string)

#make spacing of first and middle initials consistent
posters$authors_string = gsub("([[:upper:]]\\.) ", "\\1", posters$authors_string)


#make commas between authors into semicolons
posters$authors_string = gsub("\\., ", ".; ", posters$authors_string)

#take care of any suffixes too
posters$authors_string = gsub("(\\.,[[:alpha:]]{2,}), ", "\\1; ", posters$authors_string)



temp = strsplit(posters$authors_string, "; ")

authors = tibble(order = rep(posters$order, map(temp, length) %>% unlist()),
								 last_name = temp %>% flatten() %>% unlist() %>% gsub("^([^, ]*), .*", "\\1", .),
								 first_initial = temp %>% flatten() %>% unlist() %>% gsub("^([^, ]*), ([[:upper:]]).*", "\\2", .),
								 middle_initial = temp %>% flatten() %>% unlist() %>% 
								 	gsub("^([^, ]*), ([[:upper:]])\\.([[:upper:]])?\\.?", "\\3", .) %>%
								 	gsub("^([[:upper:]]*).*", "\\1", .),
								 suffix = temp %>% flatten() %>% unlist() %>% 
								 	gsub("(.*?)([[:alnum:]]{2,})?$", "\\2", .)
)

rm(temp)


authors$first_initial[authors$last_name=="Warren"] = "AM"
authors$middle_initial[authors$last_name=="Warren"] = ""




posters = merge(posters, authors) %>% 
	nest(authors = c(last_name, first_initial, middle_initial, suffix))

posters = posters[order(posters$order, decreasing = T), ]

rm(authors)


# posters = posters %>% unnest(., cols = authors)
# posters %>% nest(authors = c(last_name, first_initial, middle_initial, suffix))




# merge datasets ----


articles = articles %>% unnest(., cols = authors)
podiums = podiums %>% unnest(., cols = authors)
posters = posters %>% unnest(., cols = authors)

mdata = plyr::rbind.fill(articles, podiums, posters)


mdata$title = gsub("’", "'", mdata$title) #replace curved quotation mark/apostrophe with straight one

write.csv(mdata, "pubs database long version.csv", row.names = F)


articles = articles %>% nest(authors = c(last_name, first_initial, middle_initial, suffix))
podiums = podiums %>% nest(authors = c(last_name, first_initial, middle_initial, suffix))
posters = posters %>% nest(authors = c(last_name, first_initial, middle_initial, suffix))

articles = articles %>% select(-authors)
podiums = podiums %>% select(-authors)
posters = posters %>% select(-authors)

mdata = plyr::rbind.fill(articles, podiums, posters)
mdata$title = gsub("’", "'", mdata$title) #replace curved quotation mark/apostrophe with straight one


write.csv(mdata, "pubs database.csv", row.names = F)

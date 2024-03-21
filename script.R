library(tidyverse)
library(urltools)
library(tidygeocoder)

pull_domain <- function(vec) {
  domain_df <- suffix_extract(domain(vec))
  return(domain_df$host)
}

#email_header <- "admissions@nnu.edu, admissions@northwestu.edu, admissions@nwciowa.edu, recruit@nwosu.edu, applications@nsula.edu, ug-admission@northwestern.edu, admissions@qatar.northwestern.edu, admit@northwood.edu, miadmit@northwood.edu, nuadm@norwich.edu, admiss@ndnu.edu, admiss@ndm.edu, admissions@nscad.ca, admissions@nova.edu, admissions@nyack.edu, admissions@oakhills.edu, admission@oak.edu, visit@oakland.edu, admission@oakwood.edu, college.admissions@oberlin.edu, conservatory.admissions@oberlin.edu, admission@oxy.edu, admission@oglethorpe.edu, admissions@ohiodominican.edu, admissions-ug@onu.edu, admissions@ohio.edu, admissions@ovu.edu, owuadmit@owu.edu, admissions@okbu.edu, admissions@oc.edu, admissions@okcu.edu, uadmissions@okcu.edu, opsu@opsu.edu, admissions@okstate.edu, admissions@okwu.edu, admissions@odu.edu, admissions@olemiss.edu, admissions@olivetcollege.edu, admissions@olivet.edu, admissions@oru.edu, admissions@ocac.edu, oit@oit.edu, osuadmit@oregonstate.edu, admissions@otis.edu, admiss@ottawa.edu, uotterb@otterbein.edu, admissions@obu.edu, admission@ollusa.edu, appprocessing@pace.edu, admission@plu.edu, admissions@pnca.edu, admissions@pacificoaks.edu, admissions@puc.edu, admissions@pacificu.edu, paier.admission@snet.net, admissions@paine.edu, admit@pba.edu, parkvilleadmissions@park.edu, thinkparsons@newschool.edu, admissions@phc.edu, apply@pqc.edu, admissions@paulsmiths.edu, admissions@peirce.edu, admissions@psu.edu, admissions@pafa.edu, admissions@pct.edu, behrend.admissions@psu.edu, abingtonadmissions@psu.edu, aaadmit@psu.edu, br-admissions@psu.edu, berksadmissions@psu.edu, bwadmissions@psu.edu, kcn3@psu.edu, feadm@psu.edu, psuga@psu.edu, hbgadmit@psu.edu, hn-admissions@psu.edu, admissions-lv@psu.edu, psuma@psu.edu, nkadmissions@psu.edu, sl-admissions@psu.edu, psushenango@psu.edu, wbadmissions@psu.edu, wsadmissions@psu.edu, ykadmission@psu.edu, admission-seaver@pepperdine.edu, admissions@peru.edu, admissions@pfeiffer.edu, admissions@philander.edu, ugrad@piedmont.edu, admissions@piedmontu.edu, admissions@pmc.edu, psuadmit@pittstate.edu, admission@pitzer.edu, admissions@plymouth.edu, plymouthadmit@plymouth.edu, admissions@pointloma.edu, enroll@pointpark.edu, admissions@point.edu, studentservices@polk.edu, tcardona@pupr.edu, admissions@pomona.edu, admisiones@pucpr.edu, admissions@pcj.edu, admissions@pdx.edu, admissions@potomac.edu, admissions@pvamu.edu, admissions@pratt.edu, admissions@presby.edu, admissions@prescott.edu, admit@presentation.edu, uaoffice@princeton.edu, collegeadmissions@principia.edu, pcadmiss@providence.edu, ask@pfw.edu, admissions@pnw.edu, admission@queensu.ca, admissions@queens.edu, admissions@questu.ca, admissions@quincy.edu, admissions@qu.edu, admissions@radford.edu, admissions@ramapo.edu, admissions@randolphcollege.edu, admissions@rmc.edu, admission@reed.edu, admissions@regent.edu, admit@regents.ac.uk, admission@regiscollege.edu, ruadmissions@regis.edu, admissions@reinhardt.edu, admissions@rpi.edu, leslie.burry@researchcollege.edu, admissions@resu.edu, admissions@ric.edu, admissions@risd.edu, dataservices@rhodes.edu, adminfo@rhodes.edu, admi@rice.edu, usadmissions@richmond.ac.uk, admissions@rider.edu, info@rbs.lv, admissions@ringling.edu, adminfo@ripon.edu, welcome@apu.ac.jp, admissions@rivier.edu, admissions@roanoke.edu, ugoffice@rgu.ac.uk, enroll@robertmorris.edu, admissions@rmu.edu, admissions@roberts.edu, admissions@rc.edu, admissions@rit.edu, admissions@rockford.edu, admissions@rockhurst.edu, admissions@rocky.edu, admissions@rmcad.edu, admit@rwu.edu, admissions@rsu.edu, admission@rollins.edu, admission@roosevelt.edu, admissions@rose-hulman.edu, admissions@rosemont.edu, admissions@rowan.edu, rmc_admissions@rush.edu, admissions@rustcollege.edu, admissions@camden.rutgers.edu, admissions@ugadm.rutgers.edu, newark@admissions.rutgers.edu, international@ryerson.ca, admissions@shms.edu, enroll@sacredheart.edu, contact@sage.edu, admissions@svsu.edu, aicinfo@sagu.edu, admission@anselm.edu, admissions@st-aug.edu, admissions@francis.edu, admissions@sjcme.edu, admit@sju.edu, admissions@saintleo.edu, admission@slu.edu, admissions-madrid@slu.edu, admissions@stmartin.edu, admission@smwc.edu, admission@saintmarys.edu, smcadmit@stmarys-ca.edu, admission@smumn.edu, admission@smcvt.edu, admissions@saintpeters.edu, admission@stvincent.edu, admission@sxu.edu, admissions@salem.edu, admissions@salemstate.edu, admissions@salisbury.edu, sruadmis@salve.edu, admissions@shsu.edu, admission@samford.edu, admissions@sdcc.edu, admissions@sdsu.edu, admissions@sfai.edu, admit@sfcm.edu, ugadmit@sfsu.edu, admissions@sjsu.edu, admission@scu.edu, slcadmit@sarahlawrence.edu, admission@scad.edu, admissions@savannahstate.edu, admiss@saic.edu, smfaadmissions@tufts.edu, admissions@sva.edu, admissions@schreiner.edu, admission@scrippscollege.edu, admissions@spu.edu, admissions@seattleu.edu, thehall@shu.edu, admit@setonhill.edu, admiss@sewanee.edu, admissions@shasta.edu, admissions@shawu.edu, to_ssu@shawnee.edu, admit@su.edu, admission@shepherd.edu, admiss@ship.edu, admissions@shorter.edu, admissions@siena.edu, admissions@sienaheights.edu, admissions@sierranevada.edu, admslc@sl.edu, ugadm@simmons.edu, admissionsteam@sfu.ca, admiss@simpson.edu, admissions@simpsonu.edu, admissions@skidmore.edu, asktherock@sru.edu, admission@smith.edu, admission@soka.edu, student.outreach@sonoma.edu, admissions@scsu.edu, admissions@sdsmt.edu, sdsu.admissions@sdstate.edu, admissions@semo.edu, admissions@sebts.edu, admissions@southeastern.edu, admissions@se.edu, admission@seu.edu, admissions@southern.edu, muleriders@saumag.edu, admissions@sciarc.edu, admissions@southernct.edu, leeg1@southernct.edu, admissions@siu.edu, admissions@siue.edu, ugadmission@smu.edu, admissions@snu.edu, admission@snhu.edu, admissions@sou.edu, admit@subr.edu, lgarrett@suno.edu, adminfo@suu.edu, admissions@svc.edu, admissions@svu.edu, admissions@swu.edu, admissions@sbuniv.edu, smsu.admissions@smsu.edu, admissions@suva.edu, admissions@swau.edu, admissions@sagu.edu, admissions@swcu.edu, scadmit@sckans.edu, admissions@swosu.edu, admission@southwestern.edu, admissions@spalding.edu, admissions@spelman.edu, admissions@arbor.edu, admit@shc.edu, admissions@springfieldcollege.edu, admit@sau.edu, admissions@sa.edu, admissions@sacn.edu, admissions@sbu.edu, admissions@stkate.edu, scsu4u@stcloudstate.edu, seu.admit@stedwards.edu, admissions@sfc.edu, conadmissions@osfhealthcare.org, admissions@sjfc.edu, annapolis.admissions@sjc.edu, santafe.admissions@sjc.edu, admissions@sjc.edu, admhelp@stjohns.edu, brooklynas@sjcny.edu, bkadmissions@sjcny.edu, liadmissions@sjcny.edu, longislandas@sjcny.edu, admissions@stlawu.edu, admissions@stlchristian.edu, admissions@stlcop.edu, admit@stmarys.ac.uk, ada.caraballo@fajardo.inter.edu, admissions@smcm.edu"

#emails <- str_split(email_header,",")
#emails <- unlist(emails)
#emails <- str_trim(emails)

#emails_df <- as.data.frame(emails)
emails_df <- read_csv("emails_df.csv")

domain_split <- str_split(emails,"@")

targeted_domains <- c()

for (i in 1:length(domain_split)) {
  targeted_domains <- c(targeted_domains,domain_split[[i]][2])
}

targeted_domains <- unique(targeted_domains)

targeted_df <- suffix_extract(domain(targeted_domains))

df <- read_csv("ipeds/hd2022.csv")
df$WEBADDR <- pull_domain(df$WEBADDR)

df$WEBADDR <- gsub("www.","",df$WEBADDR)

targeted_df <- targeted_df %>% select(host)

colnames(targeted_df) <- c("WEBADDR")

targeted_df <- left_join(targeted_df,df,by="WEBADDR")

df <- targeted_df

test <- as.data.frame(table(df$CCBASIC)) %>% arrange(-Freq)

pres_names <- df$CHFNM[!is.na(df$CHFNM)]
pres_names <- gsub("Dr.","",pres_names)
pres_names <- str_trim(pres_names)
pres_names <- str_split(pres_names," ")

pres_vec <- c()

for (i in 1:length(pres_names)) {
  pres_vec <- c(pres_vec,pres_names[[i]][1])
}

adm <- read_csv("ipeds/adm2022.csv")

df <- left_join(df,adm,by="UNITID")

df <- cbind(df,ADM_RATE=NA)
df$ADM_RATE <- df$ADMSSN / df$APPLCN

df <- cbind(df,addr_recoded=NA)
df$addr_recoded <- paste(df$ADDR,df$CITY,df$STABBR,sep=", ")

df <- df %>% geocode(addr_recoded, method = 'osm', lat = latitude , long = longitude)

map_df <- df %>% select(WEBADDR,UNITID,INSTNM,ADDR,CITY,STABBR,ZIP,FIPS,addr_recoded,latitude,longitude)

